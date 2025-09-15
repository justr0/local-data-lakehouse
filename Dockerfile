FROM apache/airflow:3.0.6
ADD requirements-dbt.txt requirements-dbt.txt
RUN pip install apache-airflow==${AIRFLOW_VERSION} -r requirements-dbt.txt

FROM confluentinc/cp-kafka-connect:latest
ENV CONNECT_PLUGIN_PATH: "/usr/share/java,/usr/share/confluent-hub-components"
RUN confluent-hub install --no-prompt tabular/iceberg-kafka-connect:0.6.5