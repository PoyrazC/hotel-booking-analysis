# Hotel Booking Data Analysis and Visualisation
## Data analysis and visualization of hotel booking data using SQL Server, Power BI, Excel, and DAX. A complete end-to-end project demonstrating ETL (Extract, Transform, Load), SQL querying, DAX calculations, and interactive dashboard creation.

### 1. Project Overview
A data analysis project focused on hotel booking trends. Using SQL Server for data storage and querying, combined with Power BI for visual storytelling, this project answers key business questions such as:
- Is hotel revenue growing year over year?
- Should we increase parking lot size based on guest car trends?
- What seasonal trends are observed in bookings and revenue?

### 2. Tech Stack
- Database: SQL Server (Microsoft SQL Server Management Studio)
- Data Visualization: Power BI
- Data Source: Excel sheets (Historical bookings: 2018–2020)
- Languages: SQL, DAX (Power BI calculations)
- Tools: Excel, Power BI Desktop

### 3. Project Pipeline
The project workflow follows these key steps:
- Data Import: Import Excel data into SQL Server.
- Database Creation: Create a relational database with normalized tables.
- Data Transformation: Use SQL queries to clean, unify, and join tables.
- Data Analysis: Write SQL queries to calculate revenue, car trends, and seasonal metrics.
- DAX Calculations: Use DAX in Power BI to create additional measures (e.g., Total Nights).
- Visualization: Build an interactive Power BI dashboard to present insights.
- Business Questions: Summarize findings and recommendations.

### 4. Data Workflow
4.1 Database Setup
- Create a database named hotel_booking_data and import data from Excel into SQL Server.
  
4.2 SQL Queries for Analysis Key queries include:
- Combining multiple years of data using UNION:

WITH hotels AS 
(SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$'])
  
- Calculating revenue:

SELECT arrival_date_year, hotel, ROUND(SUM((stays_in_week_nights+stays_in_weekend_nights)*adr) ,2) AS revenue
FROM hotels
GROUP BY arrival_date_year, hotel

4.3 Joins with Additional Tables:
- Joining market segments and meal costs to enhance analysis:

SELECT * 
FROM hotels
LEFT JOIN dbo.market_segment$
ON hotels.market_segment = market_segment$.market_segment
LEFT JOIN dbo.meal_cost$
ON hotels.meal = meal_cost$.meal

4.4 DAX Calculation for Total Nights
- In Power BI, the following DAX measure was used to calculate total nights (sum of weeknights and weekends):

Total Nights = SUM(Query1[stays_in_week_nights]) + SUM(Query1[stays_in_weekend_nights])

This measure ensures that the combined total nights per booking is dynamically calculated for the dashboard.

### 5. Power BI Dashboard
The Power BI dashboard presents a clear overview of hotel booking trends, revenue, and resource utilization with interactive visuals and key performance indicators (KPIs).

5.1 KPIs:
- Sum of Revenue: $10.23M
- Average ADR (Average Daily Rate): $104.47
- Average Discount: 25.81%
- Total Nights: 367.78K
  
5.2 Revenue Trends Over Time:
- A line chart showing the sum of revenue by reservation date, split between City Hotel and Resort Hotel.
- Key Insight: Revenue peaks significantly during mid-2019, with Resort Hotels contributing more to the total revenue.
  
5.3 Yearly Revenue and Parking Percentage:
- A table visual summarizing yearly revenue and parking usage
  - 2019 had the highest revenue at $5.49M.
  - Parking percentage remains relatively low, indicating minimal pressure on parking spaces.

5.4 Revenue by Hotel Type:
- A donut chart showing the split of revenue between City Hotels and Resort Hotels:
  - Resort Hotels: $5.48M (53.62%)
  - City Hotels: $4.75M (46.38%)

5.5 Interactive Filters:
- Users can filter the dashboard by Hotel Type and/or Country using slicers to drill down into specific subsets of data.
- This interactivity allows for more targeted analysis, such as comparing revenue between hotel types in a specific country.

### 6. Insights and Recommendations
6.1 Revenue Trends Over Time
- Peak Revenue Period: The highest revenue was observed in mid-2019, with a significant spike in bookings and revenue for both City Hotels and Resort Hotels.
  - Actionable Insight: Focus on replicating strategies implemented during this period (e.g., marketing campaigns, pricing strategies) to drive revenue during similar seasons.

- 2020 Drop: Revenue declined sharply in 2020, likely due to external factors (e.g., pandemic impact).
  - Actionable Insight: Prepare for potential external disruptions by diversifying revenue streams or creating contingency plans.

6.2 Hotel Type Performance
- Resort Hotels generate higher revenue overall, contributing 53.62% of total revenue, while City Hotels account for 46.38%.
  - Actionable Insight: To maximize ROI, allocate more resources (e.g., marketing and staffing) to Resort Hotels, especially during peak seasons.
- Revenue by Year:
  - 2019 was the highest-performing year, with $5.49M in revenue, indicating strong demand.
  - Actionable Insight: Analyze why 2019 performed well (e.g., specific events, promotions) and replicate these strategies where possible.

6.3 Parking Lot Utilization
- Parking usage remains low across all years:
  - 2018: 2.49%
  - 2019: 2.50%
  - 2020: 2.05%
  - City Hotels consistently have the lowest parking usage (~1%).
  - Actionable Insight: There is no immediate need for parking lot expansion. Resources can be redirected to other infrastructure or service improvements.

6.4 Seasonal and Customer Trends
- Revenue spikes align with seasonal peaks:
  - Mid-year months (e.g., June–July) show higher revenue, especially for Resort Hotels.
  - Actionable Insight: Focus marketing efforts and promotions on mid-year peak seasons to capitalize on increased demand.
- City Hotels have steady but lower revenue compared to Resort Hotels, suggesting a need for targeted marketing to urban travelers or business clients. 

Summary of Key Actions:
- Leverage mid-year peaks: Increase promotions and packages during high-demand months.
- Focus on Resort Hotels: Invest in marketing and resources where revenue is higher.
- Reassess parking strategies: Avoid expanding parking facilities given low utilization rates.
- Analyze 2019 success: Replicate effective strategies from 2019 to boost future revenue.

### 7. Files in the Repository
- hotel_revenue_historical_full.xlsx: Folder containing the sample Excel data.
- sql_query.sql: Folder with .sql files for queries used in the analysis.
- hotel_booking_data_analysis.pbix: The final Power BI dashboard file.
- README.md: Project documentation (this file).
  
### 8. How to Run the Project
8.1 Prerequisites:
- Install SQL Server Management Studio.
- Install Power BI Desktop.
  
8.2 Steps:
- Import Excel files into SQL Server.
- Execute the provided SQL scripts to clean and analyze the data.
- Load the query results into Power BI.
- Open the Power BI file (powerbi_dashboard.pbix) to view the dashboard.

### 9. Future Improvements
- Integrate more granular data (e.g., regional breakdown).
- Add predictive analytics using Power BI’s forecasting tools.
- Automate ETL processes with Python or Power Automate.
