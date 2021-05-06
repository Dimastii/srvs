#!/bin/bash


eval $(minikube docker-env)

kubectl delete deploy ftps-deployment
kubectl delete svc ftps-svc
#kubectl delete pods nginx.conf
#kubectl get pods
docker build -t ftps_img .
kubectl apply -f ../configmap.yaml
kubectl apply -f ftps.yaml
kubectl get deploy
