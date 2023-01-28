--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 15.1

-- Started on 2023-01-28 20:00:16 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE silal_payments;
--
-- TOC entry 3706 (class 1262 OID 715068)
-- Name: silal_payments; Type: DATABASE; Schema: -; Owner: silal_agent
--

CREATE DATABASE silal_payments WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE silal_payments OWNER TO silal_agent;

\connect silal_payments

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 842 (class 1247 OID 717908)
-- Name: transaction_type; Type: TYPE; Schema: public; Owner: silal_agent
--

CREATE TYPE public.transaction_type AS ENUM (
    'customer_driver_transaction',
    'customer_company_transaction',
    'company_driver_transaction',
    'company_seller_transaction',
    'company_customer_transaction'
);


ALTER TYPE public.transaction_type OWNER TO silal_agent;

--
-- TOC entry 839 (class 1247 OID 717899)
-- Name: usertype; Type: TYPE; Schema: public; Owner: silal_agent
--

CREATE TYPE public.usertype AS ENUM (
    'manager',
    'driver',
    'seller',
    'customer'
);


ALTER TYPE public.usertype OWNER TO silal_agent;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 718082)
-- Name: company_driver_transaction; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public.company_driver_transaction (
    transaction_id integer NOT NULL,
    driver_id integer NOT NULL,
    driver_bank_account character varying(16)
);


ALTER TABLE public.company_driver_transaction OWNER TO silal_agent;

--
-- TOC entry 211 (class 1259 OID 717926)
-- Name: customer; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public.customer (
    user_id integer NOT NULL,
    address character varying(64),
    card_number character varying(16)
);


ALTER TABLE public.customer OWNER TO silal_agent;

--
-- TOC entry 224 (class 1259 OID 718052)
-- Name: customer_company_transaction; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public.customer_company_transaction (
    transaction_id integer NOT NULL,
    customer_id integer NOT NULL,
    driver_bank_account character varying(16)
);


ALTER TABLE public.customer_company_transaction OWNER TO silal_agent;

--
-- TOC entry 222 (class 1259 OID 718017)
-- Name: customer_driver_transaction; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public.customer_driver_transaction (
    transaction_id integer NOT NULL,
    customer_id integer NOT NULL,
    driver_id integer NOT NULL
);


ALTER TABLE public.customer_driver_transaction OWNER TO silal_agent;

--
-- TOC entry 213 (class 1259 OID 717946)
-- Name: driver; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public.driver (
    user_id integer NOT NULL,
    bank_account character varying(16)
);


ALTER TABLE public.driver OWNER TO silal_agent;

--
-- TOC entry 223 (class 1259 OID 718037)
-- Name: driver_company_transaction; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public.driver_company_transaction (
    transaction_id integer NOT NULL,
    driver_id integer NOT NULL
);


ALTER TABLE public.driver_company_transaction OWNER TO silal_agent;

--
-- TOC entry 214 (class 1259 OID 717956)
-- Name: manager; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public.manager (
    user_id integer NOT NULL
);


ALTER TABLE public.manager OWNER TO silal_agent;

--
-- TOC entry 218 (class 1259 OID 717979)
-- Name: order; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public."order" (
    order_id integer NOT NULL,
    order_customer integer NOT NULL,
    order_driver integer NOT NULL,
    order_status character varying(20)
);


ALTER TABLE public."order" OWNER TO silal_agent;

--
-- TOC entry 219 (class 1259 OID 717995)
-- Name: order_item; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public.order_item (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer,
    price_per_unit integer
);


ALTER TABLE public.order_item OWNER TO silal_agent;

--
-- TOC entry 217 (class 1259 OID 717978)
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: silal_agent
--

CREATE SEQUENCE public.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO silal_agent;

--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 217
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: silal_agent
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public."order".order_id;


--
-- TOC entry 216 (class 1259 OID 717967)
-- Name: product; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_name character varying(64),
    product_price integer,
    product_seller integer NOT NULL
);


ALTER TABLE public.product OWNER TO silal_agent;

--
-- TOC entry 215 (class 1259 OID 717966)
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: silal_agent
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO silal_agent;

