-- create tables

CREATE TYPE usertype AS ENUM
    ('manager', 'delivery', 'seller', 'customer');


CREATE TABLE IF NOT EXISTS user
(
	user_id integer SERIAL NOT NULL,
-- 	email character varying(64),
	phone character varying(12),
	user_type usertype,
	full_name character varying(64),
	password_hash character varying(160)

	CONSTRAINT user_pkey PRIMARY KEY (id)
);