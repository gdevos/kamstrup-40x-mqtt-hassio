ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
WORKDIR /data
RUN apk add --no-cache --virtual .build-dependencies udev git python3 py3-yaml py3-paho-mqtt py3-pyserial && \ 
    mkdir -p /opt/kamstrup && \ 
    git clone https://github.com/matthijsvisser/kamstrup-402-mqtt.git /opt/kamstrup && \
    cd /opt/kamstrup && \
    git checkout 00083f717ae5b90ab216e1cb977269978251f369 && \
    apk del git --quiet 

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
