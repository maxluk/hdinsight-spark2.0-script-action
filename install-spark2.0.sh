#!/bin/bash

newspark="spark-2.0.0-bin-hadoop2.7"

SPARK_DIR="$(readlink -f "/usr/hdp/current/spark-client")"
SPARK_CONF_DIR="$(readlink -f "/usr/hdp/current/spark-client/conf")"

cd "/tmp"
curl "http://d3kbcqa49mib13.cloudfront.net/$newspark.tgz" | tar xzf -
cd "$newspark"
rm -r "jars/hadoop"* "conf"
ln -s "$SPARK_CONF_DIR" "conf"
cd ..
rm -r "$SPARK_DIR"
mv "$newspark" "$SPARK_DIR"

echo "Spark 2.0 installation completed"
