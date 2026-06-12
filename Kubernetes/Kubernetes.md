Key Point : Kubernetes is fundamentally an api Driven system
Architecture
![A diagram showing how the parts of a Kubernetes cluster relate to one another|697](https://www.redhat.com/rhdc/managed-files/kubernetes_diagram-v3-770x717_0.svg "Kubernetes cluster diagram")

1.Control Plane Components 
The Control plane manages the entire cluster.
Think of it like: 
Decision Maker , Brain, Cluster Manager

A . Kube-apiserver -> The api server is the heart of the kubernetes.

Note :
Kubectl = kubernetes + control 
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

1. What is kube-apiserver in kubernetes ?
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
port = **10257**
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

```
minikube ssh "sudo ss -tlnp | grep controller"

```


# Etcd -> dir /etc  d = distributed


Everything important in Kubernetes eventually lives in etcd.
what is etcd ?
A distributed, consistent, highly-available key-value store
Built by:
CoreOS (later acquired by Red Hat).
Written in:

```
Go
```

Uses:

```
Raft Consensus Algorithm
```

`Never access etcd directly unless absolutely necessary.`
7. etcd is the Database of Kubernetes
```
Kubernetes API Server = Application Layer
etcd = Database Layer
```
etcd stores data as key -> value


# Compute Machines
# Kubelet — The Node Agent (Kubernetes + Applet = Kubelet)

MOST IMPORTANT worker component.

kubelet is the:

```
Primary node agent
```
# kubelet Responsibilities

kubelet:

- Watches assigned Pods
- Talks to container runtime
- Starts containers
- Stops containers
- Mounts volumes
- Reports node status
- Reports Pod status
- Runs probes
- Handles Secrets/ConfigMaps
- Executes lifecycle hooks

---
# Core Purpose of Kubelet

The kubelet:

1. Watches for Pod assignments
2. Talks to container runtime
3. Starts/stops containers
4. Reports node & pod status
5. Performs health checks
6. Mounts volumes/secrets/configmaps
7. Executes probes
8. Keeps pod state aligned with desired state
---
Without kubelet:

```
Kubernetes can schedule pods,but nothing actually runs.
```
# kubelet DOES NOT Schedule Pods

Critical distinction.

Scheduler assigns Pods.

kubelet executes them.

```
minikube ssh "sudo ss -tlnp | grep kubelet"

```

```
minikube ssh "sudo systemctl status kubelet"

```

```
kubectl get nodes

```
### Kubelet WorkFlow

```
API Server
     ↓
kubelet watches assigned Pods
     ↓
Pull images
     ↓
Create containers
     ↓
Configure networking
     ↓
Mount storage
     ↓
Run workload
```

# kube-proxy

Handles Service networking.

Implements virtual Service IPs.
# kube-proxy Responsibilities

- Service load balancing
- iptables/ipvs rules
- ClusterIP handling
- NodePort handling

---
# kube-proxy Modes

## iptables mode

Most common.

---
## IPVS mode

More scalable.

---
## userspace mode

Legacy.

---

# Container Registry 
A container registry in Kubernetes is the system that stores and distributes container images used by pods.

Typical registries include:

- Docker Hub
- Google Artifact Registry / GCR
- Amazon Web Services ECR
- Microsoft ACR
- GitHub Container Registry (GHCR)
- Harbor

# Core purpose

Kubernetes itself does not build application binaries.

It runs containers from images.

The registry is where those images live.

Flow:

```
Developer → Build Image → Push to Registry                                   ↓                            Kubernetes pulls image                                   ↓                               Pod starts
```
