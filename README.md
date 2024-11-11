# Debian based Docker in Docker Image

A Debian-based Docker-in-Docker (DinD) image for building and running Docker containers within Docker. Useful for CI/CD, testing, or as a base image for custom Docker environments.

## Quick start

1. Pull image from docker hub
   ```sh
   docker pull hellojowet/debian_dind
   ```
2. Run a container with Docker-in-Docker enabled
   ```sh
   docker run --privileged -d hellojowet/debian_dind
   ```

## Use as a base image

In your Dockerfile, use this DinD image as the base:

```Dockerfile
FROM hellojowet/debian_dind
# Add any additional setup commands here
```
