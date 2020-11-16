#!/bin/bash

echo "[host]" > inventory

# Copy instnce with value Capstone to inventory
aws ec2 describe-instances \
\
        --query 'Reservations[*].Instances[*].PublicIpAddress' \
      --filters "Name=tag:Name,Values=Capstone" \
      --output text >> /ansible/inventory