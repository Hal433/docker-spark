# Dockerfile for Spark Master.

FROM analytics/spark-base

ADD files/spark-master-entrypoint.sh /entrypoints/spark-master-entrypoint.sh
RUN chmod a+x /entrypoints/spark-master-entrypoint.sh

ENTRYPOINT ["/entrypoints/spark-master-entrypoint.sh"]
