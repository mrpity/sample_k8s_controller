FROM scratch
EXPOSE 8080
COPY ./sample-k8s-controller /
ENTRYPOINT ["/sample-k8s-controller"]
