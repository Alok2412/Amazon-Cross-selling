import os
def setup_my_environment():
    import os
    
def setenv(var, val):
    os.environ[var] = val

def prepend_path(var, val):
    old_val = os.environ.get(var, '')
    os.environ[var] = val + ":" + old_val
def setup_java():
    PKG_ROOT='/ichec/packages/java/8'
    setenv('JAVA_PATH', PKG_ROOT)
    setenv('JAVA_HOME', PKG_ROOT)
    prepend_path('PATH', PKG_ROOT + '/bin')
    prepend_path('MANPATH', PKG_ROOT + '/man')
    prepend_path('CPATH', PKG_ROOT + '/include')
def setup_spark():
    PKG_ROOT='/ichec/packages/spark/2.3.3/kay/spark-2.3.3'
    setenv('SPARK_DIST_CLASSPATH', PKG_ROOT + 'spark-2.3.3-bin-kay-spark')
    prepend_path('PATH', PKG_ROOT + PKG_ROOT + 'spark-2.3.3-bin-kay-spark/bin')
setup_java()
setup_spark()
setup_my_environment()
from pyspark import SparkConf
from pyspark.context import SparkContext
from pyspark.sql import SQLContext
from pyspark.sql import SparkSession

spark = SparkSession \
.builder \
.config("spark.executor.memory", "90g") \
.config("spark.driver.memory", "90g") \
.appName("DataMerging") \
.getOrCreate()
df = spark.read.json("/ichec/work/mucom001c/Amazon/review/*.json")
