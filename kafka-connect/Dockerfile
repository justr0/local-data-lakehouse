#FROM confluentinc/cp-kafka-connect:latest
#ENV CONNECT_PLUGIN_PATH: "/usr/share/java,/usr/share/confluent-hub-components"
#RUN confluent-hub install --no-prompt tabular/iceberg-kafka-connect:0.6.5

# =========================================
# connect/Dockerfile
# =========================================
# Builds a Kafka Connect image with Iceberg Kafka Connect runtime + AWS bundle.
#
# Note: Adjust ICEBERG_VERSION to a tested compatible version with your Kafka Connect base.
#
# The iceberg-kafka-connect-runtime is a shaded/uber jar providing sink support.
# The iceberg-aws-bundle provides S3FileIO & AWS dependencies.

# Directory: connect/Dockerfile
# -----------------------------------------
# Use Confluent's Kafka Connect base
FROM confluentinc/cp-kafka-connect:latest

ARG ICEBERG_VERSION=1.5.2
ENV ICEBERG_VERSION=${ICEBERG_VERSION}

USER root

# Install curl if not present (usually it is)
# RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Download Iceberg Kafka Connect runtime + AWS bundle
RUN curl -L -o /usr/share/java/iceberg-kafka-connect-runtime-${ICEBERG_VERSION}.jar \
      https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-kafka-connect-runtime/${ICEBERG_VERSION}/iceberg-kafka-connect-runtime-${ICEBERG_VERSION}.jar && \
    curl -L -o /usr/share/java/iceberg-aws-bundle-${ICEBERG_VERSION}.jar \
      https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-aws-bundle/${ICEBERG_VERSION}/iceberg-aws-bundle-${ICEBERG_VERSION}.jar && \
    chmod 644 /usr/share/java/iceberg-*.jar

# (Optional) Show what we installed
RUN ls -1 /usr/share/java/ | grep iceberg || true

USER appuser