--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 215
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: silal_agent
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- TOC entry 212 (class 1259 OID 717936)
-- Name: seller; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public.seller (
    user_id integer NOT NULL,
    bank_account character varying(16)
);


ALTER TABLE public.seller OWNER TO silal_agent;

--
-- TOC entry 225 (class 1259 OID 718067)
-- Name: seller_company_transaction; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public.seller_company_transaction (
    transaction_id integer NOT NULL,
    seller_id integer NOT NULL,
    seller_bank_account character varying(16)
);


ALTER TABLE public.seller_company_transaction OWNER TO silal_agent;

--
-- TOC entry 221 (class 1259 OID 718011)
-- Name: transaction; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public.transaction (
    transaction_id integer NOT NULL,
    transaction_type public.transaction_type,
    transaction_amount numeric(10,2),
    transaction_date timestamp without time zone
);


ALTER TABLE public.transaction OWNER TO silal_agent;

--
-- TOC entry 220 (class 1259 OID 718010)
-- Name: transaction_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: silal_agent
--

CREATE SEQUENCE public.transaction_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_transaction_id_seq OWNER TO silal_agent;

--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 220
-- Name: transaction_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: silal_agent
--

ALTER SEQUENCE public.transaction_transaction_id_seq OWNED BY public.transaction.transaction_id;


--
-- TOC entry 210 (class 1259 OID 717920)
-- Name: user; Type: TABLE; Schema: public; Owner: silal_agent
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    phone character varying(12),
    user_type public.usertype,
    full_name character varying(64),
    password_hash character varying(160),
    email character varying(64)
);


ALTER TABLE public."user" OWNER TO silal_agent;

--
-- TOC entry 209 (class 1259 OID 717919)
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: silal_agent
--

CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO silal_agent;

--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: silal_agent
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".user_id;


--
-- TOC entry 3494 (class 2604 OID 717982)
-- Name: order order_id; Type: DEFAULT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public."order" ALTER COLUMN order_id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- TOC entry 3493 (class 2604 OID 717970)
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- TOC entry 3495 (class 2604 OID 718014)
-- Name: transaction transaction_id; Type: DEFAULT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.transaction ALTER COLUMN transaction_id SET DEFAULT nextval('public.transaction_transaction_id_seq'::regclass);


--
-- TOC entry 3492 (class 2604 OID 717923)
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- TOC entry 3700 (class 0 OID 718082)
-- Dependencies: 226
-- Data for Name: company_driver_transaction; Type: TABLE DATA; Schema: public; Owner: silal_agent
--



--
-- TOC entry 3685 (class 0 OID 717926)
-- Dependencies: 211
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: silal_agent
--



--
-- TOC entry 3698 (class 0 OID 718052)
-- Dependencies: 224
-- Data for Name: customer_company_transaction; Type: TABLE DATA; Schema: public; Owner: silal_agent
--



--
-- TOC entry 3696 (class 0 OID 718017)
-- Dependencies: 222
-- Data for Name: customer_driver_transaction; Type: TABLE DATA; Schema: public; Owner: silal_agent
--



--
-- TOC entry 3687 (class 0 OID 717946)
-- Dependencies: 213
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: silal_agent
--



--
-- TOC entry 3697 (class 0 OID 718037)
-- Dependencies: 223
-- Data for Name: driver_company_transaction; Type: TABLE DATA; Schema: public; Owner: silal_agent
--



--
-- TOC entry 3688 (class 0 OID 717956)
-- Dependencies: 214
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: silal_agent
--



--
-- TOC entry 3692 (class 0 OID 717979)
-- Dependencies: 218
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: silal_agent
--



--
-- TOC entry 3693 (class 0 OID 717995)
-- Dependencies: 219
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: silal_agent
--



--
-- TOC entry 3690 (class 0 OID 717967)
-- Dependencies: 216
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: silal_agent
--



--
-- TOC entry 3686 (class 0 OID 717936)
-- Dependencies: 212
-- Data for Name: seller; Type: TABLE DATA; Schema: public; Owner: silal_agent
--



--
-- TOC entry 3699 (class 0 OID 718067)
-- Dependencies: 225
-- Data for Name: seller_company_transaction; Type: TABLE DATA; Schema: public; Owner: silal_agent
--



