# Helm Charts
Helm charts for Kubernetes deployment

# Code for K8s : 
kubectl apply -f secret.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Check Pods and Service:
kubectl get pods
kubectl get deployments
kubectl get services

# Outside IP
kubectl get svc flask-monitor-service

# Helm command in the terminal : 
helm create flask-monitor

creates a flask-monitor/ directory with all the helm stuff

I am adding all the edited parts here in the "flask-monitor" directory for
documentation sake

# Helm command line : 
helm install flask-monitor ./flask-monitor \
  --set aws.accessKeyId=AKIAXLEKZJVVREN3MIWD \
  --set aws.secretAccessKey=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

# Helm Verify deployment:
kubectl get pods
kubectl get svc
Looking for the EXTERNAL-IP in the Service output (todo - Thursday).
http://<EXTERNAL-IP>
