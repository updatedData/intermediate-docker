FROM docker:stable

RUN apk -v --update add \
    python3 py-pip bash gcc curl docker-compose\
&& DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker} \
&& mkdir -p $DOCKER_CONFIG/cli-plugins \
&& curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose \
&& apk -v --purge del py-pip \
&& rm /var/cache/apk/*