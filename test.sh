#!/bin/bash

clustername='pe2e-cluster-2'
containername='pe2e-servicemix-2'
zone='asia-southeast1-a'
type='n1-standard-2'
disksize='10'
numnodes='2'
imagetype='UBUNTU'
tag='v2'

echo "{ 'spec': { 'template': { 'spec': { 'containers': [ { 'name': '${containername}', 'image': 'gcr.io/${PROJECT_ID}/${containername}:${tag}', 'volumeMounts': [{ 'name': 'servicemix-deploy', 'mountPath': '/deploy' }], 'resources':{} } ], 'volumes': [{ 'name': 'servicemix-deploy', 'gcePersistentDisk': { 'pdName': 'servicemix-test-permstore', 'fsType': 'ext4' }}]}}}}"

echo '{ "spec": { "template": { "spec": { "containers": [ { "name": "'${containername}'", "image": "gcr.io/${PROJECT_ID}/${containername}:${tag}", "volumeMounts": [{ "name": "servicemix-deploy", "mountPath": "/deploy" }], "resources":{} } ], "volumes": [{ "name": "servicemix-deploy", "gcePersistentDisk": { "pdName": "servicemix-test-permstore", "fsType": "ext4" }}]}}}}'

echo '${containername}'
