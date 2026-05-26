Cluster life Cycle 
1 Docker swarm init -> Initializes a swarm manger in the current node

It create two join secret token (one for manager and one for worker) 


docker node ls 
docker node inspect < Node id >
docker node update --availabilty drain < Node id >

