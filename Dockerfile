FROM alpine:edge

RUN apk update \
 && apk add alpine-sdk glib-dev curl-dev asciidoc \
 && git clone https://github.com/megous/megatools \
 && cd megatools \
 && ./autogen.sh \
 && make \
 && make install \
 && apk del --purge alpine-sdk glib-dev curl-dev asciidoc \
 && apk add glib curl \
 && cd .. \
 && rm -r megatools \
 && rm -r /var/cache/apk/*

CMD ["megadf", "-h"]
 
