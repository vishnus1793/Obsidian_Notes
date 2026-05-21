Key Point : Kubernetes is fundamentally an api Driven system
Architecture
![A diagram showing how the parts of a Kubernetes cluster relate to one another|697](https://www.redhat.com/rhdc/managed-files/kubernetes_diagram-v3-770x717_0.svg "Kubernetes cluster diagram")

1.Control Plane Components 
The Control plane manages the entire cluster.
Think of it like: 
Decision Maker , Brain, Cluster Manager

A . Kube-apiserver -> The api server is the heart of the kubernetes.

Note :
Command to find whether kube-apiserver is running or not 
```
kubectl get po -n kube-system | grep kube-apiserver
```

Note Tip: kube-apiserver run as pod inside the kube-system cluster 

Point: No component talks directly to another component unless necessary.
```
Component → kube-apiserver → etcd
```

## Responsibilities

- Receives requests from:
    - kubectl
    - UI dashboards
    - automation tools
    - controllers
- Validates requests
- Authenticates users
- Updates cluster state
- Communicates with etcd

---

# InterView Question Section

1. What is ke
