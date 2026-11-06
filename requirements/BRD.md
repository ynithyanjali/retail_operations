# Business Requirements Document (BRD)

**Project:** Retail Operations Analysis  
**Project Type:** Business Analytics Portfolio Project  
**Dataset:** Synthetic Retail Sales Data (2025)  
**Status:** In Progress

## 1. Project Overview

The purpose of this project is to analyze the sales and operational performance of a fictional retail company. I used SQL to examine sales transactions, product returns, and delivery performance to better understand some of the problems a retail business might face.

I also created a dashboard to present the results in a way that would be easy for managers and other stakeholders to understand.

This document explains the business problems I identified, the requirements for the dashboard, and the improvements that could be considered based on the analysis.

## 2. Business Problem

After analyzing 1,200 orders from the dataset, I noticed a few areas that could potentially affect the company's performance.

Some of the main findings were:

- The overall product return rate was **10.17%**.
- Apparel had the highest return rate at **18.28%**.
- The overall on-time delivery rate was **74.83%**.
- The West region had the lowest on-time delivery rate at **56.38%**.

These results suggest that the fictional company could benefit from looking more closely at its product returns and delivery process.

## 3. Project Objectives

The main goals of this project are to:

- Understand how sales and revenue change over time.
- Identify products with higher return rates.
- Compare delivery performance across regions.
- Create a dashboard that summarizes important business metrics.
- Recommend possible improvements based on the data.

## 4. Stakeholders

For this project, I identified a few roles that would likely use the results in a real retail business.

| Stakeholder | What They Would Need |
|---|---|
| Sales Manager | Sales trends and category performance |
| Operations Manager | Delivery and fulfillment information |
| Finance Team | Revenue and margin information |
| Business Analyst | Data to investigate business problems |
| Management | A summary of key findings and recommendations |

Since this is a fictional business case, these are assumed stakeholder roles rather than people I interviewed.

## 5. Business Requirements

Based on the analysis, I identified the following requirements for the reporting dashboard.

**BR-01: Sales Reporting**

The dashboard should display total net sales and show how sales change from month to month.

**BR-02: Product Returns**

Users should be able to compare return rates across different product categories.

**BR-03: Delivery Performance**

The dashboard should show the percentage of orders delivered on time in each region.

**BR-04: Financial Performance**

The dashboard should include important financial metrics such as net sales and estimated contribution margin.

**BR-05: Easy-to-Understand Reporting**

The dashboard should present information using simple charts, tables, and KPI summaries so users can understand the results without reviewing the SQL queries.

## 6. Project Scope

### Included in the Project

- Analyzing retail transactions using SQL
- Calculating sales and operational KPIs
- Creating a dashboard using HTML, CSS, and JavaScript
- Comparing performance across categories and regions
- Documenting business findings and recommendations

### Not Included

- Working with actual customer information
- Connecting to a real company's database
- Processing live transactions
- Making changes to real business operations

## 7. Acceptance Criteria

I would consider the dashboard requirements met when:

1. The dashboard displays the four main KPIs correctly.
2. The monthly sales chart shows data for all 12 months of 2025.
3. Users can compare return rates across product categories.
4. Delivery performance is shown separately for each region.
5. The values displayed in the dashboard match the SQL analysis results.

## 8. Findings and Possible Improvements

Based on the analysis, I identified two areas worth investigating further.

**Product Returns**

Apparel had a return rate of 18.28%, which was higher than the other categories. I would look at the reasons for these returns to understand whether they might be related to sizing, product quality, or other issues.

**Delivery Performance**

The West region had an on-time delivery rate of 56.38%. I would investigate whether shipping delays, fulfillment times, or other operational factors could explain this difference.

At this stage, these are possible explanations rather than confirmed causes.

## 9. Limitations

This project uses fictional data, so the findings do not represent an actual company's performance.

The analysis also focuses on a limited set of business metrics. Additional information, such as customer feedback and shipping carrier data, would be useful for understanding the problems in more detail.

## 10. Conclusion

Working on this project helped me understand how SQL analysis and data visualization can support business decisions.

I learned how to calculate business KPIs, identify performance differences, and organize findings into a dashboard. Creating this requirements document also helped me think about what different stakeholders might need from a reporting solution.

My next step is to develop user stories and explore possible process improvements based on the findings.
