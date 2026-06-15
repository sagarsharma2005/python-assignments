Create Database DataBank;

Use DataBank;

CREATE TABLE regions (
  region_id INTEGER,
  region_name VARCHAR(9)
);

INSERT INTO regions
  (region_id, region_name)
VALUES
  ('1', 'Australia'),
  ('2', 'America'),
  ('3', 'Africa'),
  ('4', 'Asia'),
  ('5', 'Europe');


CREATE TABLE customer_nodes (
  customer_id INTEGER,
  region_id INTEGER,
  node_id INTEGER,
  start_date DATE,
  end_date DATE
);

INSERT INTO customer_nodes
  (customer_id, region_id, node_id, start_date, end_date)
VALUES
  ('1', '3', '4', '2020-01-02', '2020-01-03'),
  ('2', '3', '5', '2020-01-03', '2020-01-17'),
  ('3', '5', '4', '2020-01-27', '2020-02-18'),
  ('4', '5', '4', '2020-01-07', '2020-01-19'),
  ('5', '3', '3', '2020-01-15', '2020-01-23'),
  ('6', '1', '1', '2020-01-11', '2020-02-06'),
  ('7', '2', '5', '2020-01-20', '2020-02-04'),
  ('8', '1', '2', '2020-01-15', '2020-01-28'),
  ('9', '4', '5', '2020-01-21', '2020-01-25'),
  ('10', '3', '4', '2020-01-13', '2020-01-14'),
  ('11', '2', '5', '2020-01-19', '2020-01-25'),
  ('12', '1', '2', '2020-01-13', '2020-01-14'),
  ('13', '2', '3', '2020-01-02', '2020-01-14'),
  ('14', '1', '2', '2020-01-25', '2020-01-25'),
  ('15', '1', '3', '2020-01-25', '2020-02-08'),
  ('16', '4', '4', '2020-01-13', '2020-01-18'),
  ('17', '2', '3', '2020-01-19', '2020-01-27'),
  ('18', '1', '3', '2020-01-17', '2020-02-15'),
  ('19', '2', '2', '2020-01-17', '2020-02-06'),
  ('20', '2', '4', '2020-01-18', '2020-02-09'),
  ('21', '3', '2', '2020-01-12', '2020-01-25'),
  ('22', '4', '3', '2020-01-19', '2020-02-18'),
  ('23', '1', '5', '2020-01-21', '2020-02-15'),
  ('24', '2', '5', '2020-01-26', '2020-02-14'),
  ('25', '5', '1', '2020-01-28', '2020-02-10'),
  ('26', '3', '3', '2020-01-17', '2020-01-25'),
  ('27', '4', '3', '2020-01-01', '2020-01-22'),
  ('28', '4', '2', '2020-01-20', '2020-02-13'),
  ('29', '2', '3', '2020-01-19', '2020-01-31'),
  ('30', '2', '1', '2020-01-26', '2020-02-06'),
  ('31', '3', '2', '2020-01-06', '2020-01-13'),
  ('32', '4', '4', '2020-01-12', '2020-01-14'),
  ('33', '3', '4', '2020-01-24', '2020-02-17'),
  ('34', '2', '3', '2020-01-30', '2020-02-18'),
  ('35', '4', '5', '2020-01-17', '2020-02-15'),
  ('36', '2', '3', '2020-01-30', '2020-02-19'),
  ('37', '1', '3', '2020-01-29', '2020-02-04'),
  ('38', '5', '1', '2020-01-21', '2020-02-14'),
  ('39', '5', '2', '2020-01-22', '2020-01-23'),
  ('40', '2', '1', '2020-01-21', '2020-02-17'),
  ('41', '5', '1', '2020-01-30', '2020-02-26'),
  ('42', '4', '3', '2020-01-11', '2020-01-16'),
  ('43', '2', '2', '2020-01-28', '2020-02-25'),
  ('44', '3', '1', '2020-01-19', '2020-02-09'),
  ('45', '2', '1', '2020-01-14', '2020-02-08'),
  ('46', '1', '4', '2020-01-23', '2020-01-26'),
  ('47', '5', '4', '2020-01-22', '2020-01-26'),
  ('48', '5', '2', '2020-01-01', '2020-01-18'),
  ('49', '2', '5', '2020-01-04', '2020-01-09'),
  ('50', '2', '5', '2020-01-29', '2020-02-06');

  CREATE TABLE customer_transactions (
    customer_id INT,
    txn_date DATE,
    txn_type VARCHAR(20),
    txn_amount INT
);

