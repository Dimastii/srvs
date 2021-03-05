#!/bin/bash

eval $(minikube docker-env)

kubectl delete deploy word-deployment
kubectl delete svc word-svc
#kubectl get pods
docker build -t word_img .
kubectl apply -f ../configmap.yaml
kubectl apply -f ./word.yaml
kubectl get deploy
