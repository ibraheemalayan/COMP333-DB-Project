

DROP TABLE IF EXISTS public.customer_driver_transaction;
DROP TABLE IF EXISTS public.company_driver_transaction;
DROP TABLE IF EXISTS public.seller_company_transaction;
DROP TABLE IF EXISTS public.customer_company_transaction;
DROP TABLE IF EXISTS public.driver_company_transaction;

DROP TABLE IF EXISTS public.transaction;
DROP TYPE IF EXISTS public.transaction_type;

DROP TABLE IF EXISTS public.order_item;
DROP TABLE IF EXISTS public.product;
DROP TABLE IF EXISTS public.order;

DROP TABLE IF EXISTS public.manager;
DROP TABLE IF EXISTS public.seller;
DROP TABLE IF EXISTS public.driver;
DROP TABLE IF EXISTS public.customer;

DROP TABLE IF EXISTS public.user;
DROP TYPE IF EXISTS usertype;


BEGIN;

CREATE TYPE usertype AS ENUM ('manager', 'driver', 'seller', 'customer');
CREATE TYPE transaction_type AS ENUM (
	'customer_driver_transaction',
	'customer_company_transaction',
	'company_driver_transaction',
	'company_seller_transaction',
	'company_customer_transaction'
	);

CREATE TABLE IF NOT EXISTS public.user (
	user_id SERIAL NOT NULL,
	phone character varying(16),
	user_type usertype,
	full_name character varying(64),
	password_hash character varying(160),
	email character varying(64),
	CONSTRAINT user_pkey PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS public.customer (
	user_id integer NOT NULL,
	address character varying(64),
	card_number character varying(16),
	CONSTRAINT customer_pkey PRIMARY KEY (user_id),
	CONSTRAINT customer_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user (user_id) ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.seller (
	user_id integer NOT NULL,
	bank_account character varying(16),
	CONSTRAINT seller_pkey PRIMARY KEY (user_id),
	CONSTRAINT seller_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user (user_id) ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.driver (
	user_id integer NOT NULL,
	bank_account character varying(16),
	CONSTRAINT driver_pkey PRIMARY KEY (user_id),
	CONSTRAINT driver_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user (user_id) ON UPDATE NO ACTION ON DELETE CASCADE
);

-- CREATE TABLE IF NOT EXISTS public.manager (
-- 	user_id integer NOT NULL,
-- 	CONSTRAINT manager_pkey PRIMARY KEY (user_id),
-- 	CONSTRAINT manager_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user (user_id) ON UPDATE NO ACTION ON DELETE CASCADE
-- );

CREATE TABLE IF NOT EXISTS public.product (
	product_id SERIAL NOT NULL,
	product_name character varying(64),
	product_price integer,
	product_seller integer NOT NULL,
	CONSTRAINT product_pkey PRIMARY KEY (product_id),
	CONSTRAINT product_seller_fkey FOREIGN KEY (product_seller) REFERENCES public.seller (user_id) ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.order (
	order_id SERIAL NOT NULL,
	order_customer integer NOT NULL,
	order_driver integer NOT NULL,
	order_status character varying(20),
	CONSTRAINT order_pkey PRIMARY KEY (order_id),
	CONSTRAINT order_customer_fkey FOREIGN KEY (order_customer) REFERENCES public.customer (user_id) ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT order_driver_fkey FOREIGN KEY (order_driver) REFERENCES public.driver (user_id) ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.order_item (
	order_id integer NOT NULL,
	product_id integer NOT NULL,
	quantity integer,
	price_per_unit integer,
	CONSTRAINT order_item_pkey PRIMARY KEY (order_id, product_id),
	CONSTRAINT order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.order (order_id) ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT order_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product (product_id) ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.transaction (
	transaction_id SERIAL NOT NULL,
	transaction_type transaction_type,
	transaction_amount NUMERIC(10, 2),
	transaction_date timestamp without time zone,
	CONSTRAINT transaction_pkey PRIMARY KEY (transaction_id)
);

CREATE TABLE IF NOT EXISTS public.customer_driver_transaction (
	transaction_id integer NOT NULL,
	customer_id integer NOT NULL,
	driver_id integer NOT NULL,
	CONSTRAINT customer_driver_transaction_pkey PRIMARY KEY (transaction_id),
	CONSTRAINT customer_driver_transaction_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer (user_id) ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT customer_driver_transaction_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.driver (user_id) ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT customer_driver_transaction_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction (transaction_id) ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.driver_company_transaction (
	transaction_id integer NOT NULL,
	driver_id integer NOT NULL,
	CONSTRAINT driver_company_transaction_pkey PRIMARY KEY (transaction_id),
	CONSTRAINT driver_company_transaction_driver_transaction_id_fkey FOREIGN KEY (driver_id) REFERENCES public.driver (user_id) ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT driver_company_transaction_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction (transaction_id) ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.customer_company_transaction (
	transaction_id integer NOT NULL,
	customer_id integer NOT NULL,
	driver_bank_account character varying(16),
	CONSTRAINT customer_company_transaction_pkey PRIMARY KEY (transaction_id),
	CONSTRAINT customer_company_transaction_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer (user_id) ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT customer_company_transaction_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction (transaction_id) ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.seller_company_transaction (
	transaction_id integer NOT NULL,
	seller_id integer NOT NULL,
	seller_bank_account character varying(16),
	CONSTRAINT seller_company_transaction_pkey PRIMARY KEY (transaction_id),
	CONSTRAINT seller_company_transaction_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.seller (user_id) ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT seller_company_transaction_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction (transaction_id) ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.company_driver_transaction (
	transaction_id integer NOT NULL,
	driver_id integer NOT NULL,
	driver_bank_account character varying(16),
	CONSTRAINT company_driver_transaction_pkey PRIMARY KEY (transaction_id),
	CONSTRAINT company_driver_transaction_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.driver (user_id) ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT company_driver_transaction_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction (transaction_id) ON UPDATE NO ACTION ON DELETE CASCADE
);





COMMIT;