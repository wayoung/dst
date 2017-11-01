FROM ubuntu:latest

ADD Master ~/.klei/DoNotStarveTogether/svr/Master
ADD Caves ~/.klei/DoNotStarveTogether/svr/Caves
ADD cluster_token.txt ~/.klei/DoNotStarveTogether/svr
ADD cluster.ini ~/.klei/DoNotStarveTogether/svr
ADD run_dedicated_servers.sh ~/.klei/DoNotStarveTogether/svr

RUN \
  sudo apt-get install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 && \
  mkdir ~/steamcmd && \
  cd ~/steamcmd && \
  wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
  tar -xvzf steamcmd_linux.tar.gz && \
  chmod u+x ~/run_dedicated_servers.sh

ENTRYPOINT ["~/run_dedicated_servers.sh"]

EXPOSE 11000 11001