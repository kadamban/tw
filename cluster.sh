#!/bin/bash
IAM_ACCESS=""
IAM_SECRET=""
REGION="ap-south-1"
ZONES="ap-south-1a,ap-south-1b"
EKSCTL="/tmp/eksctl"
INSTANCE_TYPE="t2.micro"
NODES_MIN=1
NODES_MAX=3
CLUSTER_NAME="eksnew"
KUBE_VERSION=1.13
NODES=2
#echo `$EKSCTL version`

curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$HOME/bin:$PATH
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

export AWS_ACCESS_KEY_ID=$IAM_ACCESS
export AWS_SECRET_ACCESS_KEY=$IAM_SECRET

#while true; do
#    read -p "Does your IAM account has enough permissions to create EKS Cluster?" yn
#    case $yn in
#        [Yy]* ) echo "Lets create EKS cluster";;
#        [Nn]* ) exit;;
#        * ) echo "Please answer yes or no.";;
#    esac
#done

$EKSCTL create cluster --region=$REGION --zones=$ZONES  --name=$CLUSTER_NAME --version=$KUBE_VERSION --nodes=$NODES --nodes-min=$NODES_MIN --nodes-max=$NODES_MAX --node-type=$INSTANCE_TYPE

echo "EKS Cluster is created"
echo "For AWS Access issue, Add your IAM keys to your aws profile"
echo "Download kubectl version for the cluster version"
echo "URL : curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubectl"
