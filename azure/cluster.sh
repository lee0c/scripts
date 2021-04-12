#!/usr/bin/env bash

if [[ "$#" -eq 0 ]]; then
    echo "USAGE: ./cluster.sh [\$RG_NAME] \$CLUSTER_NAME"
    exit 0
fi

if [[ "$#" -eq 2 ]]; then
    az group create \
        --name $1
    az configure --defaults group=$1
    shift
fi

MONITORING_WORKSPACE=$(az resource show \
    --resource-type=Microsoft.OperationalInsights/workspaces \
    --name lecattar-loganalytics \
    --query "id" --output tsv \
    2>/dev/null)

if [[ -z "$MONITORING_WORKSPACE" ]]; then
    MONITORING_WORKSPACE=$(az resource create \
        --resource-type=Microsoft.OperationalInsights/workspaces \
        --name lecattar-loganalytics \
        -p '{"sku":{ "Name": "Standalone"} }' \
        --query "id" --output tsv)
fi

AKS_VERSION=$(az aks get-versions -l westus2 --query 'orchestrators[-1].orchestratorVersion' -o tsv)

az aks create \
    --name $1 \
    --nodepool-name linux --node-count 1 --node-vm-size "Standard_D2s_v3" \
    --enable-addons monitoring \
    --workspace-resource-id $MONITORING_WORKSPACE \
    --ssh-key-value "$HOME/.ssh/id_rsa.pub" \
    --admin-username $(whoami) --kubernetes-version "$AKS_VERSION" \
    --query "{ name: name, resourceGroup: resourceGroup }"

az aks get-credentials \
    --name $1
