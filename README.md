# ARM32 Datadog Agent

This repo builds a Docker image to be used to run the Datadog agent on ARM32
devices.

# Building

* Natively
  * Run `docker build -t <your tag> .`
* x86_64
  * Run `make build`

# Usage

Once you have a container, you can run it using the following approach:

```
docker run -d \
  -e TAGS="key:value,key:value" \
  -e DD_API_KEY=<api_key> \
  --security-opt seccomp=unconfined \
  -v /proc:/host/proc:ro \
  -h ${HOSTNAME} \
  <image_name>
```

Note that you can set keys on the host, and need to set your DD_API_KEY.

