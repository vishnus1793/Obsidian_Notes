
In Kubernetes, **taints/tolerations**, **node selectors**, and **node affinity** are all scheduling controls — but they solve different problems.

A useful mental model:

- **Node selector / affinity** → “Pods are attracted to certain nodes.”
    
- **Taints / tolerations** → “Nodes repel certain pods.”
    

---

# 1. Node Selector

`nodeSelector` is the simplest scheduling constraint.

You label a node, then require pods to run only on nodes with that label.

## Example

Label a node:

```
kubectl label nodes worker-1 disktype=ssd
```

Pod spec:

```
apiVersion: v1kind: Podmetadata:  name: nginxspec:  nodeSelector:    disktype: ssd  containers:  - name: nginx    image: nginx
```

This pod only schedules onto nodes with:

```
disktype=ssd
```

---

## Characteristics

|Feature|nodeSelector|
|---|---|
|Simple|Yes|
|Exact match only|Yes|
|Supports OR logic|No|
|Preferred rules|No|
|Hard requirement|Yes|

---

# 2. Node Affinity

Node affinity is the advanced version of `nodeSelector`.

It provides:

- hard rules
    
- soft preferences
    
- richer expressions
    
- AND/OR logic
    

---

# Required Node Affinity (Hard Rule)

If rule is not satisfied → pod is not scheduled.

```
apiVersion: v1kind: Podmetadata:  name: nginxspec:  affinity:    nodeAffinity:      requiredDuringSchedulingIgnoredDuringExecution:        nodeSelectorTerms:        - matchExpressions:          - key: disktype            operator: In            values:            - ssd  containers:  - name: nginx    image: nginx
```

---

# Preferred Node Affinity (Soft Rule)

Scheduler _tries_ to place the pod there.

```
affinity:  nodeAffinity:    preferredDuringSchedulingIgnoredDuringExecution:    - weight: 1      preference:        matchExpressions:        - key: zone          operator: In          values:          - us-east-1a
```

If unavailable, pod still schedules elsewhere.

---

# Affinity Operators

Supported operators:

|Operator|Meaning|
|---|---|
|In|value exists|
|NotIn|value absent|
|Exists|key exists|
|DoesNotExist|key absent|
|Gt|greater than|
|Lt|less than|

---

# Node Selector vs Node Affinity

|Feature|nodeSelector|nodeAffinity|
|---|---|---|
|Simplicity|Very simple|More complex|
|Expressions|No|Yes|
|Soft rules|No|Yes|
|Preferred scheduling|No|Yes|
|Recommended today|Limited use|Preferred|

---

# 3. Taints and Tolerations

This is fundamentally different.

Instead of pods choosing nodes:

- Nodes declare restrictions.
    
- Pods must tolerate those restrictions.
    

---

# Taint Syntax

Apply taint:

```
kubectl taint nodes worker-1 dedicated=gpu:NoSchedule
```

Structure:

```
key=value:effect
```

Example:

```
dedicated=gpu:NoSchedule
```

Meaning:

- Node is marked as GPU-dedicated.
    
- Pods without matching toleration cannot run there.
    

---

# Toleration Example

```
apiVersion: v1kind: Podmetadata:  name: gpu-appspec:  tolerations:  - key: "dedicated"    operator: "Equal"    value: "gpu"    effect: "NoSchedule"  containers:  - name: app    image: nginx
```

Now pod is allowed onto tainted node.

---

# Important Concept

A toleration does **NOT** force scheduling.

It only removes the restriction.

You often combine:

- toleration
    
- node affinity
    

Example:

- tolerate GPU nodes
    
- prefer GPU labeled nodes
    

---

# Taint Effects

## NoSchedule

Pods without toleration are not scheduled.

```
dedicated=gpu:NoSchedule
```

---

## PreferNoSchedule

Scheduler tries to avoid placement.

Soft restriction.

---

## NoExecute

Two effects:

1. Prevents new pod scheduling
    
2. Evicts existing non-tolerating pods
    

---

# NoExecute Example

```
kubectl taint nodes worker-1 maintenance=true:NoExecute
```

Pods without toleration are evicted.

---

# TolerationSeconds

Useful with `NoExecute`.

```
tolerations:- key: "maintenance"  operator: "Equal"  value: "true"  effect: "NoExecute"  tolerationSeconds: 3600
```

Pod survives for 1 hour before eviction.

---

# Real-World Use Cases

## Dedicated GPU Nodes

```
gpu=true:NoSchedule
```

Only ML workloads tolerate it.

---

## Spot/Preemptible Nodes

Prevent critical workloads from running there.

---

## Infra Nodes

Reserve nodes for:

- ingress controllers
    
- monitoring
    
- logging
    
- system daemons
    

---

# Control Plane Nodes

Kubernetes automatically taints control plane nodes.

Example:

```
node-role.kubernetes.io/control-plane:NoSchedule
```

Prevents regular workloads from running there.

---

# Combining Affinity + Taints

This is extremely common.

## Example Strategy

GPU node:

- labeled:
    
    ```
    accelerator=nvidia
    ```
    
- tainted:
    
    ```
    dedicated=gpu:NoSchedule
    ```
    

Pod:

- tolerates GPU taint
    
- requires accelerator label
    

This guarantees:

- only authorized workloads run there
    
- workloads definitely land on GPU nodes
    

---

# Scheduling Flow

Simplified scheduler logic:

```
1. Filter nodes   - resources   - taints/tolerations   - affinity rules2. Score nodes   - preferred affinity   - topology spread   - resource balance3. Bind pod to best node
```

---

# Quick Comparison

|Feature|nodeSelector|nodeAffinity|taints/tolerations|
|---|---|---|---|
|Purpose|Select nodes|Advanced node selection|Repel pods from nodes|
|Acts on|Pod|Pod|Node|
|Hard rules|Yes|Yes|Yes|
|Soft rules|No|Yes|Yes (`PreferNoSchedule`)|
|Best for|Simple placement|Flexible placement|Node isolation|

---

# Best Practices

## Use node affinity over nodeSelector

More expressive and future-proof.

---

## Use taints for isolation

Examples:

- GPU pools
    
- system nodes
    
- expensive hardware
    
- spot nodes
    

---

## Combine affinity + tolerations

Most production clusters do this.

---

# Common Interview Question

## “Why use both taints and affinity?”

Because:

- toleration alone allows scheduling anywhere
    
- affinity alone does not prevent unwanted pods
    

Together:

- taint protects node
    
- affinity directs workload
    

---

# Example: Full Production-Style Config

```
apiVersion: v1kind: Podmetadata:  name: ml-trainingspec:  tolerations:  - key: "dedicated"    operator: "Equal"    value: "gpu"    effect: "NoSchedule"  affinity:    nodeAffinity:      requiredDuringSchedulingIgnoredDuringExecution:        nodeSelectorTerms:        - matchExpressions:          - key: accelerator            operator: In            values:            - nvidia  containers:  - name: trainer    image: tensorflow/tensorflow:latest-gpu
```

This pod:

- can access GPU-dedicated nodes
    
- must run on NVIDIA nodes
    
- avoids normal worker nodes
    

---

# Easy Memory Trick

## Affinity = Attraction

Pods say:

> “I want these nodes.”

---

## Taints = Repulsion

Nodes say:

> “Stay away unless tolerated.”