#!/usr/bin/env bash

echo "Step 4: login openshift using develper id"
echo
oc login -u=developer -p=developer

echo "Step 5: go to correct project"
echo
oc project myproject

go test -v -timeout 15m -run '^TestDockerKubernetesUnit$'