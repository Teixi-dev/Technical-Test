CREATE TABLE products (
  id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  code uuid,
  brand_id bigint,
  name varchar
);

CREATE TABLE prices (
  product_id bigint,
  currency varchar,
  price float
);

CREATE TABLE brands (
  id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  code uuid,
  name varchar
);

CREATE TABLE promotions (
  id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  code uuid,
  off int,
  product_id bigint,
  priority int,
  start_date timestamp,
  end_date timestamp
);

ALTER TABLE products ADD FOREIGN KEY (brand_id) REFERENCES brands (id);

ALTER TABLE prices ADD FOREIGN KEY (product_id) REFERENCES products (id);

ALTER TABLE promotions ADD FOREIGN KEY (product_id) REFERENCES products (id);