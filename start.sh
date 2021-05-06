#!/bin/bash


#rm .minikube
#rm .docker

#brew reinstall minikube
minikube delete

#mv .docker ./goinfre
#mv .minikube ./goinfre
#ln -s ./goinfre/.docker .docker
#ln -s ./goinfre/.minikube .minikube

VBoxManage hostonlyif remove vboxnet0
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)

minikube addons enable metallb

#kubectl delete deploy nginx.conf-deployment
#kubectl delete svc nginx.conf-svc
#kubectl delete pods nginx.conf
#kubectl get pods


docker build -t nginx_img ./srcs/nginx\ svc/
docker build -t sql_img ./srcs/sql\ svc/
docker build -t phpadm_img ./srcs/phpadm\ svc/
docker build -t word_img ./srcs/word\ svc/
docker build -t ftps_img ./srcs/ftps\ svc/
docker build -t grafana_img ./srcs/grafana\ svc/
docker build -t influx_img ./srcs/influxdb/

kubectl apply -f configmap.yaml

kubectl apply -f srcs/nginx\ svc/ng.yaml
kubectl apply -f srcs/sql\ svc/sql.yaml
kubectl apply -f srcs/phpadm\ svc/phpadm.yaml
kubectl apply -f srcs/word\ svc/word.yaml
kubectl apply -f srcs/ftps\ svc/ftps.yaml
kubectl apply -f srcs/grafana\ svc/grafana.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml

kubectl get deploy
minikube dashboard
ssh-keygen -f "/Users/cveeta/.ssh/known_hosts" -R 192.168.99.241