FROM ubuntu:latest

COPY cluster_token.txt ~/.klei/DoNotStarveTogether/svr
COPY cluster.ini ~/.klei/DoNotStarveTogether/svr
COPY run_dedicated_servers.sh ~/.klei/DoNotStarveTogether/svr
COPY Master ~/.klei/DoNotStarveTogether/svr/Master/
COPY Caves ~/.klei/DoNotStarveTogether/svr/Caves/

RUN \
  sudo apt-get install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 && \
  mkdir ~/steamcmd && \
  cd ~/steamcmd && \
  wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
  tar -xvzf steamcmd_linux.tar.gz && \
  chmod u+x ~/run_dedicated_servers.sh

ENTRYPOINT ["~/run_dedicated_servers.sh"]

EXPOSE 11000 11001