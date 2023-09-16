INSERT INTO sakila_datawh.dim_store (
    store_id,
    store_address,
    store_district,
    store_city,
    store_country,
    store_manager_staff_id,
    store_manager_first_name,
    store_manager_last_name,
    store_version_number,
    store_valid_from,
    store_valid_through
)
SELECT 
    s.store_id,
    a.address,
    a.district,
    city.city,
    country.country,
    manager_staff_id,
    e.first_name,
    e.last_name,
    1,
    CURRENT_DATE,
    CURRENT_DATE
FROM sakila.store s
    left join sakila.staff e on s.manager_staff_id=e.staff_id
    left join sakila.address a on s.address_id=a.address_id
    left join sakila.city city on city.city_id=a.city_id
    left join sakila.country country on country.country_id=city.country_id