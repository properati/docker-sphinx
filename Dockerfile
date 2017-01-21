# sphinx docker
#
# VERSION 0.2

FROM phusion/baseimage

RUN apt-get update  && \
    apt-get -y install software-properties-common && \
    apt-get update && \
    add-apt-repository -y ppa:builds/sphinxsearch-beta && \
    apt-get update && \
    apt-get -y install sphinxsearch && \
    mkdir /var/lib/sphinx/ && \
    mkdir -p /var/lib/sphinx/data && \
    mkdir /var/log/sphinx && \
    mkdir /var/run/sphinx

COPY sphinxy.conf /etc/sphinxsearch/
COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 9306/tcp
EXPOSE 9312/tcp
VOLUME /etc/sphinxsearch
VOLUME /var/log/sphinx
VOLUME /var/lib/sphinx

ENTRYPOINT ["docker-entrypoint.sh"]
