Build Docker Image
docker build -t partition-demo .
Run Docker Container
docker run --rm partition-demo
Expected Output

Initial number of partitions

Partitions after repartition(12)

Partitions after coalesce(3)