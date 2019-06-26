## Thoughtworks Exercise ##

## Pre-Requesties

Assuming we have Amazon EKS or Azure AKS or Stable Kubernetes cluster on Cloud.
Tested the deployments on Kubernetes 1.8 version (kubectl 1.8)
Docker is installed

There are separate folders for static and app. Change directories to to build and deploy

## Create EKS CLuster
Run the cluster.sh script to create EKS cluster.
Add the IAM keys and update other parameters to create EKS cluster with mentioned values

## Build Steps

Update the Dockerfile only to update the path of static.zip and companyNews.war location.

To Build the docker image modify the Docker repository settings and TAG in the build.sh
Execute build.sh to create a docker image.

$ sh build.sh

## Deployment Steps

We have workload configured for Web and App as company-news.yml and static.yml respectively.
Change the Docker image and other paramaeters as required.

$ kubectl apply -f workload.yml


