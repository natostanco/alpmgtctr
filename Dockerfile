FROM quay.io/natostanco/alporcctr

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk update \
 && apk add alpine-sdk glib-dev curl-dev asciidoc autoconf automake \
 && git clone https://github.com/megous/megatools \
 && cd megatools \
 && ./autogen.sh \
 && make \
 && make install \
 && apk del --purge alpine-sdk glib-dev curl-dev asciidoc autoconf automake \
 && apk add glib curl bash etcd openrc  \
 && cd .. \
 && rm -r megatools \
 && rm -r /var/cache/apk/*

CMD ["megadf", "-h"]
