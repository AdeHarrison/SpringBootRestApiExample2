#!/usr/bin/env bash
clear
#kubectl delete service my-web-service
#kubectl delete deployment my-web-deployment
#kubectl create -f deployment-web.yml
#kubectl describe deploy my-web-deployment
#kubectl describe service my-web-service
#sleep 15
#NODEPORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services my-web-service)
#echo $NODEPORT
#curl 192.168.99.100:$NODEPORT/SpringBootRestApi/api/user/

eval $(minikube docker-env)
docker run -d -p 5000:5000 --restart=always --name registry registry:2

mvn clean package
docker build -t localhost:5000/springbootrestapiexample2 .
docker push localhost:5000/springbootrestapiexample2
kubectl delete service service-springbootrestapiexample2
kubectl delete deployment deployment-springbootrestapiexample2
kubectl apply -f springbootrestapiexample2.yml
curl http://192.168.99.100:31471/SpringBootRestApi2/api/user/

