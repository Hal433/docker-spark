# Dockerfile for Spark Master.

FROM analytics/hadoop-spark

ADD spark-master-entrypoint.sh /entrypoints/spark-master-entrypoint.sh
RUN chmod a+x /entrypoints/spark-master-entrypoint.sh

ENTRYPOINT ["/entrypoints/spark-master-entrypoint.sh"]
