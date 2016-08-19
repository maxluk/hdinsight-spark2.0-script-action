# hdinsight-spark2.0-script-action
Script action to install Spark 2.0 on top of HDInsight Spark 1.6.x cluster (for development and experimental purposes).
This script action is limited at the moment only to basic Spark services in command line. Standard HDInsight Spark cluster services are not working (e.g. Jupyter, Livy, Thrift).

## Installation instructions

1. Create HDInsight Spark cluster version 3.4 (Spark 1.6.1)
2. Run script action: `install-spark2.0.sh` on this cluster. Go to Azure portal > open cluster blade > open Script Actions tile > click Submit new and follow instructions. The script action is provided in this repository.
3. Update class path in the cluster configuration. Open Ambari portal of the cluster, go to Spark > Configs > Advanced spark-env and update SPARK_DIST_CLASSPATH variable to the following value:

	```bash
	export SPARK_DIST_CLASSPATH=$SPARK_DIST_CLASSPATH:/usr/hdp/2.4.2.4-5/spark/jars/netty-all-4.0.29.Final.jar:/usr/hdp/current/spark-historyserver/conf/:/usr/hdp/2.4.2.4-5/spark/jars/datanucleus-api-jdo-3.2.6.jar:/usr/hdp/2.4.2.4-5/spark/jars/datanucleus-rdbms-3.2.9.jar:/usr/hdp/2.4.2.4-5/spark/jars/datanucleus-core-3.2.10.jar:/etc/hadoop/conf/:/usr/lib/hdinsight-datalake/*:/usr/hdp/2.4.2.4-5/hadoop/lib/hadoop-lzo-0.6.0.2.4.2.4-5.jar:/usr/hdp/current/hadoop-client/hadoop-azure.jar:/usr/hdp/current/hadoop-client/lib/azure-storage-2.2.0.jar:/usr/lib/hdinsight-logging/mdsdclient-1.0.jar:/usr/lib/hdinsight-logging/microsoft-log4j-etwappender-1.0.jar:/usr/lib/hdinsight-logging/json-simple-1.1.jar:/usr/hdp/2.4.2.4-5/hadoop/client/slf4j-log4j12.jar:/usr/hdp/2.4.2.4-5/hadoop/client/slf4j-api.jar:/usr/hdp/2.4.2.4-5/hadoop/hadoop-common.jar:/usr/hdp/2.4.2.4-5/hadoop/hadoop-azure.jar:/usr/hdp/2.4.2.4-5/hadoop/client/log4j.jar:/usr/hdp/2.4.2.4-5/hadoop/client/commons-configuration-1.6.jar:/usr/hdp/2.4.2.4-5/hadoop/lib/*:/usr/hdp/2.4.2.4-5/hadoop/client/*:/usr/hdp/2.4.2.4-5/spark/conf/:/usr/hdp/2.4.2.4-5/hadoop-yarn/hadoop-yarn-server-web-proxy.jar:/usr/hdp/2.4.2.4-5/spark/jars/spark-yarn_2.11-2.0.0.jar:/usr/hdp/2.4.2.4-5/spark/jars/*:
	```

	Restart affected Ambari services.

4. Update `spark.yarn.jars` property. Open Ambari portal of the cluster, go to Spark > Configs > Custom spark-defaults.
	4.1. Remove `spark.yarn.jar` property
	4.2. Add `spark.yarn.jars` property and set its value to `local:///usr/hdp/current/spark-client/jars/*`.

5. Remove spark shuffle service from Yarn settings. Open Ambari portal of the cluster, go to Yarn > Advanced > Node manager and remove `spark_shuffle` by setting `yarn.nodemanager.aux-services` property to value `mapreduce_shuffle`.

6. In ssh session launch `spark-shell`, `spark-submit`, etc.
