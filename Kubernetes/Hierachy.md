```

KUBERNETES ECOSYSTEM
│
└── Cluster
    │
    ├── Control Plane
    │   ├── API Server
    │   ├── Scheduler
    │   ├── Controller Manager
    │   └── etcd
    │
    └── Worker Nodes
        ├── Node 1
        ├── Node 2
        └── Node N

Within a Cluster:
│
├── Namespace (dev)
│   │
│   ├── Deployments
│   │   └── ReplicaSets
│   │       └── Pods
│   │           └── Containers
│   │
│   ├── StatefulSets
│   │   └── Pods
│   │       └── Containers
│   │
│   ├── DaemonSets
│   │   └── Pods
│   │       └── Containers
│   │
│   ├── Jobs
│   │   └── Pods
│   │
│   ├── CronJobs
│   │   └── Jobs
│   │       └── Pods
│   │
│   ├── Services
│   │   └── Select Pods
│   │
│   ├── Ingress
│   │   └── Routes Traffic To Services
│   │
│   ├── ConfigMaps
│   ├── Secrets
│   ├── ServiceAccounts
│   ├── Roles
│   ├── RoleBindings
│   ├── PVCs
│   └── NetworkPolicies
│
├── Namespace (qa)
│   └── Same structure
│
├── Namespace (prod)
│   └── Same structure
│
└── Cluster-wide Resources
    ├── Nodes
    ├── PersistentVolumes (PV)
    ├── StorageClasses
    ├── ClusterRoles
    ├── ClusterRoleBindings
    ├── Namespaces
    └── CRDs
```



```
Cluster
│
├── Namespace
│   │
│   ├── Deployment
│   │   └── ReplicaSet
│   │       └── Pod
│   │           └── Container
│   │
│   ├── Service
│   ├── ConfigMap
│   ├── Secret
│   └── PVC
│
└── Nodes
```

```
Cluster = Company
Namespace = Department
Node = Employee's workstation
Deployment = Hiring plan
ReplicaSet = Number of employees required
Pod = Employee
Container = Skills/tools employee uses
Service = Reception desk
Ingress = Main company gate
ConfigMap/Secret = Employee handbook & passwords
PV/PVC = Storage room
```

```
Cluster
 └── Namespace
      ├── Deployment
      │    └── ReplicaSet
      │         └── Pod
      │              └── Container
      ├── Service
      ├── Ingress
      ├── ConfigMap
      ├── Secret
      └── PVC
```


```
Kubernetes Cluster
│
├── Control Plane
│
├── Nodes (Cluster-wide)
│   ├── Node-1
│   │   ├── Pod A (namespace: dev)
│   │   ├── Pod B (namespace: prod)
│   │   └── Pod C (namespace: qa)
│   │
│   ├── Node-2
│   │   ├── Pod D (namespace: dev)
│   │   └── Pod E (namespace: prod)
│   │
│   └── Node-3
│
└── Namespaces (Logical Separation)
    ├── dev
    │   ├── Deployment
    │   ├── Service
    │   └── Pods
    │
    ├── qa
    │   └── Pods
    │
    └── prod
        └── Pods
```