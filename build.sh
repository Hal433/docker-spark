#!/bin/bash

echo -e "Building Spark docker images..."

cd base
docker build -t bwv988/hadoop-spark .

cd ../spark-master
docker build -t bwv988/hadoop-spark-master .

cd ../spark-worker
docker build -t bwv988/hadoop-spark-worker .
