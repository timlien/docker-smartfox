# docker-smartfox

## Docker Run

Run the [timlien/docker-smartfox][1] image with following command.

### Create volume mount

```bash
docker volume create docker-smartfox
```

### Run container interactive

```bash
docker run -it --rm \
    -p 8080:8080 -p 9933:9933 -p 8787:8787 -p 5000:5000 \
    -v docker-smartfox:/opt/SmartFoxServer_2X \
    --name smartfox \
    docker-smartfox
```

### Run container in background

```bash
docker run -d \
    -p 8080:8080 -p 9933:9933 -p 8787:8787 -p 5000:5000 \
    -v docker-smartfox:/opt/SmartFoxServer_2X \
    --name smartfox \
    docker-smartfox
```

## SmartFox Server 2X Admin

Check http://localhost:8080 and http://localhost:8080/admin links.
Default username is "sfsadmin", default password is "sfsadmin".

[1]: https://hub.docker.com/r/timlien/docker-smartfox/
