set -e

NAME="kubernetes-demo-app"
USERNAME="faroukkhaled"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE

echo "Applying Kubernetes configurations..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/services.yaml

echo "Deployment completed."

kubectl get all

echo "Getting the pods"
kubectl get pods

echo "Getting the services"
kubectl get services

echo "Getting the deployments"
kubectl get deployments

echo "Fetching the services"
kubectl get services $NAME-service