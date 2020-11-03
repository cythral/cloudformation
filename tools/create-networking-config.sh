#!/bin/bash


get_export() {
    stack=$1
    name=$2

    echo -n $(aws cloudformation list-exports --query Exports[?Name==\`${stack}:${name}\`].Value --output text);
}

devPeeringConnectionId=$(get_export cfn-core DevPeeringConnectionId)
prodPeeringConnectionId=$(get_export cfn-core ProdPeeringConnectionId)
addresses=$(curl -so- https://ip-ranges.amazonaws.com/ip-ranges.json | jq -r '.prefixes | map(select(.region == "us-east-1")) | map(.ip_prefix) | join(",")')

config={}
config=$(echo $config | jq ".DevPeeringConnectionId=\"$devPeeringConnectionId\"") 
config=$(echo $config | jq ".ProdPeeringConnectionId=\"$prodPeeringConnectionId\"")
config=$(echo $config | jq ".AwsIpRanges=\"$addresses\"")

echo $config