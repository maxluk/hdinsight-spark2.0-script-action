#!/bin/bash

SPARK_DIR="$(readlink -f "/usr/hdp/current/spark-client")"
SPARK_CONF_DIR="$(readlink -f "/usr/hdp/current/spark-client/conf")"

cd "/root"
wget "http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz"
tar -xzf "spark-2.0.0-bin-hadoop2.7.tgz"
cd "spark-2.0.0-bin-hadoop2.7"
rm "jars/hadoop"*
rm -r "conf"
ln -s "$SPARK_CONF_DIR" "conf"

cd ..
rm -r "$SPARK_DIR"
mv "spark-2.0.0-bin-hadoop2.7" "$SPARK_DIR"

echo "Spark 2.0 installation completed"