--
-- TOC entry 3695 (class 0 OID 718011)
-- Dependencies: 221
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public.transaction VALUES (1, 'customer_company_transaction', 4828.83, '2023-01-23 02:51:23.939637');
INSERT INTO public.transaction VALUES (2, 'company_customer_transaction', 5549.65, '2023-01-28 03:04:23.941491');
INSERT INTO public.transaction VALUES (3, 'customer_driver_transaction', 3421.36, '2023-01-24 10:36:23.94247');
INSERT INTO public.transaction VALUES (4, 'company_driver_transaction', 2716.61, '2023-01-27 10:54:23.942895');
INSERT INTO public.transaction VALUES (5, 'company_customer_transaction', 6315.74, '2023-01-23 05:48:23.943308');
INSERT INTO public.transaction VALUES (6, 'customer_driver_transaction', 8826.68, '2023-01-27 02:33:23.94373');
INSERT INTO public.transaction VALUES (7, 'company_customer_transaction', 7060.46, '2023-01-23 11:19:23.944174');
INSERT INTO public.transaction VALUES (8, 'company_driver_transaction', 7907.31, '2023-01-25 01:42:23.944584');
INSERT INTO public.transaction VALUES (9, 'company_customer_transaction', 6023.31, '2023-01-23 23:31:23.944989');
INSERT INTO public.transaction VALUES (10, 'customer_company_transaction', 9055.52, '2023-01-25 02:23:23.945438');
INSERT INTO public.transaction VALUES (11, 'company_seller_transaction', 3799.05, '2023-01-23 17:01:23.945989');
INSERT INTO public.transaction VALUES (12, 'company_seller_transaction', 4605.64, '2023-01-26 14:17:23.946489');
INSERT INTO public.transaction VALUES (13, 'company_seller_transaction', 7855.20, '2023-01-28 13:42:23.947061');
INSERT INTO public.transaction VALUES (14, 'customer_company_transaction', 5140.87, '2023-01-24 00:45:23.947506');
INSERT INTO public.transaction VALUES (15, 'company_customer_transaction', 6364.27, '2023-01-26 12:44:23.94796');
INSERT INTO public.transaction VALUES (16, 'company_customer_transaction', 477.46, '2023-01-25 16:07:23.948353');
INSERT INTO public.transaction VALUES (17, 'customer_driver_transaction', 9559.46, '2023-01-27 01:08:23.94874');
INSERT INTO public.transaction VALUES (18, 'company_driver_transaction', 6678.15, '2023-01-27 22:43:23.94913');
INSERT INTO public.transaction VALUES (19, 'company_seller_transaction', 6472.31, '2023-01-27 07:47:23.949518');
INSERT INTO public.transaction VALUES (20, 'customer_driver_transaction', 1618.30, '2023-01-24 22:32:23.949936');
INSERT INTO public.transaction VALUES (21, 'customer_company_transaction', 5789.89, '2023-01-25 00:45:23.950358');
INSERT INTO public.transaction VALUES (22, 'company_customer_transaction', 1393.99, '2023-01-26 02:46:23.95079');
INSERT INTO public.transaction VALUES (23, 'company_driver_transaction', 3251.21, '2023-01-25 01:44:23.951216');
INSERT INTO public.transaction VALUES (24, 'company_seller_transaction', 3988.65, '2023-01-24 23:19:23.951633');
INSERT INTO public.transaction VALUES (25, 'company_customer_transaction', 6286.72, '2023-01-22 19:32:23.952025');
INSERT INTO public.transaction VALUES (26, 'company_driver_transaction', 9764.00, '2023-01-24 08:37:23.952411');
INSERT INTO public.transaction VALUES (27, 'company_seller_transaction', 5531.05, '2023-01-23 18:53:23.952899');
INSERT INTO public.transaction VALUES (28, 'company_customer_transaction', 7526.40, '2023-01-27 16:51:23.953287');
INSERT INTO public.transaction VALUES (29, 'customer_company_transaction', 6207.18, '2023-01-23 03:59:23.95371');
INSERT INTO public.transaction VALUES (30, 'company_driver_transaction', 4807.40, '2023-01-26 06:43:23.954163');
INSERT INTO public.transaction VALUES (31, 'company_seller_transaction', 7118.89, '2023-01-25 02:04:23.954602');
INSERT INTO public.transaction VALUES (32, 'company_seller_transaction', 9308.26, '2023-01-23 00:02:23.955014');
INSERT INTO public.transaction VALUES (33, 'customer_company_transaction', 9742.80, '2023-01-27 17:37:23.955487');
INSERT INTO public.transaction VALUES (34, 'company_driver_transaction', 4511.77, '2023-01-24 11:29:23.955891');
INSERT INTO public.transaction VALUES (35, 'company_seller_transaction', 6574.44, '2023-01-25 04:30:23.956288');
INSERT INTO public.transaction VALUES (36, 'company_customer_transaction', 527.72, '2023-01-23 04:38:23.956676');
INSERT INTO public.transaction VALUES (37, 'company_driver_transaction', 8286.28, '2023-01-26 19:50:23.957063');
INSERT INTO public.transaction VALUES (38, 'company_customer_transaction', 5388.05, '2023-01-28 17:54:23.957458');
INSERT INTO public.transaction VALUES (39, 'customer_company_transaction', 2082.73, '2023-01-24 03:47:23.958072');
INSERT INTO public.transaction VALUES (40, 'company_seller_transaction', 9797.72, '2023-01-28 02:25:23.95859');
INSERT INTO public.transaction VALUES (41, 'company_customer_transaction', 4096.25, '2023-01-27 15:44:23.959128');
INSERT INTO public.transaction VALUES (42, 'customer_company_transaction', 1128.45, '2023-01-23 17:14:23.959638');
INSERT INTO public.transaction VALUES (43, 'company_customer_transaction', 2911.74, '2023-01-28 02:40:23.960128');
INSERT INTO public.transaction VALUES (44, 'company_driver_transaction', 84.20, '2023-01-25 09:14:23.960619');
INSERT INTO public.transaction VALUES (45, 'company_customer_transaction', 4941.19, '2023-01-25 15:27:23.961111');
INSERT INTO public.transaction VALUES (46, 'company_customer_transaction', 9431.19, '2023-01-28 05:48:23.961521');
INSERT INTO public.transaction VALUES (47, 'company_customer_transaction', 6813.24, '2023-01-25 10:32:23.961785');
INSERT INTO public.transaction VALUES (48, 'customer_company_transaction', 5376.34, '2023-01-23 23:22:23.962043');
INSERT INTO public.transaction VALUES (49, 'company_seller_transaction', 8572.24, '2023-01-24 00:37:23.962302');
INSERT INTO public.transaction VALUES (50, 'company_driver_transaction', 5736.48, '2023-01-27 04:55:23.962562');
INSERT INTO public.transaction VALUES (51, 'company_driver_transaction', 8102.02, '2023-01-27 08:18:23.962814');
INSERT INTO public.transaction VALUES (52, 'company_seller_transaction', 8642.34, '2023-01-24 15:28:23.963143');
INSERT INTO public.transaction VALUES (53, 'customer_driver_transaction', 5727.83, '2023-01-22 22:17:23.963403');
INSERT INTO public.transaction VALUES (54, 'company_customer_transaction', 470.65, '2023-01-24 07:26:23.963658');
INSERT INTO public.transaction VALUES (55, 'customer_driver_transaction', 8814.59, '2023-01-25 20:45:23.963941');
INSERT INTO public.transaction VALUES (56, 'company_driver_transaction', 4761.57, '2023-01-25 02:14:23.964215');
INSERT INTO public.transaction VALUES (57, 'company_customer_transaction', 657.60, '2023-01-28 17:44:23.964475');
INSERT INTO public.transaction VALUES (58, 'customer_company_transaction', 2914.09, '2023-01-25 09:58:23.964722');
INSERT INTO public.transaction VALUES (59, 'customer_company_transaction', 7004.67, '2023-01-25 00:57:23.964969');
INSERT INTO public.transaction VALUES (60, 'company_seller_transaction', 7482.48, '2023-01-25 22:00:23.965214');
INSERT INTO public.transaction VALUES (61, 'customer_driver_transaction', 6962.32, '2023-01-27 14:38:23.965483');
INSERT INTO public.transaction VALUES (62, 'company_driver_transaction', 2406.50, '2023-01-27 07:04:23.965772');
INSERT INTO public.transaction VALUES (63, 'company_customer_transaction', 2984.93, '2023-01-22 23:57:23.966062');
INSERT INTO public.transaction VALUES (64, 'company_seller_transaction', 1259.25, '2023-01-25 16:50:23.96639');
INSERT INTO public.transaction VALUES (65, 'company_customer_transaction', 2744.55, '2023-01-24 04:47:23.966677');
INSERT INTO public.transaction VALUES (66, 'customer_driver_transaction', 4402.79, '2023-01-22 20:53:23.966952');
INSERT INTO public.transaction VALUES (67, 'customer_company_transaction', 5863.39, '2023-01-25 15:58:23.967221');
INSERT INTO public.transaction VALUES (68, 'customer_driver_transaction', 7885.51, '2023-01-24 11:02:23.967495');
INSERT INTO public.transaction VALUES (69, 'customer_company_transaction', 8340.30, '2023-01-28 15:00:23.967775');
INSERT INTO public.transaction VALUES (70, 'company_seller_transaction', 8647.25, '2023-01-26 17:47:23.968065');
INSERT INTO public.transaction VALUES (71, 'company_driver_transaction', 7408.58, '2023-01-24 00:06:23.968353');
INSERT INTO public.transaction VALUES (72, 'company_customer_transaction', 212.21, '2023-01-23 08:30:23.968629');
INSERT INTO public.transaction VALUES (73, 'customer_company_transaction', 7107.48, '2023-01-22 21:49:23.968904');
INSERT INTO public.transaction VALUES (74, 'customer_company_transaction', 2266.32, '2023-01-25 03:27:23.969184');
INSERT INTO public.transaction VALUES (75, 'company_seller_transaction', 2067.76, '2023-01-27 00:04:23.969437');
INSERT INTO public.transaction VALUES (76, 'customer_company_transaction', 9353.50, '2023-01-23 09:56:23.9697');
INSERT INTO public.transaction VALUES (77, 'customer_company_transaction', 4661.96, '2023-01-28 08:02:23.970011');
INSERT INTO public.transaction VALUES (78, 'customer_driver_transaction', 6900.43, '2023-01-27 15:29:23.970267');
INSERT INTO public.transaction VALUES (79, 'company_seller_transaction', 3485.31, '2023-01-25 10:36:23.970509');
INSERT INTO public.transaction VALUES (80, 'customer_driver_transaction', 7711.68, '2023-01-23 21:45:23.970787');
INSERT INTO public.transaction VALUES (81, 'company_customer_transaction', 6820.13, '2023-01-28 06:45:23.971009');
INSERT INTO public.transaction VALUES (82, 'company_seller_transaction', 1969.89, '2023-01-24 21:58:23.971489');
INSERT INTO public.transaction VALUES (83, 'customer_driver_transaction', 5389.81, '2023-01-28 02:49:23.971713');
INSERT INTO public.transaction VALUES (84, 'company_seller_transaction', 5081.86, '2023-01-23 07:55:23.971919');
INSERT INTO public.transaction VALUES (85, 'customer_company_transaction', 5408.10, '2023-01-24 16:17:23.972141');
INSERT INTO public.transaction VALUES (86, 'company_seller_transaction', 3064.92, '2023-01-28 11:52:23.972345');
INSERT INTO public.transaction VALUES (87, 'company_seller_transaction', 5714.74, '2023-01-23 16:21:23.972544');
INSERT INTO public.transaction VALUES (88, 'customer_driver_transaction', 5935.83, '2023-01-23 19:44:23.972744');
INSERT INTO public.transaction VALUES (89, 'customer_company_transaction', 5897.37, '2023-01-24 21:22:23.972943');
INSERT INTO public.transaction VALUES (90, 'customer_company_transaction', 4644.29, '2023-01-27 02:49:23.973148');
INSERT INTO public.transaction VALUES (91, 'company_driver_transaction', 7136.29, '2023-01-26 06:40:23.973351');
INSERT INTO public.transaction VALUES (92, 'customer_company_transaction', 6642.84, '2023-01-26 06:55:23.973562');
INSERT INTO public.transaction VALUES (93, 'customer_driver_transaction', 8735.16, '2023-01-24 05:13:23.973845');
INSERT INTO public.transaction VALUES (94, 'customer_company_transaction', 924.07, '2023-01-25 20:46:23.974104');
INSERT INTO public.transaction VALUES (95, 'customer_driver_transaction', 7914.74, '2023-01-28 13:09:23.97433');
INSERT INTO public.transaction VALUES (96, 'customer_company_transaction', 1157.76, '2023-01-28 07:17:23.974535');
INSERT INTO public.transaction VALUES (97, 'customer_company_transaction', 7196.95, '2023-01-28 10:54:23.974733');
INSERT INTO public.transaction VALUES (98, 'customer_company_transaction', 7334.35, '2023-01-23 10:36:23.974921');
INSERT INTO public.transaction VALUES (99, 'customer_driver_transaction', 6595.58, '2023-01-23 21:59:23.975116');
INSERT INTO public.transaction VALUES (100, 'customer_company_transaction', 717.22, '2023-01-24 12:07:23.975317');


