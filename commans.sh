# 1. Install ingress-nginx - https://artifacthub.io/
# https://kubernetes.github.io/ingress-nginx/

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.0/deploy/static/provider/cloud/deploy.yaml
kubectl get svc -n ingress-nginx 

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

kubectl get all -n ingress-nginx


# 2, create the app. 
# traffice -> load balancer -> ingress-nginx -> service (CLUSTER-IP) -> pod -> container

kubectl create ns backend
kubectl create -f quote/deployment.yaml
kubectl create -f quote/service.yaml
kubectl get all -n backend

# deletion 
kubectl delete svc quote -n backend
kubectl delete deploy quote -n backend #


# 3. configure ingress rules

kubectl apply -f ingress.yaml
kubectl -n backend get ingress

curl echo1.stephansemerad.com
curl echo1.stephansemerad.com


kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.7.1/cert-manager.yaml

kubectl apply -f issuer.yaml

kubectl get clusterissuers


kubectl delete --all pods
kubectl delete --all namespaces
kubectl delete --all deployments --namespace=foo
