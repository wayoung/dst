FROM ubuntu:latest

ADD cluster_token.txt ~/.klei/DoNotStarveTogether/${cluster_name}/cluster_token.txt
ADD 

RUN \
  sudo apt-get install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 \
  mkdir ~/steamcmd \
  cd ~/steamcmd \
  wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
  tar -xvzf steamcmd_linux.tar.gz \
  mkdir -p ~/.klei/DoNotStarveTogether/${cluster_name}/Master \
  mkdir -p ~/.klei/DoNotStarveTogether/${cluster_name}/Caves \