#!/bin/bash
export PROJECT_ID="$(gcloud config get-value project -q)"

clustername='pe2e-cluster-2'
containername='pe2e-servicemix-2'
zone='asia-southeast1-a'
type='n1-standard-2'
disksize='10'
numnodes='2'
imagetype='UBUNTU'
tag='v2'


###
# set google vars, create project and a kubernetes cluster
###
gcloud config set compute/zone $zone

gcloud container --project ${PROJECT_ID} \
clusters create $clustername \
--machine-type $type \
--image-type "${imagetype}" --disk-size "${disksize}" \
--num-nodes $numnodes --network default \
--enable-cloud-logging --no-enable-cloud-monitoring

gcloud container clusters get-credentials $clustername --project ${PROJECT_ID}

###
# build the docker container, push it to google's container registry and add to cluster
###
docker build -t gcr.io/${PROJECT_ID}/${containername}:${tag} .

gcloud docker -- push gcr.io/${PROJECT_ID}/${containername}:${tag}

kubectl run $containername --image=gcr.io/${PROJECT_ID}/${containername}:${tag} --port=1099 --port=8101 --port=61616 --port=36888 --port=44444


