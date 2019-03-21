FROM scratch
EXPOSE 8080
ENTRYPOINT ["/sample-k8s-controller"]
COPY ./bin/ /