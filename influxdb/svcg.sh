#!/bin/bash


eval $(minikube docker-env)

kubectl delete deploy influxdb-deployment
kubectl delete svc influxdb-svc
#kubectl delete pods nginx.conf
#kubectl get pods
docker build -t influxdb_img .
kubectl apply -f ../configmap.yaml
kubectl apply -f influxdb.yaml
kubectl get deploy
