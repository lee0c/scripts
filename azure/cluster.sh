#!/bin/bash

if [[ "$#" -eq 0 ]]; then
    echo "USAGE: ./cluster.sh [\$RG_NAME\] \$CLUSTER_NAME"
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

az aks create \
    --name $1 \
    --nodepool-name linux --node-count 1 --node-vm-size "Standard_DS3_v2" \
    --enable-vmss --enable-addons monitoring \
    --workspace-resource-id $MONITORING_WORKSPACE \
    --ssh-key-value "$HOME/.ssh/id_rsa.pub" \
    --admin-username $(whoami) --kubernetes-version "1.14.6" \
    --query "{ name: name, resourceGroup: resourceGroup }"

az aks get-credentials \
    --name $1
