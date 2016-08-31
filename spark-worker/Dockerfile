# Dockerfile for Spark Worker.

FROM analytics/spark-base

ADD files/spark-worker-entrypoint.sh /entrypoints/spark-worker-entrypoint.sh
RUN chmod a+x /entrypoints/spark-worker-entrypoint.sh

ENTRYPOINT ["/entrypoints/spark-worker-entrypoint.sh"]
