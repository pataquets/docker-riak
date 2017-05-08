FROM pataquets/ubuntu:xenial

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      curl \
  && \
  apt-key adv --keyserver hkp://hkps.pool.sks-keyservers.net --recv-keys D59097AB && \
  curl -sSL \
    "https://packagecloud.io/install/repositories/basho/riak/config_file.list?os=ubuntu&dist=xenial" \
    | tee /etc/apt/sources.list.d/basho.list \
  && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y purge curl \
  && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      riak \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/
