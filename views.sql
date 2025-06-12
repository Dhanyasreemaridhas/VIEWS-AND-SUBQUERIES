CREATE VIEW user_details AS
SELECT
  id,
  name,
  age,
  gender,
  pincode
FROM
  user;
CREATE VIEW user_order_details AS
SELECT
  u.id AS user_id,
  u.name,
  u.age,
  u.gender,
  u.pincode,
  od.order_id,
  od.total_amount
FROM
  user u
  INNER JOIN order_details od ON u.id = od.customer_id;
SELECT
  user_id,
  pincode,
  sum(total_amount) AS total_amount_spent
FROM
  location_order_details
GROUP BY
  user_id,
  pincode
HAVING
  sum(total_amount) > 50000;
