#!/bin/bash


eval $(minikube docker-env)

kubectl delete deploy nginx-deployment
kubectl delete svc nginx-svc
#kubectl delete pods nginx.conf
#kubectl get pods
docker build -t nginx_img .
kubectl apply -f ../configmap.yaml
kubectl apply -f ng.yaml
kubectl get deploy
