#rm .minikube
#rm .docker

#brew reinstall minikube
minikube delete
##
#mv .docker ./goinfre
#ln -s ./goinfre/.docker .docker

VBoxManage hostonlyif remove vboxnet0
minikube start --vm-driver=virtualbox
#mv .minikube ./goinfre
#ln -s ./goinfre/.minikube .minikube
eval $(minikube docker-env)

minikube addons enable metallb

#kubectl delete deploy nginx-deployment
#kubectl delete svc nginx-svc
#kubectl delete pods nginx
#kubectl get pods
docker build -t nginx_img ./nginx\ svc/
docker build -t sql_img ./sql\ svc/
kubectl apply -f configmap.yaml
kubectl apply -f nginx\ svc/ng.yaml
kubectl apply -f sql\ svc/sql.yaml
kubectl get deploy
minikube dashboard
ssh-keygen -f "/Users/cveeta/.ssh/known_hosts" -R 192.168.99.240