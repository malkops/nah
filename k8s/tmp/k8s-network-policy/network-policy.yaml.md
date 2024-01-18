apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: ingress-deny-all
spec:
  podSelector: {}
  policyTypes:
  - Ingress
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: f-t-b
spec:
  podSelector:
    matchLabels:
      app: backend
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: frontend
  policyTypes:
  - Ingress
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: b-t-c
spec:
  podSelector:
    matchLabels:
      app: cache
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: backend
  policyTypes:
  - Ingress
