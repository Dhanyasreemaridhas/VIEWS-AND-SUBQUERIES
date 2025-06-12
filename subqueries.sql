SELECT
  name,
  (
    (
      SELECT
        avg(rating) AS average_rating
      FROM
        product
    ) - rating
  ) AS rating_variance
FROM
  product;
SELECT
  name,
  (
    (
      SELECT
        avg(rating) AS average_rating
      FROM
        product
      WHERE
        category = 'MOBILE'
    ) - rating
  ) AS rating_variance
FROM
  product
WHERE
  category = 'MOBILE';
SELECT
  name,
  rating
FROM
  product
WHERE
  (
    (
      SELECT
        avg(rating) AS average_rating
      FROM
        product
      WHERE
        category = 'WATCH'
    ) < rating
  )
  AND category = 'WATCH';
SELECT
  customer_id,
  avg(total_amount) AS avg_amount_spent
FROM
  order_details
GROUP BY
  customer_id
HAVING
  AVG(total_amount) > (
    SELECT
      AVG(total_amount)
    FROM
      order_details
  );
SELECT
  order_id
FROM
  order_product
WHERE
  product_id IN (291, 292, 293, 294, 296)
  AND order_id NOT IN (
    SELECT
      order_id
    FROM
      order_product
    WHERE
      product_id IN (301, 302, 303, 304)
  );