--
-- TOC entry 3684 (class 0 OID 717920)
-- Dependencies: 210
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public."user" VALUES (1, '1234567890', 'manager', 'Account Manager', 'pbkdf2:sha512:200000$yGqngfgV$6f9d391ce406e93b904ccc0b9c40b4b034990fdeebaabbd07d81298a7666244c6a000b74f263a17d7913f36da848cddb161ec254d51cbc009b73cf57d3cd66f9', 'admin@silal.app');
INSERT INTO public."user" VALUES (2, '4343434340', 'customer', 'John Doe', 'pbkdf2:sha512:200000$yGqngfgV$6f9d391ce406e93b904ccc0b9c40b4b034990fdeebaabbd07d81298a7666244c6a000b74f263a17d7913f36da848cddb161ec254d51cbc009b73cf57d3cd66f9', '123@gmail.com');


--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 217
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: silal_agent
--

SELECT pg_catalog.setval('public.order_order_id_seq', 1, false);


--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 215
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: silal_agent
--

SELECT pg_catalog.setval('public.product_product_id_seq', 1, false);


--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 220
-- Name: transaction_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: silal_agent
--

SELECT pg_catalog.setval('public.transaction_transaction_id_seq', 100, true);


--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: silal_agent
--

SELECT pg_catalog.setval('public.user_user_id_seq', 2, true);


