INSERT INTO sakila_datawh.dim_staff (
    staff_first_name,
    staff_last_name,
    staff_id,
    staff_store_id,
    staff_version_number,
    staff_valid_from,
    staff_valid_through,
    staff_active
)
SELECT
    first_name,
    last_name,
    staff_id,
    store_id,
    1,
    CURRENT_DATE,
    CURRENT_DATE,
    active
FROM sakila.staff