IMAGE=localhost/arm32-datadog-agent:latest
x86_DOCKERFILE=Dockerfile.x86_64

.PHONY=parse,build,run

parse:
	cp Dockerfile ${x86_DOCKERFILE}
	sed -i 's/raspberrypi3/intel-nuc/' ${x86_DOCKERFILE}

build: parse
	docker build -t ${IMAGE} --file ${x86_DOCKERFILE} .

run:
	docker run -it --rm ${IMAGE}

