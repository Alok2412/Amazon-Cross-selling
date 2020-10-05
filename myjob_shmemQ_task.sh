#!/bin/sh

#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH -A mucom001c
#SBATCH -p ShmemQ

module load conda/2
source activate mynewenv2
module load java
module load spark
module load intel
module load taskfarm



export SPARK_HOME='/ichec/home/users/alokkumarsin/myfiles/spark-2.3.3-bin-kay-spark'
export JAVA_HOME='/ichec/home/users/alokkumarsin/myfiles/8'

/ichec/home/users/alokkumarsin/myfiles/spark-2.3.3-bin-kay-spark/sbin/start-master.sh

/ichec/home/users/alokkumarsin/myfiles/spark-2.3.3-bin-kay-spark/sbin/start-slaves.sh



export SPARK_WORKER_CORES=3
export SPARK_EXECUTOR_CORES=3
export SPARK_MASTER_WEBUI_PORT=8081
export SPARK_WORKER_INSTANCES=20
export SPARK_EXECUTOR_INSTANCES=20
export SPARK_MASTER_MEMORY=1024M
export SPARK_EXECUTOR_MEMORY=15G
export SPARK_WORKER_MEMORY=15G



spark-submit  Amazon_Cross_Selling.py

/ichec/home/users/alokkumarsin/myfiles/spark-2.3.3-bin-kay-spark/sbin/stop-slaves.sh
/ichec/home/users/alokkumarsin/myfiles/spark-2.3.3-bin-kay-spark/sbin/stop-master.sh



