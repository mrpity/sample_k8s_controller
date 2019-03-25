FROM scratch
EXPOSE 8080
COPY ./bin/ /
ENTRYPOINT ["/sample-k8s-controller"]
