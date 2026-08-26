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
| **Data Analysis** | MySQL | 25 business-question-driven queries: aggregation, CTEs, window functions, subqueries |
| **Visualization** | Power BI | 4-page interactive executive dashboard with cross-filtering |
| **Stakeholder Deliverable** | Excel | Structured recommendation framework (finding → implication → action → impact) |

---

## 🗂️ Repository Structure

```
Pharmaceutical-Pricing-Portfolio-Analytics/
│
├── 📄 README.md
│
├── 📊 Dashboard/
│   ├── Pharmaceutical_Pricing_Portfolio_Dashboard.pbix
│
├── 📁 Data/
│   ├── indian_pharmaceutical_products_clean.csv
│   └── Processed_Indian_Pharmaceutical_Data.xlsx
│
├── 🧮 SQL/
│   └── Pharmaceutical_Portfolio_Analysis.sql
│
├── 📈 Excel_Analysis/
│   └── Pharmaceutical_Data_Analysis.xlsx
│
├── 💡 Business_Recommendations/
│   └── Business_Recommendations.xlsx
│
└── 🖼️ Screenshots/
    ├── 01_Executive_Overview.png
    ├── 02_Pricing_Portfolio_Analysis.png
    ├── 03_Portfolio_Therapeutic_Analysis.png
    └── 04_Ingredient_Product_Analysis.png
```

---

## 📊 Dashboard Walkthrough

> Four pages, four angles on the same portfolio — built so a stakeholder can go from "what's the big picture?" to "what do I do about this ingredient?" in under a minute.

### 1️⃣ Executive Overview
<img width="872" height="668" alt="01_Executive_Overview" src="https://github.com/user-attachments/assets/f255c6f4-604a-4a20-aa63-cee1f7f238bc" />


The landing page for leadership — portfolio size, health, and concentration at a glance.

- **253,973 products** total → **246K active (96.9%)**, only **3.11% discontinued** — a healthy, stable portfolio
- **8,000+ manufacturers** contribute to the portfolio
- Therapeutic concentration is stark: **"Other" (144K) and antibiotics (31K)** dominate, while classes like antidepressant and bronchodilator sit near 2K each
- **Tablets** are the runaway leader in dosage form, dwarfing injections, capsules, and syrups combined

**So what:** the portfolio is broad but not balanced — a small number of categories and one dosage form carry most of the volume.

### 2️⃣ Pricing & Portfolio Analysis
<img width="826" height="671" alt="02_Pricing_Portfolio_Analysis" src="https://github.com/user-attachments/assets/4e6b987b-fbaa-4d19-9a5e-ea48b8299e0e" />


Where pricing strategy lives — averages, bands, and manufacturer-level pricing position.

- Average product price: **₹270.53**, ranging from **₹0 to ₹436K**
- **9.14%** of products qualify as premium-priced
- **Solutions and injections price well above tablets and syrups** — form drives value, not just category
- Most products cluster in the **₹0–₹100 and ₹101–₹500 bands**, with a long, thin tail of high-value outliers
- **Roche, Astellas, and BMS India** anchor the highest average manufacturer pricing

**So what:** pricing strategy today looks fairly uniform across a portfolio that is clearly *not* uniform in value — that's margin sitting on the table.

### 3️⃣ Portfolio & Therapeutic Analysis
<img width="765" height="673" alt="03_Portfolio_Therapeutic_Analysis" src="https://github.com/user-attachments/assets/b845b6c5-1f4c-408b-bd5c-528cf802d4a5" />


Where manufacturer strategy and category strategy meet.

- **11 therapeutic classes**, averaging **33.21 products per manufacturer**
- **Sun Pharmaceutical, Cipla, Intas, Torrent, Alkem, and Abbott** lead the market by portfolio size (by volume — a different set of manufacturers leads on *price*, seen on Page 2)
- Roughly **56% of products carry a single active ingredient**, and most of the rest carry two — very few go beyond that

**So what:** portfolio breadth (volume) and pricing power (value) are led by two different groups of manufacturers — worth tracking separately in any manufacturer review.

### 4️⃣ Ingredient & Product Analysis
<img width="749" height="673" alt="04_Ingredient_Product_Analysis" src="https://github.com/user-attachments/assets/66d186e8-a62c-4d81-92cc-d4c6fc618bc2" />


The molecule-level view — formulation complexity and ingredient concentration.

- **2,000+ unique active ingredients** across the portfolio
- Average of **1.44 active ingredients per product**; **44.18% of products are multi-ingredient combinations**
- **Cefixime, Domperidone, Aceclofenac, and Amoxycillin** are the most represented ingredients — high penetration across many SKUs
- Confirms the pricing pattern from Page 2: **solution and injection forms price highest**, tablets and syrups lowest

**So what:** a handful of active ingredients show up across a disproportionate share of products — a strong starting point for rationalization or differentiation review.

---

## 🧮 SQL Analysis

All 25 queries live in [`sql/pharmaceutical_pricing_portfolio_queries.sql`](). Each one is framed the way a stakeholder would ask it — with a **Business Question** and **Business Purpose** documented directly above the query.

