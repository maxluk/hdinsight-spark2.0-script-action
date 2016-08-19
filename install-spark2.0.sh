#! /bin/bash

# Link conf in root -> /etc/spark/2.4.1.1-3/0
#

# Import the helper method module.
wget -O /tmp/HDInsightUtilities-v01.sh -q https://hdiconfigactions.blob.core.windows.net/linuxconfigactionmodulev01/HDInsightUtilities-v01.sh && source /tmp/HDInsightUtilities-v01.sh && rm -f /tmp/HDInsightUtilities-v01.sh

fullHostName=$(hostname -f)
echo "fullHostName=$fullHostName"

SPARK_DIR=$(readlink -f /usr/hdp/current/spark-client)
SPARK_CONF_DIR=$(readlink -f /usr/hdp/current/spark-client/conf)

cd /root
wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz
tar -xzf spark-2.0.0-bin-hadoop2.7.tgz
cd spark-2.0.0-bin-hadoop2.7
rm jars/hadoop*
rm -r conf
ln -s $SPARK_CONF_DIR conf

cd ..
rm -r $SPARK_DIR
mv spark-2.0.0-bin-hadoop2.7 $SPARK_DIR 

echo "Spark 2.0 installation completed"
