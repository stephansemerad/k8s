# 1. Install ingress-nginx - https://artifacthub.io/
# https://kubernetes.github.io/ingress-nginx/

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.0/deploy/static/provider/cloud/deploy.yaml
kubectl get svc -n ingress-nginx 

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

kubectl get all -n ingress-nginx


# 2. Add the subdomains to the DNS and to the Load Balancer

# 3. Install everything

kubectl apply -f echo1.yaml
kubectl apply -f echo2.yaml
kubectl apply -f ingress.yaml



# Only proceed if you can curl 
curl echo2.stephansemerad.com
echo2

curl echo1.stephansemerad.com
echo1