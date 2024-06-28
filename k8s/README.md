# Hosting on civo.com

- Created k8s cluster with 3 nodes, medium size
- installed apps via civo: mongodb, postgresql, redis, certmanager, nginx

## Certmanager

```bash
kubectl apply -f certmanager-issuers.yaml 
```

```bash
kubectl get clusterissuer.cert-manager.io -o yaml
```

## Fief

Make sure Redis runs with no password.

```bash
kubectl edit statefulsets.apps redis
```

Create database in Postgres. Get ADMIN_USERNAME and ADMIN_PASSWORD from civo dashboard, DATABASE_PASSWORD from fief-secret.yaml.

```bash
kubectl run tmp-shell --rm -i \
  --tty --image alpine -- /bin/sh \
  --generator=run-pod/v1

apk update
apk add postgresql-client
psql -U ADMIN_USERNAME -h postgresql postgresdb
```

```sql
CREATE USER fief WITH ENCRYPTED PASSWORD 'DATABASE_PASSWORD';
CREATE DATABASE fief WITH OWNER=fief;
```

Deploy fief

```bash
kubectl apply -f fief-secret.yaml
kubectl apply -f fief.yaml
```

Check fief admin page at `https://fief.bondibrown.com/admin`

## Backend, frontend

Build and push to Docker hub

```bash
./build-backend.sh
./build-frontend.sh
```

Docker credentials
```bash
kubectl create secret docker-registry regcred \
--docker-server=https://index.docker.io/v1/ \
--docker-username=unklb197 \
--docker-password=<your-pword> \
--docker-email=bondi.luca@gmail.com
```

Deploy
```bash
kubectl apply -f saj-secret.yaml
kubectl apply -f saj.yaml
```

## TODO
- cache frontend
- Backup MongoDB
- Backup PostgreSQL
- mail fief
- HA setup