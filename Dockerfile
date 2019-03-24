FROM scratch
EXPOSE 8080
COPY sample_k8s_controller /
ENTRYPOINT ["/sample_k8s_controller"]
