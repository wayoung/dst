FROM ubuntu:latest

RUN \
  mkdir -p /root/.klei/DoNotStarveTogether/svr/Master && \
  mkdir -p /root/.klei/DoNotStarveTogether/svr/Caves

COPY Master /root/.klei/DoNotStarveTogether/svr/Master
COPY Caves /root/.klei/DoNotStarveTogether/svr/Caves
COPY cluster_token.txt /root/.klei/DoNotStarveTogether/svr
COPY cluster.ini /root/.klei/DoNotStarveTogether/svr
COPY run_dedicated_servers.sh /root/.klei/DoNotStarveTogether/svr

RUN \
  apt-get update && \
  apt-get install -y lib32stdc++6 lib32gcc1 libcurl4-gnutls-dev curl wget && \
  wget -P /root/steamcmd https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz  && \
  tar -xvzf /root/steamcmd/steamcmd_linux.tar.gz -C /root/steamcmd/ && \
  chmod u+x /root/.klei/DoNotStarveTogether/svr/run_dedicated_servers.sh

EXPOSE 11000 11001

CMD ["/bin/bash"]