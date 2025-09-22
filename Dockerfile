FROM apache/airflow:latest
ADD requirements-dbt.txt requirements-dbt.txt
RUN pip install apache-airflow==${AIRFLOW_VERSION} -r requirements-dbt.txt