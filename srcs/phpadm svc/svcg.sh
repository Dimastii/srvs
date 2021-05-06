#!/bin/bash

eval $(minikube docker-env)

kubectl delete deploy phpadm-deployment
kubectl delete svc phpadm-svc
#kubectl get pods
docker build -t phpadm_img .
kubectl apply -f ../configmap.yaml
kubectl apply -f ./phpadm.yaml
kubectl get deploy
