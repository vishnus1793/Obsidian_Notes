L4 - for speed and not understand HTTP 
L7 understand the HTTP traffic 
The loadbalancer continously ping back end server asking essentially are you still alive  ? 
If server stops responding the loadbalancer immediately removes from the traffic pool
