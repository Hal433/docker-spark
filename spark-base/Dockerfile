# Base docker file for Apache Spark containers.
# FIXME: Removed verification of download temporarily!
# FIXME: Hard-coded Irish Apache mirror, but should use cloud-based one.
# FIXME: Should link hive-site.xml from Hive container, instead of copying it.

FROM analytics/hadoop-base

ENV SPARK_VERSION 2.0.0
ENV HADOOP_VERSION 2.7
ENV SPARK_DL_MIRROR=http://ftp.heanet.ie/mirrors/www.apache.org
ENV SPARK_DL_FILE=spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}
ENV SPARK_URL $SPARK_DL_MIRROR/dist/spark/spark-${SPARK_VERSION}/${SPARK_DL_FILE}.tgz
RUN set -x \
    && curl -kfSL "$SPARK_URL" -o /tmp/spark.tar.gz \
    && tar -xvf /tmp/spark.tar.gz -C /opt/ \
    && rm /tmp/spark.tar.gz*

ENV SPARK_HOME=/opt/spark-$SPARK_VERSION
RUN mv /opt/$SPARK_DL_FILE $SPARK_HOME

WORKDIR $SPARK_HOME
ENV PATH $SPARK_HOME/bin:$PATH

COPY files/spark-entrypoint.sh /entrypoints/spark-entrypoint.sh
COPY files/inject_spark_cfg.sh /entrypoints/inject_spark_cfg.sh
COPY files/runhistoryserver.sh /entrypoints/runhistoryserver.sh
COPY files/hive-site.xml $SPARK_HOME/conf/hive-site.xml

RUN chmod a+x /entrypoints/spark-entrypoint.sh \
  && chmod a+x /entrypoints/runhistoryserver.sh \
  && echo "export SPARK_DIST_CLASSPATH=$(hadoop classpath)" >> /opt/spark-$SPARK_VERSION/conf/spark-env.sh \
  && ln -s /usr/share/java/postgresql-jdbc4.jar /opt/spark-$SPARK_VERSION/jars/postgresql-jdbc4.jar

ENTRYPOINT ["/entrypoints/spark-entrypoint.sh"]
CMD ["/entrypoints/runhistoryserver.sh"]
