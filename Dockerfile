FROM alpine:edge as downloader

ARG VERSION
ARG BUILD

RUN apk add curl
WORKDIR /data
RUN curl -f -O https://api.papermc.io/v2/projects/paper/versions/$VERSION/builds/$BUILD/downloads/paper-$VERSION-$BUILD.jar

FROM alpine:edge

ARG VERSION
ARG BUILD

ENV XMX=4G
ENV XMS=1G

EXPOSE 25565

RUN apk add openjdk21-jre-headless
COPY --from=downloader /data/paper-$VERSION-$BUILD.jar /app/paper.jar

ENTRYPOINT java -Xmx$XMX -Xms$XMS -jar /app/paper.jar --nogui

LABEL org.opencontainers.image.source=https://github.com/firleaf/papermc-docker