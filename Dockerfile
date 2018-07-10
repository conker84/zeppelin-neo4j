FROM apache/zeppelin:0.8.0

# Workaround to "fix" https://issues.apache.org/jira/browse/ZEPPELIN-3586

RUN echo "$LOG_TAG Download Spark binary" && \
    wget -O /tmp/spark-2.3.1-bin-hadoop2.7.tgz http://apache.panu.it/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz && \
    tar -zxvf /tmp/spark-2.3.1-bin-hadoop2.7.tgz && \
    rm -rf /tmp/spark-2.3.1-bin-hadoop2.7.tgz && \
    mv spark-2.3.1-bin-hadoop2.7 /spark-2.3.1-bin-hadoop2.7
	
ENV SPARK_HOME=/spark-2.3.1-bin-hadoop2.7
	
CMD ["bin/zeppelin.sh"]