--
-- TOC entry 3523 (class 2606 OID 718086)
-- Name: company_driver_transaction company_driver_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.company_driver_transaction
    ADD CONSTRAINT company_driver_transaction_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 3519 (class 2606 OID 718056)
-- Name: customer_company_transaction customer_company_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.customer_company_transaction
    ADD CONSTRAINT customer_company_transaction_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 3515 (class 2606 OID 718021)
-- Name: customer_driver_transaction customer_driver_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.customer_driver_transaction
    ADD CONSTRAINT customer_driver_transaction_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 3499 (class 2606 OID 717930)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3517 (class 2606 OID 718041)
-- Name: driver_company_transaction driver_company_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.driver_company_transaction
    ADD CONSTRAINT driver_company_transaction_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 3503 (class 2606 OID 717950)
-- Name: driver driver_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3505 (class 2606 OID 717960)
-- Name: manager manager_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3511 (class 2606 OID 717999)
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (order_id, product_id);


--
-- TOC entry 3509 (class 2606 OID 717984)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3507 (class 2606 OID 717972)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3521 (class 2606 OID 718071)
-- Name: seller_company_transaction seller_company_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.seller_company_transaction
    ADD CONSTRAINT seller_company_transaction_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 3501 (class 2606 OID 717940)
-- Name: seller seller_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3513 (class 2606 OID 718016)
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 3497 (class 2606 OID 717925)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3542 (class 2606 OID 718087)
-- Name: company_driver_transaction company_driver_transaction_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.company_driver_transaction
    ADD CONSTRAINT company_driver_transaction_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.driver(user_id) ON DELETE CASCADE;