INSERT INTO customer_transactions
(customer_id, txn_date, txn_type, txn_amount)
VALUES
(429, '2020-01-21', 'deposit', 82),
(155, '2020-01-10', 'deposit', 712),
(398, '2020-01-01', 'deposit', 196),
(255, '2020-01-14', 'deposit', 563),
(185, '2020-01-29', 'deposit', 626),
(309, '2020-01-13', 'deposit', 995),
(312, '2020-01-20', 'deposit', 485),
(376, '2020-01-03', 'deposit', 706),
(188, '2020-01-13', 'deposit', 601),
(138, '2020-01-11', 'deposit', 520);

-- A1. How many unique nodes are there on the Data Bank system?

SELECT COUNT(DISTINCT node_id) AS unique_nodes
FROM customer_nodes;


-- A2. What is the number of nodes per region?

SELECT
    r.region_name,
    COUNT(DISTINCT c.node_id) AS total_nodes
FROM customer_nodes c
JOIN regions r
ON c.region_id = r.region_id
GROUP BY r.region_name;


-- A3. How many customers are allocated to each region?

SELECT
    r.region_name,
    COUNT(DISTINCT c.customer_id) AS total_customers
FROM customer_nodes c
JOIN regions r
ON c.region_id = r.region_id
GROUP BY r.region_name;


-- A4. How many days on average are customers reallocated to a different node?

SELECT
    ROUND(AVG(DATEDIFF(end_date, start_date)),2) AS average_days
FROM customer_nodes
WHERE end_date <> '9999-12-31';


-- A5. Median, 80th and 95th percentile reallocation days for each region

SELECT
    region_id,

    PERCENTILE_CONT(0.5)
    WITHIN GROUP (ORDER BY DATEDIFF(end_date,start_date)) AS median_days,

    PERCENTILE_CONT(0.8)
    WITHIN GROUP (ORDER BY DATEDIFF(end_date,start_date)) AS percentile_80,

    PERCENTILE_CONT(0.95)
    WITHIN GROUP (ORDER BY DATEDIFF(end_date,start_date)) AS percentile_95

FROM customer_nodes
WHERE end_date <> '9999-12-31'
GROUP BY region_id;


-- B1. Unique count and total amount for each transaction type

SELECT
    txn_type,
    COUNT(*) AS transaction_count,
    SUM(txn_amount) AS total_amount
FROM customer_transactions
GROUP BY txn_type;


-- B2. Average historical deposit counts and amounts

SELECT
    ROUND(AVG(deposit_count),2) AS avg_deposit_count,
    ROUND(AVG(deposit_amount),2) AS avg_deposit_amount
FROM
(
    SELECT
        customer_id,
        COUNT(*) AS deposit_count,
        SUM(txn_amount) AS deposit_amount
    FROM customer_transactions
    WHERE txn_type = 'deposit'
    GROUP BY customer_id
) x;


-- B3. Customers making >1 deposit and either 1 purchase or 1 withdrawal in a month

SELECT
    month_no,
    COUNT(*) AS customer_count
FROM
(
    SELECT
        customer_id,
        MONTH(txn_date) AS month_no,

        SUM(CASE WHEN txn_type='deposit' THEN 1 ELSE 0 END) deposits,
        SUM(CASE WHEN txn_type='purchase' THEN 1 ELSE 0 END) purchases,
        SUM(CASE WHEN txn_type='withdrawal' THEN 1 ELSE 0 END) withdrawals

    FROM customer_transactions
    GROUP BY customer_id, MONTH(txn_date)
) t
WHERE deposits > 1
AND (purchases >= 1 OR withdrawals >= 1)
GROUP BY month_no
ORDER BY month_no;