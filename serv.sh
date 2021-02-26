brew reinstall minikube

mv .docker ./goinfre
ln -s ./goinfre/.docker .docker

minikube start --vm-driver=virtualbox
mv .minikube ./goinfre
ln -s ./goinfre/.minikube .minikube

eval $(minikube docker-env)
