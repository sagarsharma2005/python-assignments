from pyspark.sql import SparkSession
from pyspark.sql.functions import col

spark = SparkSession.builder \
    .appName("SalesDataFrameProcessing") \
    .getOrCreate()

# Read CSV into DataFrame
df = spark.read.csv(
    "data/sales.csv",
    header=True,
    inferSchema=True
)

# 1. Sort products by sales descending
print("\n===== Products Sorted By Sales =====")
sorted_df = df.orderBy(col("sales").desc())
sorted_df.show()

# 2. Top 3 highest sales products
print("\n===== Top 3 Products =====")
top3 = sorted_df.limit(3)
top3.show()

# 3. Filter products with sales > 80000
filtered_df = df.filter(col("sales") > 80000)

filtered_df.coalesce(1).write \
    .mode("overwrite") \
    .option("header", True) \
    .csv("output/high_sales_products")

print("\nFiltered products saved successfully.")

spark.stop()