#!/bin/bash


eval $(minikube docker-env)

kubectl delete deploy sql-deployment
kubectl delete svc sql-svc
#kubectl delete pods nginx.conf
#kubectl get pods
docker build -t sql_img .
kubectl apply -f ../../configmap.yaml
kubectl apply -f ./sql.yaml
kubectl get deploy
