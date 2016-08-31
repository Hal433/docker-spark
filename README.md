# Docker images for Apache Spark

## Introduction

## Usage examples

Create event log directory in HDFS.

```bash
./hadoop.sh fs -mkdir /spark-logs
```

Execute Spark Shell.

```bash
docker exec -it spark-master spark-shell --master spark://spark-master:7077
```
