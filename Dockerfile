# sphinx docker
#
# VERSION 0.1

FROM phusion/baseimage

RUN apt-get update  && \
    apt-get -y install software-properties-common && \
    apt-get update && \
    add-apt-repository -y ppa:builds/sphinxsearch-beta && \
    apt-get update && \
    apt-get -y install sphinxsearch && \
    mkdir -p /var/lib/sphinx/data && \
    mkdir /var/log/sphinx && \
    mkdir /var/run/sphinx

ADD ["indexandsearch.sh", "searchd.sh", "lordsearchd.sh", "/"]

RUN chmod a+x indexandsearch.sh && \
    chmod a+x searchd.sh && \
    chmod a+x lordsearchd.sh

EXPOSE 9306/tcp
EXPOSE 9312/tcp
VOLUME /etc/sphinxsearch
VOLUME /var/log/sphinx
VOLUME /var/lib/sphinx
