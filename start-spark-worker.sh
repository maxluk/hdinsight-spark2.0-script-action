#! /bin/bash

# Link conf in root -> /etc/spark/2.4.2.4-5/0
# Link spark-assembly.jar in lib -> ./spark-assembly-*.jar
#

# Import the helper method module.
wget -O /tmp/HDInsightUtilities-v01.sh -q https://hdiconfigactions.blob.core.windows.net/linuxconfigactionmodulev01/HDInsightUtilities-v01.sh && source /tmp/HDInsightUtilities-v01.sh && rm -f /tmp/HDInsightUtilities-v01.sh

fullHostName=$(hostname -f)
echo "fullHostName=$fullHostName"

shortHostName=$(hostname)
echo "shortHostName=$shortHostName"

cd /usr/hdp/2.4.2.4-5/spark
export SPARK_DIST_CLASSPATH=$SPARK_DIST_CLASSPATH:/usr/hdp/current/spark-historyserver/conf/:/usr/hdp/2.4.2.4-5/spark/lib/datanucleus-api-jdo-3.2.6.jar:/usr/hdp/2.4.2.4-5/spark/lib/datanucleus-rdbms-3.2.9.jar:/usr/hdp/2.4.2.4-5/spark/lib/datanucleus-core-3.2.10.jar:/etc/hadoop/conf/:/usr/lib/hdinsight-datalake/*:/usr/hdp/2.4.2.4-5/hadoop/lib/hadoop-lzo-0.6.0.2.4.2.4-5.jar:/usr/hdp/current/hadoop-client/hadoop-azure.jar:/usr/hdp/current/hadoop-client/lib/azure-storage-2.2.0.jar:/usr/lib/hdinsight-logging/mdsdclient-1.0.jar:/usr/lib/hdinsight-logging/microsoft-log4j-etwappender-1.0.jar:/usr/lib/hdinsight-logging/json-simple-1.1.jar:/usr/hdp/2.4.2.4-5/hadoop/client/slf4j-log4j12.jar:/usr/hdp/2.4.2.4-5/hadoop/client/slf4j-api.jar:/usr/hdp/2.4.2.4-5/hadoop/hadoop-common.jar:/usr/hdp/2.4.2.4-5/hadoop/hadoop-azure.jar:/usr/hdp/2.4.2.4-5/hadoop/client/log4j.jar:/usr/hdp/2.4.2.4-5/hadoop/client/commons-configuration-1.6.jar:/usr/hdp/2.4.2.4-5/hadoop/lib/*:/usr/hdp/2.4.2.4-5/hadoop/client/*:usr/hdp/2.4.2.4-5/spark/conf:
sbin/start-slave.sh spark://$shortHostName:7077

echo "Spark slave start script complete"
