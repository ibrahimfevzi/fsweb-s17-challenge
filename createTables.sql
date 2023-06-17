-- Tasarımını yaptığınız tabloları oluşturan sql ifadeleri buraya yazınız.
-- veri tiplerine, nullable olma durumuna, default değerine ve tablolar arası foreign key kullanımına dikkat.


--POSTGRESQL için tablo oluşturma kodları,
-- foreign key kullanımı ve tablolar arası ilişki sağlandı.

-- customers tablosu
CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(50),
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  birth_date DATE,
  password VARCHAR(100) NOT NULL,
  address TEXT
);

-- products tablosu
CREATE TABLE products (
  product_id SERIAL PRIMARY KEY,
  product_num VARCHAR(50),
  product_name VARCHAR(100) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  stock INTEGER,
  status VARCHAR(50),
  category VARCHAR(50),
  brand VARCHAR(50),
  material_type VARCHAR(50),
  material_type_value VARCHAR(50)
);

-- sales tablosu
CREATE TABLE sales (
  sale_id SERIAL PRIMARY KEY,
  payment_status VARCHAR(50),
  customer_id INTEGER REFERENCES customers(customer_id),
  total_price NUMERIC(10, 2),
  status VARCHAR(50)
);

-- store tablosu
CREATE TABLE store (
  store_id SERIAL PRIMARY KEY,
  store_name VARCHAR(100) NOT NULL,
  store_address TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  store_type VARCHAR(50),
  status VARCHAR(50),
  store_img VARCHAR(200),
  store_contact VARCHAR(100)
);

-- stores_products tablosu
CREATE TABLE stores_products (
  stores_products_id SERIAL PRIMARY KEY,
  store_id INTEGER REFERENCES store(store_id),
  status VARCHAR(50),
  stock INTEGER,
  price NUMERIC(10, 2),
  sales_status VARCHAR(50),
  product_img VARCHAR(200),
  product_info TEXT,
  product_properties TEXT
);
