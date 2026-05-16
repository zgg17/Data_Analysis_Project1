-- ============================================================
-- Customer Shopping Behavior — Database Setup
-- ============================================================
-- Run this first to create the table, then load the cleaned CSV.
-- Compatible with PostgreSQL 13+
-- ============================================================

DROP TABLE IF EXISTS customer_behavior;

CREATE TABLE customer_behavior (
    customer_id             INT             NOT NULL,
    age                     INT,
    gender                  TEXT,
    item_purchased          TEXT,
    category                TEXT,
    purchase_amount         NUMERIC(8, 2),
    location                TEXT,
    size                    TEXT,
    color                   TEXT,
    season                  TEXT,
    review_rating           FLOAT,
    subscription_status     TEXT,
    shipping_type           TEXT,
    discount_applied        TEXT,
    previous_purchases      INT,
    payment_method          TEXT,
    frequency_of_purchases  TEXT,
    age_group               TEXT,
    purchase_frequency_days INT,
    PRIMARY KEY (customer_id)
);

-- ============================================================
-- Load cleaned CSV (adjust path as needed)
-- ============================================================
-- From psql:
-- \copy customer_behavior FROM 'path/to/customer_behavior_cleaned.csv' DELIMITER ',' CSV HEADER;
--
-- Or use pgAdmin / DBeaver's import wizard to load the file.
-- ============================================================
