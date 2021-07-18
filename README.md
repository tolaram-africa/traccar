# Traccar Mod with less generic UI

## Docker quick setup

```bash
sudo docker run -d \
--restart=always \
--name=traccar \
-e SETUP_TITLE="TRACCAR" \
-e ATTRIB_NAME="traccar" \
-e ATTRIB_LINK="https://traccar.org/" \
-e PLAY_LINK="#" \
-e FRONT_LOGO_HEIGHT=52 \
-e FRONT_LOGO_WIDTH=92 \
-e BACK_LOGO_HEIGHT=27 \
-e BACK_LOGO_WIDTH=52 \
-e SETUP_COLOR="808080" \
-e GEOCODE_LINK="https://nominatim.openstreetmap.org/" \
-e GOOGLE_API_KEY="google-api-key" \
--ulimit nofile=10240000:10240000 \
--ulimit nproc=10240000:10240000 \
-p 8082:8082 \
-p 5000-5180:5000-5200 \
-p 5000-5180:5000-5200/udp \
-v /etc/timezone:/etc/timezone:ro \
-v /etc/localtime:/etc/localtime:ro \
-v ./logs:/opt/traccar/logs:rw \
-v ./data:/opt/traccar/data:rw \
-v ./media:/opt/traccar/media:rw \
gpproton/traccar:latest
```

## Docker compose quick setup

```bash
docker-compose up -d
```

## Docker swarm quick setup

```bash
docker stack deploy -c docker-swarm.yaml --prune traccar
```
