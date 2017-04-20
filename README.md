# docker-smartfox

## Docker Run
Run the [timlien/docker-smartfox][1] image with following command.
```bash
docker run -d \
    -p 8080:8080 -p 9933:9933 -p 8787:8787 \
    -v /datadir:/opt/SmartFoxServer_2X \
    --name docker-smartfox \
    timlien/docker-smartfox:2.12.5
```

## SmartFox Server 2X Admin
Check http://localhost:8080 and http://localhost:8080/admin links.
Default username is "sfsadmin", default password is "sfsadmin".

[1]: https://hub.docker.com/r/timlien/docker-smartfox/