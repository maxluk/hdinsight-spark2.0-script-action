#! /bin/bash

# Link conf in root -> /etc/spark/2.4.1.1-3/0
#

# Import the helper method module.
wget -O /tmp/HDInsightUtilities-v01.sh -q https://hdiconfigactions.blob.core.windows.net/linuxconfigactionmodulev01/HDInsightUtilities-v01.sh && source /tmp/HDInsightUtilities-v01.sh && rm -f /tmp/HDInsightUtilities-v01.sh

fullHostName=$(hostname -f)
echo "fullHostName=$fullHostName"

cd /root
wget https://www.apache.org/dist/spark/spark-2.0.0/spark-2.0.0-bin-hadoop2.7.tgz
tar -xzf spark-2.0.0-bin-hadoop2.7.tgz
cd spark-2.0.0-bin-hadoop2.7
rm -r conf
rm jars/hadoop-*
ln -s /etc/spark/2.4.2.4-5/0 conf

cd ..
rm -r /usr/hdp/2.4.2.4-5/spark
mv spark-2.0.0-bin-hadoop2.7 /usr/hdp/2.4.2.4-5/spark 

echo "Spark 2.0 installation completed"