| Category | Queries | Business Focus | SQL Techniques |
|---|---|---|---|
| **Portfolio Foundation** | Q1–Q6 | Portfolio size, lifecycle status, manufacturer/therapeutic/dosage/pack distribution | `GROUP BY`, `COUNT`, aggregate filtering |
| **Pricing Analysis** | Q7–Q12 | Average pricing by manufacturer, class, and dosage form; price segmentation; top-priced products | `AVG`, `ROUND`, `CASE`-based banding, `ORDER BY ... LIMIT` |
| **Ingredient Intelligence** | Q13–Q16 | Top ingredients, ingredient-count complexity, combination formulations, ingredient-by-class breakdown | Multi-column `GROUP BY`, `NULL`/blank filtering |
| **Manufacturer Benchmarking** | Q17–Q22 | Therapeutic coverage, portfolio-vs-pricing view, benchmark vs. overall average, ranking, top 3 per class | Correlated **subqueries**, **CTEs**, `RANK() OVER (PARTITION BY ...)` |
| **Executive & Advanced Analytics** | Q23–Q25 | Above-average priced products, therapeutic pricing rank, one-shot executive KPI summary | Subqueries, window functions, conditional aggregation (`SUM(CASE WHEN...)`) |

This layer is designed to stand on its own — a stakeholder without Power BI access can run any query directly and get an answer with business context attached, not just a raw result set.

---

## 💡 Key Insights

- **Concentration risk, not diversification.** A handful of therapeutic classes ("Other," antibiotics, analgesics) and one dosage form (tablets) drive most of the portfolio's volume.
- **Pricing is form-driven, not uniformly applied.** Solutions and injections consistently command higher prices than tablets and syrups — the data supports a differentiated, not blanket, pricing approach.
- **Two different manufacturer stories.** The manufacturers with the *largest* portfolios (Sun Pharma, Cipla, Intas) are not the same manufacturers with the *highest* average pricing (Roche, Astellas, BMS) — volume leadership and value leadership are separate conversations.
- **High ingredient penetration.** A small set of active ingredients (Cefixime, Domperidone, Aceclofenac, Amoxycillin) appear across a large share of products — a natural starting point for rationalization.
- **A stable, low-risk base.** With under 3.5% of the portfolio discontinued, the core business is healthy; the opportunity is optimization, not damage control.

---

## ✅ Business Recommendations

Full detail (with implications and expected impact) is in [`reports/Business_Recommendations_Strategic_Actions.xlsx`](reports/Business_Recommendations_Strategic_Actions.xlsx). Summary for the meeting:

| Business Area | Key Finding | Recommendation | Expected Impact |
|---|---|---|---|
| 💊 **Therapeutic Portfolio** | Heavy concentration in a few classes; "Other" is a large, unclassified share | Reclassify "Other" and review portfolio mix by therapeutic class | Better resource allocation, clearer growth targets |
| 💰 **Pricing Strategy** | Solutions and injections price meaningfully above tablets | Set pricing strategy by dosage form, not portfolio-wide | Improved price positioning and margin management |
| 💎 **Price Segmentation** | Wide price range with a small high-value tail | Monitor by price band; review high-value segment governance | Stronger pricing oversight, visibility into high-value SKUs |
| 🏭 **Manufacturer Portfolio** | A small group of manufacturers drives a large share of products | Prioritize top manufacturers for strategic portfolio reviews | Sharper strategic focus and prioritization |
| 🧬 **Active Ingredient Portfolio** | Certain ingredients show very high penetration across products | Review high-penetration ingredients for overlap and differentiation | Reduced redundancy, better product planning |
| 🔄 **Lifecycle Management** | Active and discontinued products span all categories | Analyze discontinuation patterns by class, form, and price band | More focused active portfolio, better lifecycle planning |
| 📊 **Portfolio Monitoring** | Multiple portfolio dimensions can be tracked together | Use this dashboard as a recurring portfolio review tool | Faster decisions, stronger ongoing governance |

---

## 🚀 How to Reproduce This Analysis

1. **Load the data** — import the pharmaceutical product dataset into a MySQL instance as `pharmaceutical_products`.
2. **Run the SQL layer** — execute [`sql/pharmaceutical_pricing_portfolio_queries.sql`](sql/pharmaceutical_pricing_portfolio_queries.sql) top to bottom, or query-by-query to explore individual business questions.
3. **Build or refresh the dashboard** — connect Power BI to the same source table and reproduce the four pages shown in `screenshots/`, or open the exported [dashboard PDF](dashboard/Pharmaceutical_Pricing_Portfolio_Analytics_Dashboard.pdf) directly.
4. **Present with the recommendations framework** — use [`reports/Business_Recommendations_Strategic_Actions.xlsx`](reports/Business_Recommendations_Strategic_Actions.xlsx) as the narrative layer for the stakeholder meeting: finding → implication → recommendation → impact.

---

## 📁 Files in This Repository

| File | Description |
|---|---|
| [`sql/pharmaceutical_pricing_portfolio_queries.sql`](sql/pharmaceutical_pricing_portfolio_queries.sql) | 25 documented SQL queries covering portfolio, pricing, ingredient, and manufacturer analysis |
| [`dashboard/Pharmaceutical_Pricing_Portfolio_Analytics_Dashboard.pdf`](dashboard/Pharmaceutical_Pricing_Portfolio_Analytics_Dashboard.pdf) | Full 4-page Power BI dashboard export |
| [`reports/Business_Recommendations_Strategic_Actions.xlsx`](reports/Business_Recommendations_Strategic_Actions.xlsx) | Stakeholder-ready recommendation framework |
| `screenshots/` | Individual dashboard pages, referenced throughout this README |

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


