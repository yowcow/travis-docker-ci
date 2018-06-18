FROM yowcow/debian-buster-perl5:5.10.1

RUN set -eux; \
    apt-get update && \
    apt-get -yq install \
        libssl-dev zlib1g-dev \
        libprotobuf-dev libprotoc-dev libgrpc-dev protobuf-compiler

RUN set -eux; \
    cpanm --notest App::cpm Carton Devel::CheckLib IO::Socket::SSL

RUN rm -rf /var/lib/apt/lists/* /root/.cpanm
