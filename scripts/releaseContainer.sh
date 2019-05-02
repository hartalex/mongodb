#!/bin/bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sed -i "s/(TRAVIS_COMMIT)/$TRAVIS_COMMIT/g" kube.conf.json
./kubectl apply -f storageClass.conf.yaml
./kubectl apply -f service.conf.json
./kubectl delete -f kube.conf.yaml
./kubectl create -f kube.conf.yaml
