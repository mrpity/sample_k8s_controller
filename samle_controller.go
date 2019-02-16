package main

import (
	"fmt"
	"log"

	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

func main() {

	fmt.Println(" Dima")

	podList, err := clientset.CoreV1().Pods("").List(metav1.ListOptions{})
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("There are", len(podList.Items), "pods in the cluster:")
	for _, i := range podList.Items {
		fmt.Println(i.ObjectMeta.Name)
	}
}
