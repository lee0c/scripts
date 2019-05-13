#!/bin/bash

if [[ "$#" -ne 2 ]]; then
    echo "USAGE: ./cluster.sh \$RG_NAME \$CLUSTER_NAME"
    exit 0
fi

az group create \
    --resource-group $1 \
    --location westus2 \
    --verbose

az aks create \
    --resource-group $1 \
    --name $2 \
    --admin-username $(whoami) \
    --kubernetes-version "1.13.5" \
    --node-count 1 \
    --verbose

az aks get-credentials \
    --resource-group $1 \
    --name $2
