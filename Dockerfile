FROM ubuntu:latest

RUN \
  mkdir -p ~/.klei/DoNotStarveTogether/MyDediServer/Master && \
  mkdir -p ~/.klei/DoNotStarveTogether/MyDediServer/Caves

ADD Master ~/.klei/DoNotStarveTogether/svr/Master
ADD Caves ~/.klei/DoNotStarveTogether/svr/Caves
ADD cluster_token.txt ~/.klei/DoNotStarveTogether/svr
ADD cluster.ini ~/.klei/DoNotStarveTogether/svr
ADD run_dedicated_servers.sh ~/.klei/DoNotStarveTogether/svr

RUN \
  apt-get update && \
  apt-get install -y libstdc++6 libgcc1 libcurl4-gnutls-dev wget && \
  wget -P ~/steamcmd https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz  && \
  tar -xvzf ~/steamcmd/steamcmd_linux.tar.gz -C ~/steamcmd/ && \
  sudo chmod u+x ~/.klei/DoNotStarveTogether/svr/run_dedicated_servers.sh

ENTRYPOINT ["~/run_dedicated_servers.sh"]

EXPOSE 11000 11001