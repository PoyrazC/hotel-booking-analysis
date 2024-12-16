WITH hotels AS (
SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$'])

SELECT arrival_date_year, hotel, ROUND(SUM((stays_in_week_nights+stays_in_weekend_nights)*adr) ,2) AS revenue
FROM hotels
GROUP BY arrival_date_year, hotel

SELECT * 
FROM hotels
LEFT JOIN dbo.market_segment$
ON hotels.market_segment = market_segment$.market_segment
LEFT JOIN dbo.meal_cost$
ON hotels.meal = meal_cost$.meal