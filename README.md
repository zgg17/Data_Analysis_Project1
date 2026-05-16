# 🛍️ Customer Shopping Behavior — End-to-End Data Analysis Project

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Google Colab](https://img.shields.io/badge/Google_Colab-F9AB00?style=for-the-badge&logo=googlecolab&logoColor=white)

A full-cycle data analysis project covering data cleaning, SQL-based business intelligence, and interactive dashboard reporting on retail customer shopping behavior.

---

## 📋 Table of Contents

- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Tools & Technologies](#tools--technologies)
- [Project Workflow](#project-workflow)
- [Data Cleaning](#data-cleaning)
- [Business Questions & SQL Analysis](#business-questions--sql-analysis)
- [Power BI Dashboard](#power-bi-dashboard)
- [Key Findings](#key-findings)
- [Repository Structure](#repository-structure)
- [How to Reproduce](#how-to-reproduce)

---

## Project Overview

This project analyzes retail customer shopping data to uncover patterns in purchasing behavior, subscription habits, revenue distribution, and product performance. The goal was to simulate a realistic analyst workflow: raw data → cleaning → SQL analysis → executive dashboard.

**Business questions explored:**
- Who generates more revenue — male or female customers?
- Do subscribed customers spend significantly more?
- Which products are most popular per category?
- Which age groups drive the most revenue?
- Are repeat buyers more likely to subscribe?
- Which products are discounted the most?

---

## Dataset

| Property | Detail |
|---|---|
| **Records** | 3,900 customers |
| **Features** | 18 columns (after cleaning: 17) |
| **Age Range** | 18 – 70 years |
| **Purchase Range** | $20 – $100 |
| **Average Purchase** | $59.76 |
| **Categories** | Clothing, Footwear, Outerwear, Accessories |
| **Seasons** | Spring, Summer, Fall, Winter |

<details>
<summary><strong>Column Descriptions (click to expand)</strong></summary>

| Column | Description |
|---|---|
| `customer_id` | Unique identifier per customer |
| `age` | Customer age |
| `gender` | Male / Female |
| `item_purchased` | Specific product bought |
| `category` | Product category |
| `purchase_amount` | Transaction value in USD |
| `location` | US state |
| `size` | Product size (S / M / L / XL) |
| `color` | Product color |
| `season` | Season of purchase |
| `review_rating` | Rating out of 5.0 |
| `subscription_status` | Whether the customer has an active subscription |
| `shipping_type` | Shipping method chosen |
| `discount_applied` | Whether a discount was used |
| `previous_purchases` | Count of prior transactions |
| `payment_method` | Payment method used |
| `frequency_of_purchases` | Self-reported purchase cadence |
| `age_group` *(engineered)* | Quartile-based age segment |
| `purchase_frequency_days` *(engineered)* | Purchase cadence converted to days |

</details>

---

## Tools & Technologies

| Stage | Tool |
|---|---|
| Data Cleaning | Python · Pandas · Google Colab |
| Data Storage | PostgreSQL |
| Analysis | SQL (PostgreSQL) |
| Visualization | Microsoft Power BI |

---

## Project Workflow

```
Raw CSV  →  Python Cleaning (Colab)  →  PostgreSQL  →  SQL Analysis  →  Power BI Dashboard
```

1. Loaded raw dataset
2. Cleaned and feature-engineered in Google Colab
3. Cleaned CSV imported into PostgreSQL
4. 10 business questions answered via SQL
5. Results visualized in an interactive Power BI dashboard

---

## Data Cleaning

Performed in **Google Colab** using Pandas. Key steps:

- **Null handling** — `review_rating` nulls filled with the category-level median (avoids cross-category bias)
  
  <img width="213" height="533" alt="image" src="https://github.com/user-attachments/assets/32a1db27-4ac2-4680-811f-5776809aacb0" />

- **Column standardization** — renamed to `snake_case`, simplified `purchase_amount_(usd)` → `purchase_amount`
  
  <img width="496" height="198" alt="image" src="https://github.com/user-attachments/assets/8ba6949f-5bac-4eba-bb3f-c9d30dbbc9bd" />

- **Duplicate column removal** — `promo_code_used` was found to be 100% identical to `discount_applied` and was dropped

  <img width="392" height="98" alt="image" src="https://github.com/user-attachments/assets/43e84914-10df-42fb-9a3f-6438fed88c97" />

- **Feature engineering:**
  - `age_group` — quartile-based segmentation into *Young Adult, Adult, Middle-aged, Senior*
    
    <img width="411" height="401" alt="image" src="https://github.com/user-attachments/assets/54566cc1-73d4-4ac5-8528-ebd5b216258e" />

  - `purchase_frequency_days` — mapped textual frequencies (e.g. "Fortnightly", "Monthly") to numeric day values for potential time-series use
    
    <img width="488" height="321" alt="image" src="https://github.com/user-attachments/assets/0e4f083f-646c-462a-b01f-5b38ff3c0b35" />


📓 **Notebook:** [`notebook/customer_shopping_behavior_cleaned.ipynb`](notebooks/customer_shopping_behavior_cleaned.ipynb)

---

## Business Questions & SQL Analysis

All queries are in [`sql/customer_behavior_query.sql`](sql/customer_behavior_query.sql).

| # | Question |
|---|---|
| 1 | Total revenue by gender |

<img width="232" height="108" alt="image" src="https://github.com/user-attachments/assets/a831e33e-5a1f-4c68-aad2-8bd54168f979" />

| 2 | Customers who used a discount but still spent above average |

<img width="336" height="232" alt="image" src="https://github.com/user-attachments/assets/2cb4dec9-7f69-430b-8e02-eb3fe79b85c4" />

| 3 | Top 5 products by average review rating |

<img width="335" height="202" alt="image" src="https://github.com/user-attachments/assets/eeb6ca37-deb0-48ed-b7c7-b507297d02c2" />

| 4 | Average purchase amount: Standard vs. Express shipping |

<img width="330" height="106" alt="image" src="https://github.com/user-attachments/assets/f37161a2-6ea4-4181-bba9-e361b8498790" />

| 5 | Do subscribed customers spend more? |

<img width="568" height="107" alt="image" src="https://github.com/user-attachments/assets/3ac273c9-2f59-4e2b-8604-e8854fdb3749" />

| 6 | Top 5 most-discounted products |

<img width="327" height="202" alt="image" src="https://github.com/user-attachments/assets/806caa39-2a0c-48e7-9df9-c238246f2336" />

| 7 | Customer segmentation: New / Returning / Loyal |

<img width="405" height="135" alt="image" src="https://github.com/user-attachments/assets/31ce3045-ea34-4fd9-9189-231c762651ca" />

| 8 | Top 3 most purchased products per category |

<img width="525" height="227" alt="image" src="https://github.com/user-attachments/assets/7b311526-d353-4699-881c-c53a1e85c28e" />

| 9 | Are repeat buyers (5+ purchases) more likely to subscribe? |

<img width="372" height="75" alt="image" src="https://github.com/user-attachments/assets/3193e1fb-ea69-4dec-bcc0-b74dcf6fd98e" />

| 10 | Revenue contribution by age group |

<img width="467" height="167" alt="image" src="https://github.com/user-attachments/assets/72f8365c-34d1-45c6-af75-a56449ab0833" />


## Power BI Dashboard

The dashboard is built in **Microsoft Power BI** and covers:

- Revenue breakdown by gender, age group, and category
- Subscriber vs. non-subscriber spend comparison
- Product performance and discount analysis
- Customer loyalty segmentation
- Seasonal purchase trends

📊 **File:** [`dashboard/Customer_Behavior_Dashboard.pbix`](dashboard/Customer_Behavior_Dashboard.pbix)

<img width="1335" height="727" alt="image" src="https://github.com/user-attachments/assets/16af1d58-d28e-407b-996b-35df55ddc204" />


<img width="1332" height="717" alt="image" src="https://github.com/user-attachments/assets/cfb88b05-1eef-4734-b36d-4ba3fe021286" />


> **Note:** Opening the `.pbix` file requires [Power BI Desktop](https://powerbi.microsoft.com/desktop/)

---

## Key Findings

- 💰 **Male customers** generated slightly higher total revenue, though the gender split was close — suggesting similar purchasing power, with volume driving the gap.
- 📦 **Subscribed customers** had a higher average spend and contributed disproportionately to total revenue despite representing only ~27% of the customer base.
- 🔁 **Repeat buyers** (more than 5 previous purchases) were significantly more likely to hold active subscriptions, pointing to a strong loyalty–subscription correlation.
- 👗 **Clothing** was the dominant category by order volume across all seasons.
- 🎯 Customers who used discounts but still spent above average represent a high-value segment for targeted retention campaigns.
- 📅 **Middle-aged and Adult** segments contributed the largest share of total revenue.

---



*Dataset downloaded from a tutorial video — original source unknown. This project is for portfolio and educational purposes.*
