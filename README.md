# devenv
My containerized development environment.

```bash
DOCKER_BUILDKIT=1 docker run -v "$(pwd)":/home/exbotanical/app --rm -it $(docker build -q .) /bin/bash
```
