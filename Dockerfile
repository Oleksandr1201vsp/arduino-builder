FROM java:8

LABEL maintainer "j.stephenson@ossila.com"

ENV ARDUINO_IDE_VERSION 1.8.2

RUN apt-get update && apt-get install -y wget xz-utils build-essential && \
    wget -q -O- https://downloads.arduino.cc/arduino-${ARDUINO_IDE_VERSION}-linux64.tar.xz | tar xJ -C /opt && \
    ln -s /opt/arduino-${ARDUINO_IDE_VERSION}/arduino /usr/local/bin/ && \
    ln -s /opt/arduino-${ARDUINO_IDE_VERSION}/arduino-builder /usr/local/bin/ && \
    ln -s /opt/arduino-${ARDUINO_IDE_VERSION} /opt/arduino

ENTRYPOINT [ "arduino-builder" ]
