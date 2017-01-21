# sphinx docker
#
# VERSION 0.2

FROM phusion/baseimage

COPY docker-entrypoint.sh /usr/local/bin/

RUN apt-get update  && \
    apt-get -y install software-properties-common && \
    apt-get update && \
    add-apt-repository -y ppa:builds/sphinxsearch-beta && \
    apt-get update && \
    apt-get -y install sphinxsearch && \
    mkdir /var/lib/sphinx/ && \
    mkdir -p /var/lib/sphinx/data && \
    mkdir /var/log/sphinx && \
    mkdir /var/run/sphinx && \ 
    ln -s /usr/local/bin/docker-entrypoint.sh && \
    chmod a+x /usr/local/bin/docker-entrypoint.sh

COPY sphinxy.conf /etc/sphinxsearch/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 9306/tcp
EXPOSE 9312/tcp
VOLUME /etc/sphinxsearch
VOLUME /var/log/sphinx
VOLUME /var/lib/sphinx
