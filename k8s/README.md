# Hosting on civo.com

- Created k8s cluster with 3 nodes, medium size
- installed apps via civo: mongodb, postgresql, redis, certmanager, nginx

## Configuring certmanager

```bash
kubectl apply -f certmanager-issuers.yaml 
```

```bash
kubectl get clusterissuer.cert-manager.io -o yaml
```