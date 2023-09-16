INSERT INTO sakila_datawh.dim_date (
    date_key,
    date_value,
    date_medium,
    month_number,
    month_name,
    year4,
    year_month_number
)
SELECT
    TO_DAYS(fecha) AS date_key,
    fecha,
    DATE_FORMAT(fecha, '%d %M %Y') AS date_medium,
    MONTH(fecha) AS month,
    MONTHNAME(fecha) AS month_name,
    YEAR(fecha) AS year4,
    DATE_FORMAT(fecha, '%Y-%m') AS  year_month_number
FROM (
    SELECT distinct DATE(rental_date) as fecha
    FROM sakila.rental 
) AS fechas
