FROM anapsix/alpine-java:8_jdk

RUN apk update && \
    apk add git wget ca-certificates && \
    mkdir /app

# Install Gradle
ENV GRADLE_HOME=/app/gradle-3.0
ENV PATH=$PATH:/$GRADLE_HOME/bin
ENV TERM=xterm
RUN wget https://services.gradle.org/distributions/gradle-3.0-bin.zip && \
    unzip gradle-3.0-bin.zip && \
    mv gradle-3.0 /app && \
    rm gradle-3.0-bin.zip && \
    gradle -v

# Install Koupler
RUN cd /app && git clone https://github.com/monetate/koupler.git && \
    cd koupler && gradle clean dist && cd /app && \
    unzip koupler/build/distributions/*.zip && mv koupler-* koupler-dist && \
    rm -r koupler
COPY kpl.properties /app/koupler-dist/conf

WORKDIR /app/koupler-dist

CMD ["./koupler.sh"]
