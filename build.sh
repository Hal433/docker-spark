#!/bin/bash

echo -e "Building Spark docker images..."

function build_img() {
  local prefix=$1
  local imgname=$2
  local img="${prefix}/${imgname}"

  echo -e "Building docker $img..."

  pushd $(pwd)
  cd $imgname
  docker build -t $img .
  popd
}

IMGPREFIX=analytics

build_img $IMGPREFIX spark-base
build_img $IMGPREFIX spark-master
build_img $IMGPREFIX spark-worker
