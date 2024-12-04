# Variables
IMAGE_NAME=arifmiah17103/flask-app
KUBE_NAMESPACE=flask-app-namespace

# Targets
all: build push deploy

build:
    docker build -t $(IMAGE_NAME) .

push:
   docker push $(IMAGE_NAME)

deploy:
     kubectl apply -f deployment.yaml --namespace $(KUBE_NAMESPACE)

clean:
    kubectl delete -f deployment.yaml --namespace $(KUBE_NAMESPACE)

.PHONY: all build push deploy clean
