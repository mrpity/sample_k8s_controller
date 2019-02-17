package main

import (
	"flag"
	"fmt"
	"log"
	"path/filepath"

	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/tools/clientcmd"
	"k8s.io/client-go/util/homedir"
)

func main() {

	fmt.Println(" Dima")

	var kubeconfig *string
	if home := homedir.HomeDir(); home != "" {
		kubeconfig = flag.String("kubeconfig", filepath.Join(home, ".kube", "config"), "(optional) absolute path to the kubeconfig file")
	} else {
		kubeconfig = flag.String("kubeconfig", "", "absolute path to the kubeconfig file")
	}
	flag.Parse()

	config, err := clientcmd.BuildConfigFromFlags("", *kubeconfig)
	if err != nil {
		panic(err)
	}
	clientset, err := kubernetes.NewForConfig(config)
	if err != nil {
		panic(err)
	}

	podList, err := clientset.CoreV1().Pods("").List(metav1.ListOptions{})
	if err != nil {
		log.Fatal(err)
	}

	// ConfgiMapList, err := clientset.CoreV1.ConfgiMapList
	// fmt.Println("There are", len(ConfgiMapList.Items), "ConfigMaps in the cluster:")
	// for _, i := range ConfgiMapList.Items {
	// 	fmt.Println(i)
	// }

	fmt.Println("There are", len(podList.Items), "pods in the cluster:")
	for _, i := range podList.Items {
		fmt.Println(i.ObjectMeta.Name)
	}
}
