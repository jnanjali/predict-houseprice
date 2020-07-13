#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=anjalicurie/kubetest:1.0

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run kubehouse  --image=anjalicurie/kubetest:1.0 

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployments/kubehouse 8000:80 
