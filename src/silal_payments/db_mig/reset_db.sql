DROP TABLE IF EXISTS public.user;
DROP TYPE IF EXISTS usertype;

BEGIN;

CREATE TYPE usertype AS ENUM
    ('manager', 'delivery', 'seller', 'customer');


CREATE TABLE IF NOT EXISTS public.user
(
	user_id SERIAL NOT NULL,
-- 	email character varying(64),
	phone character varying(12),
	user_type usertype,
	full_name character varying(64),
	password_hash character varying(160),

	CONSTRAINT user_pkey PRIMARY KEY (user_id)
);

COMMIT;