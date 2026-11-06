# User Stories and Acceptance Criteria

**Project:** Retail Operations Analysis  
**Document Type:** User Stories  
**Status:** Initial Version

## Overview

For this part of my project, I created user stories based on the business problems identified during my SQL analysis.

I focused on what different users might need from the dashboard and how I could check whether those requirements were met.

Since this is a fictional retail company, the user roles are assumptions rather than requirements collected from actual stakeholders.

## User Story 1: Monthly Sales Performance

**ID:** US-01  
**Related Requirement:** BR-01  
**Priority:** High

**User Story:**

As a Sales Manager, I want to view monthly sales performance so that I can identify sales trends and understand which months performed better or worse.

**Acceptance Criteria:**

- The dashboard displays monthly net sales.
- Data is shown for all 12 months of 2025.
- Each month is clearly labeled.
- The values match the results calculated using SQL.

**Status:** Implemented in the current dashboard.

## User Story 2: Product Returns

**ID:** US-02  
**Related Requirement:** BR-02  
**Priority:** High

**User Story:**

As an Operations Manager, I want to compare product return rates across categories so that I can identify which categories may need further investigation.

**Acceptance Criteria:**

- The dashboard displays return rates by product category.
- Each category is clearly identified.
- Return rates are displayed as percentages.
- Users can compare categories to identify higher return rates.

**Status:** Implemented through the category performance table.

## User Story 3: Delivery Performance

**ID:** US-03  
**Related Requirement:** BR-03  
**Priority:** High

**User Story:**

As an Operations Manager, I want to see delivery performance across different regions so that I can identify locations with higher delivery delays.

**Acceptance Criteria:**

- The dashboard shows on-time delivery rates for each region.
- Delivery rates are displayed as percentages.
- Regional results can be compared visually.
- The figures match the SQL analysis.

**Status:** Implemented through the regional performance bars.

## User Story 4: Executive KPI Overview

**ID:** US-04  
**Related Requirements:** BR-04, BR-05  
**Priority:** Medium

**User Story:**

As a Business Manager, I want to see important performance indicators in one place so that I can quickly understand the company's overall performance.

**Acceptance Criteria:**

- The dashboard displays net sales.
- Estimated contribution margin is visible.
- Overall return rate is displayed.
- On-time delivery performance is displayed.
- The information is easy to read and understand.

**Status:** Implemented through the executive KPI cards.

## Future Improvement: Interactive Filtering

**ID:** US-05  
**Priority:** Medium

**User Story:**

As a Business Analyst, I want to filter the dashboard by region or product category so that I can investigate specific areas of business performance.

**Acceptance Criteria:**

- Users can select a region or category.
- Dashboard values update based on the selection.
- Users can reset the filters.
- Filtered figures remain consistent with the source data.

**Status:** Planned, not yet implemented.

## Conclusion

Writing these user stories helped me think about the dashboard from the perspective of different users instead of focusing only on the technical side of the project.

I also learned how acceptance criteria can be used to check whether a dashboard meets its original requirements.

My next step is to document the existing retail process and explore possible improvements based on the business findings.
