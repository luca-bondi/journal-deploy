# SAJ deployment

## Staging
```bash
./deploy.staging.sh
```

## Production
```bash
./deploy.prod.sh
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
