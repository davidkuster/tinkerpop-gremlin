FROM ubuntu:latest

RUN \
    apt-get update && apt-get install -y \
    curl \
    unzip \
    software-properties-common

RUN \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-add-repository -y ppa:webupd8team/java && \
    apt-get update \
    && apt-get install -y oracle-java8-installer

RUN curl -L -O https://www.apache.org/dist/incubator/tinkerpop/3.1.1-incubating/apache-gremlin-console-3.1.1-incubating-bin.zip

RUN unzip apache-gremlin-console-3.1.1-incubating-bin.zip

WORKDIR apache-gremlin-console-3.1.1-incubating/bin

CMD ./gremlin.sh

