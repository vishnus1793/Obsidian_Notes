## Definition
 1. reverse proxy used to distribute the load among several servers 
---
## Working Procedure

## Connection Termination & Request Inspection (Edge Layer)

- Client resolves DNS to the **reverse proxy endpoint**
    
- Proxy performs:
    
    - **TCP connection termination**
        
    - **TLS/SSL termination**
        
    - **HTTP parsing** (method, URI, headers)
        
- Edge controls applied:
    
    - Rate limiting
        
    - WAF rules
        
    - Authentication validation
        
    - Cache lookup (HIT/MISS)
        

**Result:** Request is validated and normalized at the edge.

---

## 2. Request Routing & Upstream Forwarding (Control Plane)

- Proxy selects an **upstream backend** using:
    
    - Round-robin / least-connections
        
    - Hash-based or path-based routing
        
- Proxy injects forwarding metadata:
    
    - `X-Forwarded-For`
        
    - `X-Forwarded-Proto`
        
    - `X-Real-IP`
        
- New internal request is dispatched over **private network**
    

**Result:** Backend receives a proxied, context-aware request.

---

## 3. Response Mediation & Client Delivery (Egress Path)

- Backend response is intercepted by proxy
    
- Proxy may apply:
    
    - Compression (gzip / brotli)
        
    - Response caching
        
    - Header mutation (CORS, security headers)
        
    - Failover or retry logic
        
- Final response is returned to client
    

**Result:** Client receives an optimized response while backend remains hidden.

---
1