--
-- TOC entry 3543 (class 2606 OID 718092)
-- Name: company_driver_transaction company_driver_transaction_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.company_driver_transaction
    ADD CONSTRAINT company_driver_transaction_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(transaction_id) ON DELETE CASCADE;


--
-- TOC entry 3538 (class 2606 OID 718057)
-- Name: customer_company_transaction customer_company_transaction_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.customer_company_transaction
    ADD CONSTRAINT customer_company_transaction_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(user_id) ON DELETE CASCADE;


--
-- TOC entry 3539 (class 2606 OID 718062)
-- Name: customer_company_transaction customer_company_transaction_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.customer_company_transaction
    ADD CONSTRAINT customer_company_transaction_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(transaction_id) ON DELETE CASCADE;


--
-- TOC entry 3533 (class 2606 OID 718022)
-- Name: customer_driver_transaction customer_driver_transaction_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.customer_driver_transaction
    ADD CONSTRAINT customer_driver_transaction_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(user_id) ON DELETE CASCADE;


--
-- TOC entry 3534 (class 2606 OID 718027)
-- Name: customer_driver_transaction customer_driver_transaction_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.customer_driver_transaction
    ADD CONSTRAINT customer_driver_transaction_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.driver(user_id) ON DELETE CASCADE;


--
-- TOC entry 3535 (class 2606 OID 718032)
-- Name: customer_driver_transaction customer_driver_transaction_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.customer_driver_transaction
    ADD CONSTRAINT customer_driver_transaction_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(transaction_id) ON DELETE CASCADE;


