#!/bin/bash

echo -e "Building Spark docker images."

function build_img() {
  local prefix=$1
  local imgname=$2
  local img="${prefix}/${imgname}"

  echo -e "Building docker image ${img}..."
  docker build -t $img .
}

IMGPREFIX=analytics

cd base
build_img $IMGPREFIX hadoop-spark

cd ../spark-master
build_img $IMGPREFIX hadoop-spark-master

cd ../spark-worker
build_img $IMGPREFIX hadoop-spark-worker
