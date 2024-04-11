# SAJ deployment

```bash
export REACT_APP_VERSION=v$(dunamai from git --no-metadata --path frontend)
set -a ; source frontend.env.staging ; set +a
docker-compose -f docker-compose.staging.yaml -p saj-staging up --build -d
```

## Secrets

Encrypt

```bash
for conf in backend fief frontend postgres; do
    gpg --symmetric ${conf}.env.staging
done
```

Decrypt

```bash
for conf in backend fief frontend postgres; do
    gpg --output ${conf}.env.staging --decrypt ${conf}.env.staging.gpg
done
```
