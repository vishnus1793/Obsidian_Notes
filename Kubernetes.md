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

1. What is kube-apiserver in kubernetest ?
The central control plane component that exposes the kubernetes API and acts as the communication hub between all cluster components 
2. Why is kube-apiserver considered the heart of kubernetes ? 
Because every components communicates though it 
```
kubectl
scheduler
controller-manager
kubelet
operators
external clients
```
Without it, the cluster cannot be managed.
3. On which port does kube-apiserver run?
Default secure port:
```
6443
```
in standard Kubernetes Setup
```
8443
```
in minikube setup

4. Does kube-apiserver directly communicate with containers?'
No .
it communicates with :
* kubelet
* etcd
* controllers
* schedulers
containers are managed through kubelet and container run time.

5. Where is kube-apiserver data stored?
in etcd

6. Is kube-apiserver stateful or stateless?
Stateless.
Persistent cluster state exists in etcd.

7. How do users interact with kube-apiserver?
usually through :
* kubectl 
* REST APIs
* client libraries

8. What happens internally when we run kubectl commands?
Flow
```
kubectl
→ kube-apiserver
→ authentication
→ authorization
→ admission control
→ validation
→ etcd
```
9. Can components communicate directly with etcd?
No .
only kube-apiserver can communicate with  the etcd.

10. What is the role of kube-apiserver in security?
it handles :
- Authentication
- Authorization
- Admission control
- TLS communication

# Kube-scheduler ->The `kube-scheduler` is the **brain that decides WHERE Pods run**.
Default port
```
10259
```

verification command : 
```
minikube ssh "sudo ss -tlnp | grep scheduler"
```

it does **Not Create pods** and **Does not run container**
it only:
Watches for unscheduled Pods → chooses the best Node → binds Pod to Node.

## Predicates and Priorites 
Predicates - Hard Constraints 
Priorities - Soft Constraints
`kube-scheduler` assigns a pod to a node by passing it through two main phases: **Filtering (formerly known as Predicates)** and **Scoring (formerly known as Priorities)**.
![[Pasted image 20260521225056.png]]
# . Scheduling Cycle

The scheduling framework has two phases:

---

# A. Scheduling Cycle

Find best node.

---

# B. Binding Cycle

Assign Pod to chosen node.

---
# Kube-controller-manager
The `kube-controller-manager` is the **reconciliation engine** of Kubernetes.
It continuously ensures:

```
Actual State == Desired State
```
Without it:
- Deployments won't create Pods
- Nodes won't be monitored
- ServiceAccounts won't exist
- Replicas won't heal
- Jobs won't run correctly
- Endpoints won't update
---
# Core Philosophy

Kubernetes is built on:

```
Declarative Desired State
```

You declare:

```
replicas: 3
```

Controller manager ensures reality becomes:

```
3 running Pods
```

If one dies:

```
Controller recreates it automatically
```

That reconciliation loop IS Kubernetes.

---
![[Pasted image 20260521225703.png]]

```
Deployment Controller
        ↓
Creates ReplicaSet
        ↓
ReplicaSet Controller
        ↓
Creates Pods
        ↓
Scheduler assigns nodes
        ↓
Kubelet runs containers
```
## Controller Loop Model
Every Controller:
```
while true:
    observe state
    compare desired vs actual
    reconcile difference
```

