Apache ServiceMix Docker image
==============================

Run GKE (MZB)
-------------
kubectl run servicemix-test --image=gcr.io/${PROJECT_ID}/servicemix-test:v1 --port=1099 --port=8101 --port=61616 --port=36888 --port=44444

Run
---

```bash
docker run -d -t \
  --name servicemix \
  -p 1099:1099 \
  -p 8101:8101 \
  -p 8181:8181 \
  -p 61616:61616 \
  -p 36888:36888 \
  -p 44444:44444 \
  -v /host/path/deploy:/deploy \
  mkroli/servicemix
```
