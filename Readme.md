# Train booking for chaos monkey

## Docker
Build image
```shell
docker build -t booking-recommendations .
```

Run image
```shell
 docker run -d -p 8084:8084 booking-recommendations:latest
```

## APIs
### Test
```shell
curl http://localhost:8084/api/v1/recommendations
```

### Actuator
See chaos monkey configuration
```shell
curl http://localhost:8084/actuator/chaosmonkey
```

Enable chaos monkey
```shell
curl -X POST --location http://localhost:8084/actuator/chaosmonkey/enable
```
Disable chaos monkey
```shell
curl -X POST --location http://localhost:8084/actuator/chaosmonkey/disable
```

Change configuration
```shell
curl --location 'http://localhost:8084/actuator/chaosmonkey/assaults' \
--header 'Content-Type: application/json' \
--data '{
 "level": 5,
  "deterministic": false,
  "latencyRangeStart": 1000,
  "latencyRangeEnd": 3000,
  "latencyActive": true,
  "exceptionsActive": true
}'
```
