Deploying a Flask app to Docker Hub registry

```shell
# Build the Docker image
docker build -t flaskapp .
# Log in to your Docker registry (Docker Hub in this case)
docker login --username=your-username
# Tag the Docker image
docker tag flaskapp:latest YOUR_USERNAME/flaskapp:latest
# Push the Docker image to the registry
docker push YOUR_USERNAME/flaskapp:latest
```
Run your app in Kubernetes

```shell
```bash
kubectl apply -f nginx-configmap.yaml
kubectl apply -f redis-deployment.yaml
kubectl apply -f redis-service.yaml
kubectl apply -f webapp-deployment.yaml
kubectl apply -f webapp-service.yaml
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
```

forward the port
```shell
kubectl port-forward svc/nginx 8080:8080
```

cleanup the deployment
```shell
kubectl delete deployment --all
kubectl delete replicaset --all
kubectl delete statefulset --all
```