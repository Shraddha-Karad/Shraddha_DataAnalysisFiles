create database Play_Store_Data_Analysis

use Play_Store_Data_Analysis

select top 10 * from Play_Store_Data;

-- Data Cleaning ANd Preparing

alter table [dbo].[Play_Store_Data] alter column [Rating] DECIMAL(28,1);


update Play_Store_Data
set Installs = cast(replace(Installs, '+', '') as nvarchar);

-- Update the Installs column to remove commas
update Play_Store_Data
set Installs = replace(Installs, ',', '');

alter table Play_Store_Data
alter column Installs int;



-- Query 1:		Calculate Average Rating by Category with Standard Deviation.


select
    Category,
    cast(avg(Rating)as decimal(10, 1)) as AvgRating,
    cast(stdev(Rating)as decimal(10, 1)) as RatingStdDev
from
    Play_Store_Data  
group by
    Category;



select Category, RatingAvg, StdDevRating from Play_Store_Data;



-- Query 2:		Identify Most Installed Paid Apps with Revenue Calculation


select
    App,
    Category,
	Installs,
    Price,
    Installs * Price as Revenue
from
    Play_Store_Data
where
    Type = 'Paid'
order by
    Installs desc;





--Query 3 :		Calculate the Ratio of Reviews to Installs with Percentile Calculation


select distinct
    App,
    Installs,
    Reviews,
    cast(Reviews as float) / nullif(Installs, 0) as ReviewsToInstallsRatio,
    PERCENTILE_CONT(0.5) within group (order by cast(Reviews as float) / nullif(Installs, 0)) over () as MedianRatio
from
    Play_Store_Data;



--Query 4 :		Identify Apps with High Ratings but Low Installations with Revenue Estimation

select
    App,
    Category,
    Installs,
    Rating,
    Price,
    Rating * Installs as Revenue
from
    Play_Store_Data
where
    Rating >= 4.5  
    and Installs < 10000  
    and Type = 'Paid'; 




--Query 5 :		Create a View to Display App Details with Revenue Calculation


create view AppDetailsWithRevenue
as
select
    App,
    Category,
    Installs,
    Rating,
    Price,
    Installs * Price as Revenue
from
    Play_Store_Data;



-- Display View
select * from AppDetailsWithRevenue;




--Query 6 :		Create a Trigger to Update Rating Average with Standard Deviation.


create trigger UpdateRatingStatsTrigger3
on Play_Store_Data
after insert, update
as
begin
    declare @AvgRating float;
    declare @StdDev float;

   
    select @AvgRating = avg(Rating) from Play_Store_Data;
    
    select @StdDev = stdev(Rating) from Play_Store_Data;

    -- Update rating
    update Play_Store_Data
    set RatingAvg = @AvgRating,
        StdDevRating = @StdDev;
end;



UPDATE Play_Store_Data
SET Reviews = 1186
WHERE Content_Rating = 'Unrated' and Genres = 'Tools';



select * from Play_Store_Data where Content_Rating = 'Unrated';



-- Query 7:		Identify Apps with Seasonal Patterns in Installs



select
    App,
    avg(convert(bigint, Installs)) as AvgInstalls, -- Convert to BIGINT for aggregation
    stdev(convert(bigint, Installs)) as InstallsStdDev -- Convert to BIGINT for standard deviation
from
    Play_Store_Data
group by
    App
having
    stdev(convert(bigint, Installs)) > 0 -- Filter out apps with no variation in installs
order by
    InstallsStdDev desc;




--Query 8:  Calculate average rating over time by category


select
    Category,
    year(Last_Updated) as RatingYear,
    month(Last_Updated) as RatingMonth,
    cast(avg(Rating) as decimal(10, 1)) as AvgRating
from
    Play_Store_Data
group by
    Category,
    year(Last_Updated),
    month(Last_Updated)
order by
    Category,
    RatingYear,
    RatingMonth;





















































	
/*
ALTER TABLE Play_Store_Data
ADD RatingAvg DECIMAL(10, 1);

ALTER TABLE Play_Store_Data
ADD StdDevRating DECIMAL(10, 1);

*/








/*


SELECT
    Category,
    YEAR(Last_Updated) AS RatingYear,
    MONTH(Last_Updated) AS RatingMonth,
    AVG(Rating) AS AvgRating
FROM
    Play_Store_Data
GROUP BY
    Category,
    YEAR(Last_Updated),
    MONTH(Last_Updated)
ORDER BY
    Category,
    RatingYear,
    RatingMonth;

*/