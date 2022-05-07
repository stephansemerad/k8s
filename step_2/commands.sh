
# Check if everything still works from step 1. 
curl echo1.stephansemerad.com
curl -Li echo1.stephansemerad.com 

# 1 Install Cert Manager
# https://artifacthub.io/packages/helm/cert-manager/cert-manager


kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.0/cert-manager.crds.yaml

kubectl get crds

helm repo add jetstack https://charts.jetstack.io
helm repo list
helm repo update jetstack

kubectl create namespace cert-manager
helm install cert-manager -n cert-manager --version v1.8.0 jetstack/cert-manager


#verify installation 
kubectl get all -n cert-manager
kubectl get crds
kubectl get secrets

#create the cert manager issuer
kubectl apply -f issuer-prod.yaml

kubectl get order  # Im going to make a chanllege
kubectl get challenges # This is the challenge
kubectl get certificaterequests # Request for a challenge.
kubectl get certificate # End result

# set up issuer 
kubectl apply -f issuer-prod.yaml

# check 
curl -li https://echo1.stephansemerad.com/ 
curl -li https://echo1.stephansemerad.com/ 