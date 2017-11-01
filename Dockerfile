FROM ubuntu:latest

ADD Master ~/.klei/DoNotStarveTogether/svr/Master
ADD Caves ~/.klei/DoNotStarveTogether/svr/Caves
ADD cluster_token.txt ~/.klei/DoNotStarveTogether/svr
ADD cluster.ini ~/.klei/DoNotStarveTogether/svr
ADD run_dedicated_servers.sh ~/.klei/DoNotStarveTogether/svr

RUN \
  apt-get update && \
  apt-get install -y libstdc++6 libgcc1 libcurl4-gnutls-dev wget && \
  wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -P ~/steamcmd && \
  tar -xvzf steamcmd_linux.tar.gz && \
  chmod u+x ~/run_dedicated_servers.sh

ENTRYPOINT ["~/run_dedicated_servers.sh"]

EXPOSE 11000 11001