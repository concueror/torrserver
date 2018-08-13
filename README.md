Application for watching movies directly from torrent trackers (or rather, from seeds/peers)

# How to use this image

## Using Docker Compose

The recommended way to run TorrServer is using Docker Compose using the following `docker-compose.yml` template:

```yaml
version: '2'
services:
  torrserver:
    image: alexks02/armhf-torrserver
    container_name: torrserver
    ports:
     - "8090:8090"
    restart: unless-stopped
```

Launch the containers using:

```bash
$ docker-compose up -d
```

## Using the Docker Command Line

If you want to run this application manually instead of using `docker-compose`, these are the basic steps you need to run:

```bash
$ docker run -d --name torrserver -p 8090:8090 --restart unless-stopped
```

Access your application at http://your-ip:8090/ 

### Author
YouROK (https://4pda.ru/forum/index.php?showuser=151048)
