FROM brimstone/debian:wheezy

RUN package openssl

VOLUME /etc/mysql/ssl
VOLUME /etc/mysql/ssl.d

ADD ca.* /etc/ssl/
ADD ssl.cnf /etc/ssl/

ADD loader /loader

ENTRYPOINT ["/loader"]
