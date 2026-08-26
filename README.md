# 💊 Pharmaceutical Pricing & Portfolio Analytics

**A SQL + Power BI analysis of a 253,973-product pharmaceutical portfolio — built to help commercial, pricing, and category teams answer one question: *where should we focus next?***

![Products](https://img.shields.io/badge/Products-253%2C973-blue) ![Manufacturers](https://img.shields.io/badge/Manufacturers-8%2C000%2B-orange) ![Therapeutic Classes](https://img.shields.io/badge/Therapeutic%20Classes-11-green) ![Tool](https://img.shields.io/badge/Tools-SQL%20%7C%20Power%20BI%20%7C%20Excel-lightgrey)

---

## 📌 Project Overview

This project turns a raw, 254K-row pharmaceutical product dataset into a decision-ready analytics package: a **25-query SQL analysis layer**, a **4-page interactive Power BI dashboard**, and a **stakeholder-facing recommendations framework**.

The goal isn't just to report numbers — it's to answer the questions a pricing committee, portfolio lead, or category manager actually asks in a review meeting: *Where is our portfolio concentrated? Where are we leaving margin on the table? Which manufacturers and ingredients matter most? What should we do about it?*

---

## 🎯 Business Objective

| # | Business Question |
|---|---|
| 1 | How large and how healthy is the product portfolio (active vs. discontinued)? |
| 2 | How is the portfolio distributed across therapeutic classes, dosage forms, and manufacturers? |
| 3 | Where are the pricing gaps and premium opportunities across products, forms, and manufacturers? |
| 4 | Which manufacturers and active ingredients dominate the portfolio — and where is that a risk or an opportunity? |
| 5 | What concrete actions should stakeholders take based on the data? |

---

## 🧰 Tools & Tech Stack

| Layer | Tool | Purpose |
|---|---|---|
| **Data Analysis** | MySQL | Business-question-driven SQL analysis using aggregation, CTEs, subqueries, and window functions |
| **Visualization** | Power BI | 4-page interactive dashboard with KPI reporting, slicers, and cross-filtering |
| **Data Analysis & Validation** | Excel | Data profiling, quality checks, exploratory analysis, and validation |
| **Business Recommendations** | Excel | Structured finding → implication → recommendation → impact framework |

---

## 🗂️ Repository Structure

```
Pharmaceutical-Pricing-Portfolio-Analytics/
│
├── 📄 README.md
│
├── 📊 Dashboard/
│   ├── Pharmaceutical Pricing Portfolio Dashboard.pbix
│
├── 📁 Data/
│   ├── indian_pharmaceutical_products_clean.csv
│
├── 🧮 SQL/
│   └── Pharmaceutical Pricing Portfolio Analysis.sql
│
├── 📈 Excel Analysis/
│   └── Pharmaceutical_Portfolio_Analysis.xlsx
│
├── 💡 Business Recommendations/
│   └── Business Recommendations & Strategic Actions.xlsx
│
└── 🖼️ Screenshots/
    ├── 01_Executive_Overview.png
    ├── 02_Pricing_Portfolio_Analysis.png
    ├── 03_Portfolio_Therapeutic_Analysis.png
    └── 04_Ingredient_Product_Analysis.png
```

---

## 📊 Dashboard Walkthrough

>  **Four pages, four perspectives on the same pharmaceutical portfolio — designed to move from executive overview to pricing, portfolio, therapeutic, and ingredient-level analysis.**

### 1️⃣ Executive Overview
<img width="872" height="668" alt="01_Executive_Overview" src="https://github.com/user-attachments/assets/f255c6f4-604a-4a20-aa63-cee1f7f238bc" />


The executive landing page provides a high-level view of **portfolio size, lifecycle health, therapeutic concentration, and dosage-form mix**.

- **253,973 products** across the portfolio
- **246K+ active products**, representing the majority of the portfolio
- **8,000+ manufacturers** contribute to the overall product portfolio
- **Other** and **Antibiotics** represent major therapeutic categories by product volume
- **Tablets** are the dominant dosage form

### 📌 Business Insights & Recommendations

**• Portfolio is concentrated across a few key therapeutic classes, with tablets representing the dominant dosage segment.**

**• Solutions and injections command higher average prices, highlighting potential premium-segment opportunities.**

**• Focus portfolio optimization on high-volume categories while evaluating premium segments for pricing and expansion opportunities.**

---

### 2️⃣ Pricing & Portfolio Analysis
<img width="826" height="671" alt="02_Pricing_Portfolio_Analysis" src="https://github.com/user-attachments/assets/4e6b987b-fbaa-4d19-9a5e-ea48b8299e0e" />


This dashboard focuses on **product pricing, price bands, dosage-form pricing, manufacturer pricing, and premium-product segments**.

- Average product price: **₹270.53**
- Product prices range from **₹0 to ₹436K**
- Premium-priced products represent approximately **9.14%** of the portfolio
- **Solutions and injections** have significantly higher average prices than tablets
- Most products fall within the lower price bands
- A small number of high-value products create a long pricing tail

### 📌 Business Insights & Recommendations

**• Pricing varies significantly across dosage forms, with solutions and injections positioned at higher average price points.**

**• Most products remain concentrated in lower price bands, while a smaller premium segment creates an opportunity for focused pricing review.**

**• Use differentiated pricing strategies by dosage form and price segment to improve portfolio positioning and pricing governance.**

---

### 3️⃣ Portfolio & Therapeutic Analysis
<img width="765" height="673" alt="03_Portfolio_Therapeutic_Analysis" src="https://github.com/user-attachments/assets/b845b6c5-1f4c-408b-bd5c-528cf802d4a5" />


This dashboard evaluates **manufacturer portfolio scale, therapeutic coverage, product complexity, and portfolio concentration**.

- Portfolio covers **11 therapeutic classes**
- Average products per manufacturer: **33.21**
- **Sun Pharmaceutical, Cipla, Intas, Torrent, Alkem, and Abbott** lead portfolio volume
- Single-ingredient products represent the largest product group
- Two-ingredient products form the next major segment

### 📌 Business Insights & Recommendations

**• A relatively small group of manufacturers accounts for a significant share of the overall product portfolio.**

**• Manufacturer scale varies across therapeutic coverage and product complexity, creating different portfolio positioning patterns.**

**• Benchmark manufacturers using both portfolio breadth and pricing position rather than product volume alone.**

---

### 4️⃣ Ingredient & Product Analysis
<img width="749" height="673" alt="04_Ingredient_Product_Analysis" src="https://github.com/user-attachments/assets/66d186e8-a62c-4d81-92cc-d4c6fc618bc2" />


This dashboard provides a deeper view of **active ingredients, ingredient complexity, dosage forms, and product representation**.

- **2,000+ unique active ingredients**
- Average active ingredients per product: **1.44**
- **44.18%** of products contain multiple active ingredients
- **Cefixime, Domperidone, Aceclofenac, and Amoxycillin** are among the most represented active ingredients
- Solutions and injections continue to show higher average pricing

### 📌 Business Insights & Recommendations

**• A relatively small group of active ingredients has high representation across the product portfolio.**

**• Multi-ingredient products represent a significant portion of the portfolio, indicating meaningful formulation complexity.**

**• Review high-penetration ingredients for product overlap, differentiation, and potential portfolio rationalization.**

---

## 🧮 SQL Analysis

The SQL layer contains 25 business-question-driven queries, with each query structured around a specific analytical requirement and business purpose.

| Category | Queries | Business Focus | SQL Techniques |
|---|---|---|---|
| **Portfolio Foundation** | Q1–Q6 | Portfolio size, lifecycle status, manufacturer/therapeutic/dosage/pack distribution | `GROUP BY`, `COUNT`, aggregate filtering |
| **Pricing Analysis** | Q7–Q12 | Average pricing by manufacturer, class, and dosage form; price segmentation; top-priced products | `AVG`, `ROUND`, `CASE`-based banding, `ORDER BY ... LIMIT` |
| **Ingredient Intelligence** | Q13–Q16 | Top ingredients, ingredient-count complexity, combination formulations, ingredient-by-class breakdown | Multi-column `GROUP BY`, `NULL`/blank filtering |
| **Manufacturer Benchmarking** | Q17–Q22 | Therapeutic coverage, portfolio-vs-pricing view, benchmark vs. overall average, ranking, top 3 per class | Correlated **subqueries**, **CTEs**, `RANK() OVER (PARTITION BY ...)` |
| **Executive & Advanced Analytics** | Q23–Q25 | Above-average priced products, therapeutic pricing rank, one-shot executive KPI summary | Subqueries, window functions, conditional aggregation (`SUM(CASE WHEN...)`) |

The SQL layer is designed to stand independently from the Power BI dashboard, allowing stakeholders to explore individual business questions directly from the analytical layer.

---

## 💡 Key Insights

- **Portfolio concentration:** A few therapeutic classes and tablets account for a significant share of overall product representation.
- **Pricing differentiation:** Solutions and injections command higher average prices than tablets and syrups, supporting a differentiated pricing perspective.
- **Separate manufacturer stories:** Manufacturers with the largest portfolios are not necessarily the same manufacturers with the highest average pricing.
- **Ingredient concentration:** A small group of active ingredients appears across a large number of products, creating opportunities for overlap and differentiation review.
- **Stable portfolio base:** The large proportion of active products indicates that the primary opportunity is portfolio optimization rather than broad lifecycle remediation.

---

## ✅ Business Recommendations

| Business Area | Key Finding | Recommendation | Expected Impact |
|---|---|---|---|
| 💊 **Therapeutic Portfolio** | Heavy concentration in a few classes; "Other" is a large, unclassified share | Reclassify "Other" and review portfolio mix by therapeutic class | Better resource allocation, clearer growth targets |
| 💰 **Pricing Strategy** | Solutions and injections price meaningfully above tablets | Set pricing strategy by dosage form, not portfolio-wide | Improved price positioning and margin management |
| 💎 **Price Segmentation** | Wide price range with a small high-value tail | Monitor by price band; review high-value segment governance | Stronger pricing oversight, visibility into high-value SKUs |
| 🏭 **Manufacturer Portfolio** | A small group of manufacturers drives a large share of products | Prioritize top manufacturers for strategic portfolio reviews | Sharper strategic focus and prioritization |
| 🧬 **Active Ingredient Portfolio** | Certain ingredients show very high penetration across products | Review high-penetration ingredients for overlap and differentiation | Reduced redundancy, better product planning |
| 🔄 **Lifecycle Management** | Active and discontinued products span all categories | Analyse discontinuation patterns by class, form, and price band | More focused active portfolio, better lifecycle planning |
| 📊 **Portfolio Monitoring** | Multiple portfolio dimensions can be tracked together | Use this dashboard as a recurring portfolio review tool | Faster decisions, stronger ongoing governance |

---

## 🚀 How to Reproduce This Analysis

1. **Load the data** — Import the pharmaceutical product dataset into MySQL.
2. **Run the SQL layer** — Execute the 25 documented queries to reproduce the portfolio, pricing, manufacturer, therapeutic, and ingredient analysis.
3. **Validate the analysis** — Use the Excel analysis file for data profiling, quality checks, and exploratory validation.
4. **Build or refresh the Power BI dashboard** — Connect Power BI to the analytical dataset and reproduce the four dashboard pages.
5. **Apply the recommendations framework** — Use the business recommendations file to translate findings into stakeholder-focused actions and expected impact.
---

## 📁 Files in This Repository

| File | Description |
|------|-------------|
| `SQL/Pharmaceutical Pricing Portfolio Analysis.sql` | 25 documented SQL queries covering portfolio, pricing, ingredient, and manufacturer analysis |
| `Dashboard/Pharmaceutical Pricing Portfolio Dashboard.pbix` | Interactive 4-page Power BI dashboard |
| `Data/indian_pharmaceutical_products_clean.csv` | Clean pharmaceutical product dataset used for analysis |
| `Excel Analysis/Pharmaceutical_Portfolio_Analysis.xlsx` | Data profiling, quality checks, and exploratory analysis |
| `Business Recommendations/Business Recommendations & Strategic Actions.xlsx` | Stakeholder-focused recommendations and strategic actions |
| `Screenshots/` | Individual dashboard screenshots for project documentation and preview |

---

# 👩‍💻 About Me

I believe data becomes valuable only when it helps answer real business questions. With a professional background in the pharmaceutical and life sciences industry, I've developed a strong understanding of commercial operations, sales performance, and business reporting. Today, I'm channeling that domain knowledge into analytics by building practical, business-focused solutions using **Power BI, SQL, Excel, and Python**.

This portfolio showcases projects inspired by real business scenarios, where the focus goes beyond creating dashboards to uncovering insights, solving problems, and supporting data-driven decision-making. Every project reflects my approach to combining business understanding with analytical thinking to deliver meaningful outcomes.

If you have any feedback, suggestions, or would like to connect, I'd be happy to hear from you.

📧 **Email:** **[Shilpikumari0623@gmail.com](mailto:Shilpikumari0623@gmail.com)**

💼 **LinkedIn:** **[Shilpi Kumari](https://www.linkedin.com/in/shilpi-kumari-2ab98a220/)**

---

# 📚 Dataset Credit

This project uses the **Indian Pharmaceutical Products** dataset created by **Marília Prata** and made available through Kaggle.

🔗 **Dataset:** **[Indian Pharmaceutical Products – Kaggle](https://www.kaggle.com/code/mpwolke/india-pharmacy-of-the-world/input)**

The dataset is used strictly for **educational, learning, and portfolio purposes**. All rights and credit belong to the original author.


