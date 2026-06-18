from pyspark.sql import SparkSession
import os

# Create Spark Session
spark = SparkSession.builder \
    .appName("EmployeeRDDProcessing") \
    .getOrCreate()

sc = spark.sparkContext

# Read CSV
rdd = sc.textFile("data/employees.csv")

# Remove header
header = rdd.first()

employee_rdd = rdd.filter(lambda x: x != header) \
                  .map(lambda x: x.split(","))

# 1. Sort employees by salary descending
sorted_employees = employee_rdd.sortBy(
    lambda x: int(x[3]),
    ascending=False
)

print("\n===== Employees Sorted By Salary =====")
for emp in sorted_employees.collect():
    print(emp)

# 2. Total salary by department
dept_salary = employee_rdd.map(
    lambda x: (x[2], int(x[3]))
).reduceByKey(
    lambda a, b: a + b
)

print("\n===== Department Wise Salary Total =====")
for dept, total in dept_salary.collect():
    print(f"{dept}: {total}")

# 3. Top 3 highest paid employees
top_3 = sorted_employees.take(3)

os.makedirs("output", exist_ok=True)

with open("output/top_3_employees.txt", "w") as f:
    f.write("Top 3 Highest Paid Employees\n\n")

    for emp in top_3:
        f.write(
            f"ID:{emp[0]}, Name:{emp[1]}, Department:{emp[2]}, Salary:{emp[3]}\n"
        )

print("\nTop 3 employees saved successfully.")

spark.stop()