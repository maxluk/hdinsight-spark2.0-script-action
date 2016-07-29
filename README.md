# hdinsight-spark2.0-script-action
Script action to install Spark 2.0 on top of Spark 1.6.x cluster (for development and experimental purposes).
This script action is limited at the moment only to standalone mode. Also none of the standard HDInsight Spark cluster services are expected to work (e.g. Jupyter, Livy, Thrift).

Installation instructions:
1. Create HDInsight Spark cluster version 3.4 (Spark 1.6.1)
2. Run script action: install-spark2.0.sh on this cluster. The script action is provided in this repository.
3. Update class path in the cluster configuration. Open Ambari portal of the cluster, go to Spark > Configs > Advanced spark-env and update SPARK_DIST_CLASSPATH variable to the following value:

	export SPARK_DIST_CLASSPATH=$SPARK_DIST_CLASSPATH:/usr/hdp/current/spark-historyserver/conf/:/usr/hdp/2.4.2.0-258/spark/lib/datanucleus-api-jdo-3.2.6.jar:/usr/hdp/2.4.2.0-258/spark/lib/datanucleus-rdbms-3.2.9.jar:/usr/hdp/2.4.2.0-258/spark/lib/datanucleus-core-3.2.10.jar:/etc/hadoop/conf/:/usr/lib/hdinsight-datalake/*:/usr/hdp/2.4.2.0-258/hadoop/lib/hadoop-lzo-0.6.0.2.4.2.0-258.jar:/usr/hdp/current/hadoop-client/hadoop-azure.jar:/usr/hdp/current/hadoop-client/lib/azure-storage-2.2.0.jar:/usr/lib/hdinsight-logging/mdsdclient-1.0.jar:/usr/lib/hdinsight-logging/microsoft-log4j-etwappender-1.0.jar:/usr/lib/hdinsight-logging/json-simple-1.1.jar:/usr/hdp/2.4.2.0-258/hadoop/client/slf4j-log4j12.jar:/usr/hdp/2.4.2.0-258/hadoop/client/slf4j-api.jar:/usr/hdp/2.4.2.0-258/hadoop/hadoop-common.jar:/usr/hdp/2.4.2.0-258/hadoop/hadoop-azure.jar:/usr/hdp/2.4.2.0-258/hadoop/client/log4j.jar:/usr/hdp/2.4.2.0-258/hadoop/client/commons-configuration-1.6.jar:/usr/hdp/2.4.2.0-258/hadoop/lib/*:/usr/hdp/2.4.2.0-258/hadoop/client/*:usr/hdp/2.4.2.0-258/spark/conf/:

4. Launch spark master on head node by following command: 
	`cd /usr/hdp/2.4.2.0-258/spark/
	 sudo sbin/start-master.sh`
5. Launch Spark workers on all worker nodes of the cluster by launching following script action: start-spark-worker.sh. The script action is provided in this repo. The script action has hard coded name of the headnode that needs to be updated. Change `hn0-s20pre` to the name of the headnode on your cluster.
6. Check that standalone cluster is up and running and all workers has registered itself in Spark UI on the headnode port 8081.

At this point you can start spark-shell or spark-submit in standalone mode using address of the spark master from the Spark UI in step 6.
