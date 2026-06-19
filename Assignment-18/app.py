from pyspark.sql import SparkSession

# Create Spark Session
spark = SparkSession.builder \
    .appName("PartitionDemo") \
    .getOrCreate()

# Generate 5 million records
df = spark.range(5000000)

print("\n===== Initial Partitions =====")
print(df.rdd.getNumPartitions())

# Increase partitions to 12
df_repartition = df.repartition(12)

print("\n===== After Repartition(12) =====")
print(df_repartition.rdd.getNumPartitions())

# Reduce partitions to 3
df_coalesce = df_repartition.coalesce(3)

print("\n===== After Coalesce(3) =====")
print(df_coalesce.rdd.getNumPartitions())

spark.stop()