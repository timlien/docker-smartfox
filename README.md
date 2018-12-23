# docker-smartfox

## Docker Run

Run the [timlien/docker-smartfox][1] image with following command.

### Build base container image

```bash
docker build -t docker-smartfox .
```

### Run container in background

```bash
docker run -d \
    -p 8080:8080 -p 9933:9933 -p 8787:8787 -p 5000:5000 \
    --name smartfox \
    docker-smartfox
```

### Extend image for your server

Create a Dockerfile for your application, copying in your application jar into the extensions directory

```Dockerfile
FROM docker-smartfox

COPY my-app.jar /opt/SmartFoxServer_2X/SFS2X/extensions/__lib__
```

```bash
docker build -t my-smartfox .
```

This will extend the base docker-smartfox image, including your application and then you can run the server. From here you can probably figure out how to copy configs as well.

## SmartFox Server 2X Admin

Check http://localhost:8080 and http://localhost:8080/admin links.
Default username is "sfsadmin", default password is "sfsadmin".

[1]: https://hub.docker.com/r/timlien/docker-smartfox/
