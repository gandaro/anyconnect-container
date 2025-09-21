FROM alpine:3.22
WORKDIR /root
RUN apk add --no-cache openconnect build-base autoconf automake libevent libevent-dev linux-headers
RUN wget https://github.com/cernekee/ocproxy/archive/refs/heads/master.zip
RUN unzip master.zip
WORKDIR ocproxy-master
RUN sh autogen.sh
RUN ./configure
RUN make
RUN apk del build-base autoconf automake libevent-dev linux-headers
ENTRYPOINT ["openconnect", "--script-tun", "--script", "./ocproxy -g -D 1080"]
