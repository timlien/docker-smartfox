# docker-smartfox
[SmartFox Server 2x][1] Docker image forked from [nickalie/docker-smartfox][2]

## Docker
Pull the [timlien/docker-smartfox][2] image and run it with following command.
```bash
docker pull timlien/docker-smartfox
docker run -d -p 8080:8080 -p 9933:9933 --name docker-smartfox timlien/docker-smartfox
```

## SmartFox Server 2X
Check http://localhost:8080 and http://localhost:8080/admin links.
Default username is "sfsadmin", default password is "sfsadmin".


[1]: http://www.smartfoxserver.com/
[2]: https://github.com/nickalie/docker-smartfox
[3]: https://hub.docker.com/r/timlien/docker-smartfox/