--
-- TOC entry 3524 (class 2606 OID 717931)
-- Name: customer customer_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- TOC entry 3536 (class 2606 OID 718042)
-- Name: driver_company_transaction driver_company_transaction_driver_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.driver_company_transaction
    ADD CONSTRAINT driver_company_transaction_driver_transaction_id_fkey FOREIGN KEY (driver_id) REFERENCES public.driver(user_id) ON DELETE CASCADE;


--
-- TOC entry 3537 (class 2606 OID 718047)
-- Name: driver_company_transaction driver_company_transaction_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.driver_company_transaction
    ADD CONSTRAINT driver_company_transaction_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(transaction_id) ON DELETE CASCADE;


--
-- TOC entry 3526 (class 2606 OID 717951)
-- Name: driver driver_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- TOC entry 3527 (class 2606 OID 717961)
-- Name: manager manager_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- TOC entry 3529 (class 2606 OID 717985)
-- Name: order order_customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_customer_fkey FOREIGN KEY (order_customer) REFERENCES public.customer(user_id) ON DELETE CASCADE;


--
-- TOC entry 3530 (class 2606 OID 717990)
-- Name: order order_driver_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_driver_fkey FOREIGN KEY (order_driver) REFERENCES public.driver(user_id) ON DELETE CASCADE;


--
-- TOC entry 3531 (class 2606 OID 718000)
-- Name: order_item order_item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id) ON DELETE CASCADE;


--
-- TOC entry 3532 (class 2606 OID 718005)
-- Name: order_item order_item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;


--
-- TOC entry 3528 (class 2606 OID 717973)
-- Name: product product_seller_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_seller_fkey FOREIGN KEY (product_seller) REFERENCES public.seller(user_id) ON DELETE CASCADE;


--
-- TOC entry 3540 (class 2606 OID 718072)
-- Name: seller_company_transaction seller_company_transaction_seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.seller_company_transaction
    ADD CONSTRAINT seller_company_transaction_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.seller(user_id) ON DELETE CASCADE;


--
-- TOC entry 3541 (class 2606 OID 718077)
-- Name: seller_company_transaction seller_company_transaction_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.seller_company_transaction
    ADD CONSTRAINT seller_company_transaction_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(transaction_id) ON DELETE CASCADE;


--
-- TOC entry 3525 (class 2606 OID 717941)
-- Name: seller seller_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: silal_agent
--

ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-01-28 20:00:16 EET

--
-- PostgreSQL database dump complete
--

