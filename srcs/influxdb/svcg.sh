#!/bin/bash


eval $(minikube docker-env)

kubectl delete deploy influx-deploy
kubectl delete svc influx-svc
#kubectl delete pods nginx.conf
#kubectl get pods
docker build -t influx_img .
kubectl apply -f ../configmap.yaml
kubectl apply -f influxdb.yaml
kubectl get deploy
