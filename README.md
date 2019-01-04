mvn clean package
docker build -t springbootrestapiexample2 .
kubectl apply -f springbootrestapiexample2.yml
wait 20 seconds'ish
curl http://192.168.99.100:31470/SpringBootRestApi/api/user/
