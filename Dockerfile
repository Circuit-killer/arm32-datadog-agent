FROM resin/raspberrypi3-debian:latest

ENTRYPOINT ["/bin/bash"]
CMD bin/agent
ENV DD_API_KEY=setme
ENV DD_START_AGENT=0
WORKDIR /tmp

RUN apt-get update && apt-get install -y \
  curl \
  python \
  sysstat \
  wget \
  && wget https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/setup_agent.sh \
  && /bin/bash setup_agent.sh \
  && rm setup_agent.sh

WORKDIR /root/.datadog-agent/

