FROM ubuntu:latest

# install utilities
RUN \
    apt-get update && apt-get install -y \
    curl \
    unzip \
    software-properties-common

# install java 8. could just base this on java:8-jre image, which has some additional cleanup.
RUN \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-add-repository -y ppa:webupd8team/java && \
    apt-get update \
    && apt-get install -y oracle-java8-installer

# install gremlin console/REPL
RUN curl -L -O https://www.apache.org/dist/incubator/tinkerpop/3.1.1-incubating/apache-gremlin-console-3.1.1-incubating-bin.zip \
    && unzip apache-gremlin-console-3.1.1-incubating-bin.zip

# install wikipedia voting data set
RUN  curl -L -O http://snap.stanford.edu/data/wiki-Vote.txt.gz \
    && gunzip wiki-Vote.txt.gz

WORKDIR apache-gremlin-console-3.1.1-incubating/bin

CMD ./gremlin.sh

