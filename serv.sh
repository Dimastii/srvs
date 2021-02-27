#rm .minikube
#rm .docker

brew reinstall minikube
#
#mv .docker ./goinfre
#ln -s ./goinfre/.docker .docker

minikube start --vm-driver=virtualbox
#mv .minikube ./goinfre
#ln -s ./goinfre/.minikube .minikube

eval $(minikube docker-env)

minikube addons enable metallb
kubectl delete deploy nginx-deployment
kubectl delete svc nginx-svc
#kubectl delete pods nginx
#kubectl get pods
docker build -t nginx_img .
kubectl apply -f configmap.yaml
kubectl apply -f ng.yaml
kubectl get deploy