1. Check cluster access

gcloud container clusters get-credentials spinnaker-cluster --region us-central1
kubectl config current-context
kubectl get pods --all-namespaces
kubectl create namespace spinnaker


2. Create .hal directory and copy spinnaker service account json into it


3. docker run -p 8084:8084 -p 9000:9000 \
    --name halyard \
    -v ~/.hal:/home/spinnaker/.hal \
    -v ~/.kube/config:/home/spinnaker/.kube/config \
    gcr.io/spinnaker-marketplace/halyard:stable



