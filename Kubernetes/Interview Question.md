1. How the init container differ from regular container ?
2. Horizontal Pod Autoscaling vs Vertical pod Autoscaling 
3. Purpose of Deamonset and deployment 
4. Explain the concept of Container orchestration ? 

 ### What is Sidecar-Container.

A **sidecar container** is an auxiliary container that runs alongside the main application container within the same ****Pod****. It enhances or supports the primary container without being part of the core application logic.

Common Use Cases

- ****Log forwarding****
- ****Metrics collection****
- ****Service mesh proxies**** (e.g., Envoy)
- ****TLS termination****
- ****Data synchronization****
---
### What is the relationship between a Deployment, ReplicaSet, and Pod?

Management Hierarchy

- ****Deployment****: Defines the desired state of an application (e.g., number of replicas, container image) and manages updates.
- ****ReplicaSet****: Ensures the specified number of Pods are running; created and managed by the Deployment.
- ****Pod****: The smallest deployable unit; runs one or more containers.
---
