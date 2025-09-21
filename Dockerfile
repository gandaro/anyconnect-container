FROM alpine:3.22
WORKDIR /root
RUN apk add --no-cache openconnect build-base autoconf automake libevent libevent-dev linux-headers git
RUN git clone --revision=c98f06d942970cdf35dd66ab46840f7d6d567b60 --depth 1 https://github.com/cernekee/ocproxy.git
WORKDIR ocproxy
RUN sh autogen.sh
RUN ./configure
RUN make
RUN apk del build-base autoconf automake libevent-dev linux-headers git
ENTRYPOINT ["openconnect", "--script-tun", "--script", "./ocproxy -g -D 1080"]
