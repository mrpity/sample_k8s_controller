
kubectl get --raw /apis/custom.metrics.k8s.io/v1beta1/namespaces/kafka/services/*/zopa_topic | jq .

