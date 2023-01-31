# Auto Generated Dockerfile
FROM ballerina/jvm-runtime:1.0

LABEL maintainer="dev@ballerina.io"
COPY jardir/ /home/ballerina/jars/ 

RUN addgroup troupe \
    && adduser -S -s /bin/bash -g 'ballerina' -G troupe -D ballerina \
    && apk add --update --no-cache bash \
    && rm -rf /var/cache/apk/*

WORKDIR /home/ballerina

EXPOSE  9090
USER 10014
# USER ballerina

CMD java -Xdiag -cp "shanakap-byoc-0.1.0.jar:jars/*" 'shanakap/byoc/0/$_init'
