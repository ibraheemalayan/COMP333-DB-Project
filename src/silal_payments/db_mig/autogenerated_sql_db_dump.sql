--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 15.1

-- Started on 2023-02-06 23:09:19 EET

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
-- TOC entry 3701 (class 1262 OID 715068)
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
-- TOC entry 3695 (class 0 OID 730913)
-- Dependencies: 226
-- Data for Name: company_driver_transaction; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public.company_driver_transaction VALUES (16, 104);
INSERT INTO public.company_driver_transaction VALUES (24, 110);
INSERT INTO public.company_driver_transaction VALUES (35, 88);
INSERT INTO public.company_driver_transaction VALUES (41, 98);
INSERT INTO public.company_driver_transaction VALUES (45, 112);
INSERT INTO public.company_driver_transaction VALUES (54, 93);
INSERT INTO public.company_driver_transaction VALUES (72, 99);
INSERT INTO public.company_driver_transaction VALUES (84, 114);
INSERT INTO public.company_driver_transaction VALUES (100, 107);
INSERT INTO public.company_driver_transaction VALUES (105, 111);
INSERT INTO public.company_driver_transaction VALUES (160, 112);
INSERT INTO public.company_driver_transaction VALUES (162, 101);
INSERT INTO public.company_driver_transaction VALUES (164, 99);
INSERT INTO public.company_driver_transaction VALUES (171, 108);
INSERT INTO public.company_driver_transaction VALUES (185, 112);
INSERT INTO public.company_driver_transaction VALUES (192, 90);
INSERT INTO public.company_driver_transaction VALUES (198, 101);
INSERT INTO public.company_driver_transaction VALUES (203, 97);


--
-- TOC entry 3681 (class 0 OID 730762)
-- Dependencies: 212
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public.customer VALUES (17, 'Unit 5938 Box 2421
DPO AP 33335', '213141157815650');
INSERT INTO public.customer VALUES (18, '60975 Jessica Squares
East Sallybury, IA 19178', '180011587148411');
INSERT INTO public.customer VALUES (19, '32094 Jones Springs Apt. 201
Masseyhaven, KY 68893', '4969477515912');
INSERT INTO public.customer VALUES (20, '23098 Anthony Roads
New Maria, DE 51777', '2281090321730084');
INSERT INTO public.customer VALUES (21, '91634 Strong Mountains Apt. 302
West Alyssa, DE 78723', '30207698456428');
INSERT INTO public.customer VALUES (22, '9459 Jennifer Loaf Suite 109
Lake Matthew, IA 29742', '4696069602714277');
INSERT INTO public.customer VALUES (23, '3812 Richard Springs
Stewartborough, AL 94522', '676389131936');
INSERT INTO public.customer VALUES (24, '1428 Wilson Drives Suite 000
Lake Jordan, MD 48590', '3597765823694022');
INSERT INTO public.customer VALUES (25, '456 Kelly Neck
North Kyle, MH 69058', '3546546118775516');
INSERT INTO public.customer VALUES (26, '13306 Corey Point
Shanefort, WY 77163', '3561534926351100');
INSERT INTO public.customer VALUES (27, '213 Gray Plains
North Vanessa, NM 19952', '3568757738930554');
INSERT INTO public.customer VALUES (28, '18013 Billy Bridge Suite 522
Schmitthaven, MS 69943', '213191891634891');
INSERT INTO public.customer VALUES (29, '248 Cook Park
Sherriport, WI 53987', '6502234500762799');
INSERT INTO public.customer VALUES (30, '2009 Crystal Cove
Jamesfort, DE 08386', '3595194264183068');
INSERT INTO public.customer VALUES (31, '993 Clayton Viaduct
Hunterville, FL 56333', '3511611620766071');
INSERT INTO public.customer VALUES (32, '03519 Jared Ford Apt. 045
New Jesseberg, HI 60013', '2554203557448525');
INSERT INTO public.customer VALUES (33, '24560 Carolyn Lock
Lake Charleschester, ME 72692', '6011964513758061');
INSERT INTO public.customer VALUES (34, '41892 Hebert Ferry
Reynoldsbury, NH 45116', '213157173407975');
INSERT INTO public.customer VALUES (35, '738 Ramirez Brooks
West Nicoleton, AL 34130', '6571454391014482');
INSERT INTO public.customer VALUES (36, '168 Figueroa Turnpike
Kellystad, OK 82920', '4116697284576374');
INSERT INTO public.customer VALUES (37, '57608 Gloria Common
Smithton, DE 81880', '574329431674');
INSERT INTO public.customer VALUES (38, '27566 Price Forges
South Shelby, OR 93561', '630403125028');
INSERT INTO public.customer VALUES (39, '774 Lewis Grove Apt. 002
Adamtown, DC 08848', '6011968373591918');
INSERT INTO public.customer VALUES (40, '533 Chambers Street
Larryfurt, KS 63688', '340481077706779');
INSERT INTO public.customer VALUES (41, '602 Tracy Crossroad Suite 556
New Rachelside, WY 26870', '3578978443019123');
INSERT INTO public.customer VALUES (42, '95384 Jodi Garden Apt. 845
West Courtney, LA 76792', '4088559026228124');
INSERT INTO public.customer VALUES (43, '927 Christina Burg Suite 774
East Angelaburgh, TN 65342', '3585142963546038');
INSERT INTO public.customer VALUES (44, '59802 Johnson Road Apt. 030
East Soniamouth, CA 08680', '372376254256609');
INSERT INTO public.customer VALUES (45, '08298 Christopher Freeway Apt. 302
Lake Christian, MP 78866', '2720729904560074');
INSERT INTO public.customer VALUES (46, '0484 Madden Trail Suite 076
South Michaelton, AK 36290', '3549438856431956');
INSERT INTO public.customer VALUES (47, '255 Garrett Islands
Pattonchester, GA 00633', '4725074931864285');
INSERT INTO public.customer VALUES (48, '4406 Shah Plain Suite 536
Port Adam, NY 20860', '4570869305823577');
INSERT INTO public.customer VALUES (49, '78132 Mclean Meadow Suite 446
Chelsealand, ME 04450', '30043666609759');
INSERT INTO public.customer VALUES (50, '550 James Creek
Williamstown, MD 51966', '4629264802227087');
INSERT INTO public.customer VALUES (51, '243 Murphy Station
Kimberlyhaven, NH 20843', '30209280513798');
INSERT INTO public.customer VALUES (52, '501 Ronald Knoll
Rogersfurt, NY 47956', '4250220593060463');
INSERT INTO public.customer VALUES (53, '9944 Gutierrez Burgs Suite 436
West Coletown, MI 03297', '4905787710864083');
INSERT INTO public.customer VALUES (54, '06528 Ethan Tunnel Apt. 395
South Susanfurt, AZ 30179', '4523532675920');
INSERT INTO public.customer VALUES (55, 'Unit 0058 Box 0001
DPO AP 80648', '4606695325838610');
INSERT INTO public.customer VALUES (56, '76914 Dyer Landing Apt. 997
West Billy, MD 51720', '4802606661797221');
INSERT INTO public.customer VALUES (57, '8034 Jennifer Islands Suite 604
Johnsonchester, KY 49674', '3552219520696719');
INSERT INTO public.customer VALUES (58, '30827 Yoder Road
Jennifermouth, TX 16030', '6525858268436569');
INSERT INTO public.customer VALUES (59, '399 Joseph Street
South Christopher, AZ 01875', '2287517594732888');
INSERT INTO public.customer VALUES (60, '376 Smith Dale Suite 279
South Sarahland, SD 77599', '6538707914878671');
INSERT INTO public.customer VALUES (61, 'USCGC Long
FPO AA 73395', '2257314251202983');
INSERT INTO public.customer VALUES (62, '03374 Walker Park Suite 851
West Ashleybury, WA 48669', '6011343754692166');
INSERT INTO public.customer VALUES (63, '417 Martinez Drives Suite 325
Perezfurt, MS 61425', '180099368473587');
INSERT INTO public.customer VALUES (64, '1435 Daniel Union
Anthonyton, AL 50658', '213121993173084');
INSERT INTO public.customer VALUES (65, '3609 Johnson Key
Margaretmouth, SD 18114', '3541140292639535');
INSERT INTO public.customer VALUES (66, '64619 Wilkins Wall Apt. 735
Rowechester, AK 59090', '3586736347723749');
INSERT INTO public.customer VALUES (67, '25059 Katie Mountain
Byrdchester, NM 25673', '4058352889962971');
INSERT INTO public.customer VALUES (68, '00237 Donna Coves
Middletonport, PW 90026', '373258576757127');
INSERT INTO public.customer VALUES (69, '006 Christopher Loop Suite 830
New Dawn, NM 40953', '6011197036954103');
INSERT INTO public.customer VALUES (70, '97436 Reese Junction Apt. 941
East Leslieshire, OK 64076', '2676560169220169');
INSERT INTO public.customer VALUES (71, '8802 Weiss Route
Martinstad, CT 80907', '180014918192702');
INSERT INTO public.customer VALUES (72, '2458 Jason Village Suite 248
North Donnamouth, ME 93087', '341904124388571');
INSERT INTO public.customer VALUES (73, '640 Mary Route
Charlesmouth, MD 72308', '4038249066493454');
INSERT INTO public.customer VALUES (74, '0314 Madison Crossroad Suite 058
Martinezbury, NM 37422', '4670285332342284');
INSERT INTO public.customer VALUES (75, '407 Bryan Expressway
Wagnerborough, MS 70390', '180012180103670');
INSERT INTO public.customer VALUES (76, '08173 Mckinney Trace
New Courtney, NY 38401', '676225554846');
INSERT INTO public.customer VALUES (77, '5596 Riley Square Suite 933
Robinsonhaven, GA 67302', '4546478034710393');
INSERT INTO public.customer VALUES (78, '400 Cathy Expressway Suite 367
Micheleland, OR 57115', '5120984536352270');
INSERT INTO public.customer VALUES (79, '164 Schultz Road
Lake Bryan, DC 41935', '4779541721848699');
INSERT INTO public.customer VALUES (80, '127 Parks Courts
Bakerville, SC 47122', '213100902166702');
INSERT INTO public.customer VALUES (81, '09628 Russell Village Apt. 782
Lake Jared, GA 12203', '3544436008104229');
INSERT INTO public.customer VALUES (82, '115 Jon Isle Suite 788
North Lesliefurt, WI 53362', '180086813268522');
INSERT INTO public.customer VALUES (83, '9597 Hall Parkway Apt. 655
East Autumnfort, DE 48734', '6011808810950527');
INSERT INTO public.customer VALUES (84, '520 Fox Expressway Suite 497
North Jasmine, RI 79115', '4975956928663562');
INSERT INTO public.customer VALUES (85, '3248 Amanda Station
South Timothyburgh, PA 47416', '3518734648356502');
INSERT INTO public.customer VALUES (86, '5601 Matthew Estate Suite 987
Amychester, MH 63640', '341118098591934');


--
-- TOC entry 3693 (class 0 OID 730878)
-- Dependencies: 224
-- Data for Name: customer_company_transaction; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public.customer_company_transaction VALUES (1, 33, 22);
INSERT INTO public.customer_company_transaction VALUES (3, 77, 101);
INSERT INTO public.customer_company_transaction VALUES (6, 27, 106);
INSERT INTO public.customer_company_transaction VALUES (7, 21, 84);
INSERT INTO public.customer_company_transaction VALUES (11, 43, 44);
INSERT INTO public.customer_company_transaction VALUES (12, 34, 85);
INSERT INTO public.customer_company_transaction VALUES (14, 39, 29);
INSERT INTO public.customer_company_transaction VALUES (15, 46, 113);
INSERT INTO public.customer_company_transaction VALUES (17, 70, 123);
INSERT INTO public.customer_company_transaction VALUES (20, 68, 21);
INSERT INTO public.customer_company_transaction VALUES (21, 85, 46);
INSERT INTO public.customer_company_transaction VALUES (22, 47, 51);
INSERT INTO public.customer_company_transaction VALUES (25, 65, 74);
INSERT INTO public.customer_company_transaction VALUES (26, 68, 17);
INSERT INTO public.customer_company_transaction VALUES (27, 84, 59);
INSERT INTO public.customer_company_transaction VALUES (28, 69, 25);
INSERT INTO public.customer_company_transaction VALUES (30, 67, 58);
INSERT INTO public.customer_company_transaction VALUES (31, 66, 81);
INSERT INTO public.customer_company_transaction VALUES (33, 80, 98);
INSERT INTO public.customer_company_transaction VALUES (36, 64, 117);
INSERT INTO public.customer_company_transaction VALUES (38, 25, 111);
INSERT INTO public.customer_company_transaction VALUES (39, 66, 124);
INSERT INTO public.customer_company_transaction VALUES (40, 20, 71);
INSERT INTO public.customer_company_transaction VALUES (42, 77, 102);
INSERT INTO public.customer_company_transaction VALUES (46, 40, 37);
INSERT INTO public.customer_company_transaction VALUES (48, 58, 2);
INSERT INTO public.customer_company_transaction VALUES (51, 82, 24);
INSERT INTO public.customer_company_transaction VALUES (52, 48, 14);
INSERT INTO public.customer_company_transaction VALUES (55, 80, 87);
INSERT INTO public.customer_company_transaction VALUES (56, 84, 1);
INSERT INTO public.customer_company_transaction VALUES (58, 85, 39);
INSERT INTO public.customer_company_transaction VALUES (60, 69, 92);
INSERT INTO public.customer_company_transaction VALUES (61, 75, 52);
INSERT INTO public.customer_company_transaction VALUES (62, 52, 49);
INSERT INTO public.customer_company_transaction VALUES (63, 56, 56);
INSERT INTO public.customer_company_transaction VALUES (64, 85, 121);
INSERT INTO public.customer_company_transaction VALUES (66, 66, 35);
INSERT INTO public.customer_company_transaction VALUES (68, 49, 61);
INSERT INTO public.customer_company_transaction VALUES (71, 38, 75);
INSERT INTO public.customer_company_transaction VALUES (73, 42, 69);
INSERT INTO public.customer_company_transaction VALUES (76, 80, 82);
INSERT INTO public.customer_company_transaction VALUES (77, 73, 16);
INSERT INTO public.customer_company_transaction VALUES (78, 84, 80);
INSERT INTO public.customer_company_transaction VALUES (79, 35, 118);
INSERT INTO public.customer_company_transaction VALUES (80, 84, 54);
INSERT INTO public.customer_company_transaction VALUES (81, 47, 70);
INSERT INTO public.customer_company_transaction VALUES (82, 27, 60);
INSERT INTO public.customer_company_transaction VALUES (83, 71, 31);
INSERT INTO public.customer_company_transaction VALUES (86, 65, 42);
INSERT INTO public.customer_company_transaction VALUES (87, 79, 129);
INSERT INTO public.customer_company_transaction VALUES (90, 86, 10);
INSERT INTO public.customer_company_transaction VALUES (92, 29, 6);
INSERT INTO public.customer_company_transaction VALUES (93, 40, 112);
INSERT INTO public.customer_company_transaction VALUES (95, 56, 77);
INSERT INTO public.customer_company_transaction VALUES (96, 62, 48);
INSERT INTO public.customer_company_transaction VALUES (99, 31, 5);
INSERT INTO public.customer_company_transaction VALUES (101, 48, 57);
INSERT INTO public.customer_company_transaction VALUES (102, 52, 4);
INSERT INTO public.customer_company_transaction VALUES (103, 21, 97);
INSERT INTO public.customer_company_transaction VALUES (104, 32, 99);
INSERT INTO public.customer_company_transaction VALUES (108, 62, 89);
INSERT INTO public.customer_company_transaction VALUES (110, 73, 65);
INSERT INTO public.customer_company_transaction VALUES (111, 46, 26);
INSERT INTO public.customer_company_transaction VALUES (112, 43, 47);
INSERT INTO public.customer_company_transaction VALUES (113, 23, 91);
INSERT INTO public.customer_company_transaction VALUES (116, 83, 126);
INSERT INTO public.customer_company_transaction VALUES (117, 26, 125);
INSERT INTO public.customer_company_transaction VALUES (118, 19, 109);
INSERT INTO public.customer_company_transaction VALUES (119, 58, 32);
INSERT INTO public.customer_company_transaction VALUES (120, 41, 122);
INSERT INTO public.customer_company_transaction VALUES (122, 26, 110);
INSERT INTO public.customer_company_transaction VALUES (123, 50, 13);
INSERT INTO public.customer_company_transaction VALUES (124, 80, 128);
INSERT INTO public.customer_company_transaction VALUES (126, 49, 28);
INSERT INTO public.customer_company_transaction VALUES (127, 23, 95);
INSERT INTO public.customer_company_transaction VALUES (129, 85, 93);
INSERT INTO public.customer_company_transaction VALUES (130, 34, 62);
INSERT INTO public.customer_company_transaction VALUES (133, 27, 11);
INSERT INTO public.customer_company_transaction VALUES (135, 82, 30);
INSERT INTO public.customer_company_transaction VALUES (136, 34, 86);
INSERT INTO public.customer_company_transaction VALUES (139, 56, 36);
INSERT INTO public.customer_company_transaction VALUES (142, 78, 103);
INSERT INTO public.customer_company_transaction VALUES (143, 36, 120);
INSERT INTO public.customer_company_transaction VALUES (144, 25, 96);
INSERT INTO public.customer_company_transaction VALUES (145, 70, 33);
INSERT INTO public.customer_company_transaction VALUES (147, 47, 50);
INSERT INTO public.customer_company_transaction VALUES (148, 49, 78);
INSERT INTO public.customer_company_transaction VALUES (150, 58, 100);
INSERT INTO public.customer_company_transaction VALUES (152, 29, 3);
INSERT INTO public.customer_company_transaction VALUES (154, 17, 90);
INSERT INTO public.customer_company_transaction VALUES (155, 48, 7);
INSERT INTO public.customer_company_transaction VALUES (157, 26, 108);
INSERT INTO public.customer_company_transaction VALUES (158, 53, 115);
INSERT INTO public.customer_company_transaction VALUES (159, 47, 8);
INSERT INTO public.customer_company_transaction VALUES (163, 42, 9);
INSERT INTO public.customer_company_transaction VALUES (165, 61, 114);
INSERT INTO public.customer_company_transaction VALUES (166, 65, 72);
INSERT INTO public.customer_company_transaction VALUES (168, 72, 19);
INSERT INTO public.customer_company_transaction VALUES (169, 48, 68);
INSERT INTO public.customer_company_transaction VALUES (170, 37, 43);
INSERT INTO public.customer_company_transaction VALUES (172, 59, 107);
INSERT INTO public.customer_company_transaction VALUES (173, 23, 79);
INSERT INTO public.customer_company_transaction VALUES (174, 67, 116);
INSERT INTO public.customer_company_transaction VALUES (176, 28, 53);
INSERT INTO public.customer_company_transaction VALUES (177, 73, 83);
INSERT INTO public.customer_company_transaction VALUES (178, 66, 15);
INSERT INTO public.customer_company_transaction VALUES (179, 51, 105);
INSERT INTO public.customer_company_transaction VALUES (180, 40, 41);
INSERT INTO public.customer_company_transaction VALUES (184, 39, 64);
INSERT INTO public.customer_company_transaction VALUES (186, 33, 88);
INSERT INTO public.customer_company_transaction VALUES (187, 72, 34);
INSERT INTO public.customer_company_transaction VALUES (189, 72, 20);
INSERT INTO public.customer_company_transaction VALUES (190, 19, 38);
INSERT INTO public.customer_company_transaction VALUES (194, 34, 55);
INSERT INTO public.customer_company_transaction VALUES (196, 72, 67);
INSERT INTO public.customer_company_transaction VALUES (197, 44, 27);
INSERT INTO public.customer_company_transaction VALUES (201, 84, 73);
INSERT INTO public.customer_company_transaction VALUES (202, 41, 94);
INSERT INTO public.customer_company_transaction VALUES (205, 22, 23);
INSERT INTO public.customer_company_transaction VALUES (206, 70, 63);
INSERT INTO public.customer_company_transaction VALUES (207, 61, 104);
INSERT INTO public.customer_company_transaction VALUES (208, 70, 12);
INSERT INTO public.customer_company_transaction VALUES (209, 50, 45);
INSERT INTO public.customer_company_transaction VALUES (212, 24, 76);
INSERT INTO public.customer_company_transaction VALUES (214, 24, 18);
INSERT INTO public.customer_company_transaction VALUES (215, 27, 119);
INSERT INTO public.customer_company_transaction VALUES (217, 68, 40);
INSERT INTO public.customer_company_transaction VALUES (218, 33, 66);
INSERT INTO public.customer_company_transaction VALUES (220, 27, 127);


--
-- TOC entry 3691 (class 0 OID 730843)
-- Dependencies: 222
-- Data for Name: customer_driver_transaction; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public.customer_driver_transaction VALUES (2, 85, 100);
INSERT INTO public.customer_driver_transaction VALUES (4, 37, 112);
INSERT INTO public.customer_driver_transaction VALUES (10, 50, 113);
INSERT INTO public.customer_driver_transaction VALUES (18, 19, 93);
INSERT INTO public.customer_driver_transaction VALUES (43, 31, 94);
INSERT INTO public.customer_driver_transaction VALUES (47, 76, 103);
INSERT INTO public.customer_driver_transaction VALUES (53, 59, 92);
INSERT INTO public.customer_driver_transaction VALUES (57, 56, 110);
INSERT INTO public.customer_driver_transaction VALUES (65, 18, 113);
INSERT INTO public.customer_driver_transaction VALUES (67, 40, 98);
INSERT INTO public.customer_driver_transaction VALUES (70, 45, 103);
INSERT INTO public.customer_driver_transaction VALUES (88, 53, 93);
INSERT INTO public.customer_driver_transaction VALUES (91, 61, 109);
INSERT INTO public.customer_driver_transaction VALUES (97, 17, 115);
INSERT INTO public.customer_driver_transaction VALUES (106, 41, 107);
INSERT INTO public.customer_driver_transaction VALUES (107, 21, 87);
INSERT INTO public.customer_driver_transaction VALUES (114, 50, 97);
INSERT INTO public.customer_driver_transaction VALUES (125, 65, 109);
INSERT INTO public.customer_driver_transaction VALUES (141, 48, 103);
INSERT INTO public.customer_driver_transaction VALUES (153, 70, 105);
INSERT INTO public.customer_driver_transaction VALUES (161, 70, 96);
INSERT INTO public.customer_driver_transaction VALUES (167, 42, 100);
INSERT INTO public.customer_driver_transaction VALUES (175, 19, 88);
INSERT INTO public.customer_driver_transaction VALUES (191, 67, 103);
INSERT INTO public.customer_driver_transaction VALUES (195, 21, 112);
INSERT INTO public.customer_driver_transaction VALUES (213, 29, 99);


--
-- TOC entry 3683 (class 0 OID 730782)
-- Dependencies: 214
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public.driver VALUES (87, '30593824219487');
INSERT INTO public.driver VALUES (88, '213156593877841');
INSERT INTO public.driver VALUES (89, '4975351393328711');
INSERT INTO public.driver VALUES (90, '3585839894719655');
INSERT INTO public.driver VALUES (91, '30112201868483');
INSERT INTO public.driver VALUES (92, '4159179533041359');
INSERT INTO public.driver VALUES (93, '676289101393');
INSERT INTO public.driver VALUES (94, '3573008691413144');
INSERT INTO public.driver VALUES (95, '4579230225848');
INSERT INTO public.driver VALUES (96, '180056428071504');
INSERT INTO public.driver VALUES (97, '344661093523375');
INSERT INTO public.driver VALUES (98, '6011271427878906');
INSERT INTO public.driver VALUES (99, '4206650300899');
INSERT INTO public.driver VALUES (100, '6011047142851240');
INSERT INTO public.driver VALUES (101, '3576582369402248');
INSERT INTO public.driver VALUES (102, '4945682417304289');
INSERT INTO public.driver VALUES (103, '30551717604520');
INSERT INTO public.driver VALUES (104, '4601688477935');
INSERT INTO public.driver VALUES (105, '341087317643034');
INSERT INTO public.driver VALUES (106, '30296687577385');
INSERT INTO public.driver VALUES (107, '4694711801320407');
INSERT INTO public.driver VALUES (108, '3589163489676998');
INSERT INTO public.driver VALUES (109, '4174466602234500');
INSERT INTO public.driver VALUES (110, '6011976701720091');
INSERT INTO public.driver VALUES (111, '3595194264183068');
INSERT INTO public.driver VALUES (112, '30408993318863');
INSERT INTO public.driver VALUES (113, '5462076607541513');
INSERT INTO public.driver VALUES (114, '2720230310450935');
INSERT INTO public.driver VALUES (115, '4574485291181');
INSERT INTO public.driver VALUES (116, '4456029061124');


--
-- TOC entry 3692 (class 0 OID 730863)
-- Dependencies: 223
-- Data for Name: driver_company_transaction; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public.driver_company_transaction VALUES (5, 100);
INSERT INTO public.driver_company_transaction VALUES (9, 112);
INSERT INTO public.driver_company_transaction VALUES (13, 101);
INSERT INTO public.driver_company_transaction VALUES (37, 95);
INSERT INTO public.driver_company_transaction VALUES (44, 112);
INSERT INTO public.driver_company_transaction VALUES (75, 107);
INSERT INTO public.driver_company_transaction VALUES (85, 99);
INSERT INTO public.driver_company_transaction VALUES (94, 110);
INSERT INTO public.driver_company_transaction VALUES (98, 105);
INSERT INTO public.driver_company_transaction VALUES (109, 108);
INSERT INTO public.driver_company_transaction VALUES (115, 95);
INSERT INTO public.driver_company_transaction VALUES (121, 91);
INSERT INTO public.driver_company_transaction VALUES (128, 88);
INSERT INTO public.driver_company_transaction VALUES (131, 87);
INSERT INTO public.driver_company_transaction VALUES (138, 116);
INSERT INTO public.driver_company_transaction VALUES (140, 113);
INSERT INTO public.driver_company_transaction VALUES (146, 113);
INSERT INTO public.driver_company_transaction VALUES (149, 95);
INSERT INTO public.driver_company_transaction VALUES (151, 102);
INSERT INTO public.driver_company_transaction VALUES (182, 90);
INSERT INTO public.driver_company_transaction VALUES (200, 116);
INSERT INTO public.driver_company_transaction VALUES (210, 116);
INSERT INTO public.driver_company_transaction VALUES (216, 96);


--
-- TOC entry 3687 (class 0 OID 730805)
-- Dependencies: 218
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public."order" VALUES (1, 22, 102, 'Potato', 8.00, '2022-10-30 13:03:12.507735');
INSERT INTO public."order" VALUES (2, 73, 95, 'Potato', 6.80, '2023-01-04 21:54:12.509479');
INSERT INTO public."order" VALUES (3, 24, 91, 'Potato', 7.10, '2023-01-28 01:09:12.51012');
INSERT INTO public."order" VALUES (4, 37, 99, 'Potato', 8.20, '2023-01-19 09:28:12.510766');
INSERT INTO public."order" VALUES (5, 42, 115, 'Potato', 7.00, '2023-01-14 06:10:12.511294');
INSERT INTO public."order" VALUES (6, 84, 110, 'Potato', 5.30, '2022-11-26 16:05:12.511862');
INSERT INTO public."order" VALUES (7, 35, 116, 'Potato', 5.70, '2022-11-16 15:28:12.51242');
INSERT INTO public."order" VALUES (8, 23, 93, 'Potato', 8.20, '2023-01-24 12:29:12.512969');
INSERT INTO public."order" VALUES (9, 31, 88, 'Potato', 6.80, '2022-12-27 20:35:12.513782');
INSERT INTO public."order" VALUES (10, 33, 90, 'Potato', 5.00, '2022-08-24 03:39:12.515827');
INSERT INTO public."order" VALUES (11, 43, 87, 'Potato', 9.30, '2022-11-28 22:41:12.517575');
INSERT INTO public."order" VALUES (12, 49, 103, 'Potato', 6.90, '2023-01-17 22:56:12.519399');
INSERT INTO public."order" VALUES (13, 47, 88, 'Potato', 8.80, '2022-10-16 07:33:12.521712');
INSERT INTO public."order" VALUES (14, 44, 108, 'Potato', 8.00, '2022-09-15 08:10:12.52344');
INSERT INTO public."order" VALUES (15, 73, 116, 'Potato', 8.10, '2023-01-01 01:00:12.524444');
INSERT INTO public."order" VALUES (16, 30, 99, 'Potato', 6.30, '2023-01-11 11:14:12.525043');
INSERT INTO public."order" VALUES (17, 32, 113, 'Potato', 7.80, '2022-12-11 19:50:12.525581');
INSERT INTO public."order" VALUES (18, 59, 90, 'Potato', 8.00, '2022-10-09 00:50:12.526058');
INSERT INTO public."order" VALUES (19, 47, 95, 'Potato', 9.80, '2022-09-27 05:46:12.526583');
INSERT INTO public."order" VALUES (20, 86, 98, 'Potato', 6.50, '2023-01-29 02:14:12.527021');
INSERT INTO public."order" VALUES (21, 26, 112, 'Potato', 5.00, '2022-10-26 00:44:12.527442');
INSERT INTO public."order" VALUES (22, 48, 100, 'Potato', 6.70, '2022-12-08 21:45:12.52822');
INSERT INTO public."order" VALUES (23, 33, 94, 'Potato', 9.50, '2022-12-24 19:12:12.528632');
INSERT INTO public."order" VALUES (24, 55, 115, 'Potato', 9.20, '2022-11-02 04:19:12.529049');
INSERT INTO public."order" VALUES (25, 82, 90, 'Potato', 9.10, '2023-01-06 00:27:12.529461');
INSERT INTO public."order" VALUES (26, 55, 108, 'Potato', 5.10, '2022-08-12 14:02:12.52988');
INSERT INTO public."order" VALUES (27, 49, 94, 'Potato', 5.60, '2022-09-26 05:13:12.530287');
INSERT INTO public."order" VALUES (28, 45, 114, 'Potato', 7.90, '2023-01-07 14:38:12.530694');
INSERT INTO public."order" VALUES (29, 46, 115, 'Potato', 7.30, '2022-11-01 22:54:12.531103');
INSERT INTO public."order" VALUES (30, 33, 110, 'Potato', 5.80, '2023-01-14 21:27:12.531516');
INSERT INTO public."order" VALUES (31, 45, 106, 'Potato', 6.20, '2022-12-12 10:31:12.532038');
INSERT INTO public."order" VALUES (32, 79, 111, 'Potato', 9.40, '2022-08-14 20:42:12.532577');
INSERT INTO public."order" VALUES (33, 51, 112, 'Potato', 5.80, '2022-12-06 05:42:12.533091');
INSERT INTO public."order" VALUES (34, 32, 94, 'Potato', 5.20, '2022-08-28 15:20:12.533694');
INSERT INTO public."order" VALUES (35, 52, 110, 'Potato', 5.40, '2022-11-24 06:48:12.534237');
INSERT INTO public."order" VALUES (36, 53, 90, 'Potato', 9.30, '2022-10-15 20:43:12.534768');
INSERT INTO public."order" VALUES (37, 80, 114, 'Potato', 5.50, '2022-08-31 13:54:12.535319');
INSERT INTO public."order" VALUES (38, 36, 92, 'Potato', 5.70, '2022-08-30 10:26:12.535932');
INSERT INTO public."order" VALUES (39, 31, 107, 'Potato', 9.00, '2022-09-17 04:14:12.536517');
INSERT INTO public."order" VALUES (40, 83, 102, 'Potato', 7.50, '2023-02-04 08:11:12.537071');
INSERT INTO public."order" VALUES (41, 39, 93, 'Potato', 9.10, '2022-12-28 16:29:12.537576');
INSERT INTO public."order" VALUES (42, 85, 89, 'Potato', 7.50, '2022-11-17 21:24:12.538082');
INSERT INTO public."order" VALUES (43, 57, 96, 'Potato', 6.80, '2023-01-17 08:25:12.538532');
INSERT INTO public."order" VALUES (44, 71, 95, 'Potato', 9.50, '2022-10-04 13:29:12.53895');
INSERT INTO public."order" VALUES (45, 34, 113, 'Potato', 9.60, '2022-12-01 23:08:12.53937');
INSERT INTO public."order" VALUES (46, 59, 90, 'Potato', 10.00, '2022-11-23 08:31:12.539842');
INSERT INTO public."order" VALUES (47, 52, 90, 'Potato', 7.60, '2023-01-02 04:55:12.5403');
INSERT INTO public."order" VALUES (48, 28, 107, 'Potato', 7.60, '2022-09-18 01:38:12.54076');
INSERT INTO public."order" VALUES (49, 38, 102, 'Potato', 5.30, '2022-08-24 16:40:12.541282');
INSERT INTO public."order" VALUES (50, 58, 116, 'Potato', 8.30, '2022-09-09 18:49:12.541726');
INSERT INTO public."order" VALUES (51, 43, 90, 'Potato', 6.00, '2022-12-16 20:31:12.542179');
INSERT INTO public."order" VALUES (52, 21, 93, 'Potato', 9.70, '2022-10-31 00:02:12.542646');
INSERT INTO public."order" VALUES (53, 27, 108, 'Potato', 6.50, '2023-02-05 03:07:12.543104');
INSERT INTO public."order" VALUES (54, 44, 103, 'Potato', 9.00, '2022-09-20 04:24:12.543526');
INSERT INTO public."order" VALUES (55, 42, 88, 'Potato', 5.90, '2022-12-04 17:01:12.543931');
INSERT INTO public."order" VALUES (56, 30, 102, 'Potato', 9.50, '2022-08-31 00:02:12.544335');
INSERT INTO public."order" VALUES (57, 49, 96, 'Potato', 5.00, '2022-12-10 18:15:12.54474');
INSERT INTO public."order" VALUES (58, 65, 105, 'Potato', 8.60, '2022-11-11 18:31:12.545147');
INSERT INTO public."order" VALUES (59, 66, 101, 'Potato', 7.10, '2022-12-29 15:56:12.545553');
INSERT INTO public."order" VALUES (60, 84, 89, 'Potato', 8.80, '2022-09-22 04:44:12.545957');
INSERT INTO public."order" VALUES (61, 76, 104, 'Potato', 7.30, '2022-10-06 07:22:12.546363');
INSERT INTO public."order" VALUES (62, 47, 113, 'Potato', 8.70, '2022-10-03 19:37:12.546761');
INSERT INTO public."order" VALUES (63, 26, 113, 'Potato', 8.80, '2022-10-01 11:48:12.547235');
INSERT INTO public."order" VALUES (64, 27, 106, 'Potato', 6.80, '2023-01-11 06:21:12.547702');
INSERT INTO public."order" VALUES (65, 28, 98, 'Potato', 8.30, '2022-11-17 20:43:12.548063');
INSERT INTO public."order" VALUES (66, 30, 97, 'Potato', 5.50, '2022-10-20 02:10:12.548412');
INSERT INTO public."order" VALUES (67, 71, 89, 'Potato', 7.70, '2022-10-04 06:23:12.548757');
INSERT INTO public."order" VALUES (68, 46, 89, 'Potato', 7.40, '2022-11-27 23:10:12.549107');
INSERT INTO public."order" VALUES (69, 17, 111, 'Potato', 9.60, '2022-08-20 01:50:12.549449');
INSERT INTO public."order" VALUES (70, 50, 94, 'Potato', 6.60, '2023-01-04 18:47:12.549915');
INSERT INTO public."order" VALUES (71, 42, 90, 'Potato', 5.60, '2022-09-01 13:56:12.550487');
INSERT INTO public."order" VALUES (72, 28, 112, 'Potato', 6.70, '2022-09-19 18:11:12.550983');
INSERT INTO public."order" VALUES (73, 41, 102, 'Potato', 9.70, '2022-09-30 07:06:12.551286');
INSERT INTO public."order" VALUES (74, 17, 114, 'Potato', 8.80, '2022-09-28 07:48:12.551861');
INSERT INTO public."order" VALUES (75, 25, 96, 'Potato', 6.50, '2023-02-04 00:30:12.552164');
INSERT INTO public."order" VALUES (76, 47, 91, 'Potato', 9.00, '2022-10-04 02:51:12.552479');
INSERT INTO public."order" VALUES (77, 69, 115, 'Potato', 9.10, '2022-10-24 02:42:12.55286');
INSERT INTO public."order" VALUES (78, 69, 115, 'Potato', 7.00, '2022-09-12 20:54:12.553242');
INSERT INTO public."order" VALUES (79, 66, 116, 'Potato', 7.90, '2023-01-23 10:19:12.553702');
INSERT INTO public."order" VALUES (80, 37, 92, 'Potato', 6.20, '2022-12-03 06:40:12.554059');
INSERT INTO public."order" VALUES (81, 38, 112, 'Potato', 8.50, '2023-01-15 09:20:12.554415');
INSERT INTO public."order" VALUES (82, 83, 99, 'Potato', 8.10, '2022-10-28 13:38:12.554709');
INSERT INTO public."order" VALUES (83, 50, 101, 'Potato', 7.70, '2023-01-25 06:49:12.555039');
INSERT INTO public."order" VALUES (84, 29, 105, 'Potato', 5.30, '2023-01-28 15:01:12.555289');
INSERT INTO public."order" VALUES (85, 84, 112, 'Potato', 9.00, '2022-11-30 13:40:12.555538');
INSERT INTO public."order" VALUES (86, 70, 97, 'Potato', 9.80, '2022-12-10 22:05:12.555787');
INSERT INTO public."order" VALUES (87, 22, 87, 'Potato', 9.90, '2022-10-08 11:27:12.556059');
INSERT INTO public."order" VALUES (88, 73, 96, 'Potato', 8.10, '2023-01-16 17:10:12.556297');
INSERT INTO public."order" VALUES (89, 39, 107, 'Potato', 8.80, '2023-02-01 12:45:12.556548');
INSERT INTO public."order" VALUES (90, 51, 96, 'Potato', 5.80, '2022-11-16 20:58:12.556786');
INSERT INTO public."order" VALUES (91, 67, 105, 'Potato', 9.00, '2023-01-05 04:29:12.557039');
INSERT INTO public."order" VALUES (92, 68, 89, 'Potato', 5.10, '2022-10-07 23:14:12.55731');
INSERT INTO public."order" VALUES (93, 56, 99, 'Potato', 5.70, '2023-01-15 19:15:12.557552');
INSERT INTO public."order" VALUES (94, 84, 114, 'Potato', 9.80, '2022-11-08 00:03:12.55812');
INSERT INTO public."order" VALUES (95, 19, 95, 'Potato', 5.40, '2022-12-20 02:38:12.558383');
INSERT INTO public."order" VALUES (96, 76, 94, 'Potato', 7.60, '2023-01-03 17:40:12.55863');
INSERT INTO public."order" VALUES (97, 52, 110, 'Potato', 7.60, '2022-09-24 09:11:12.558877');
INSERT INTO public."order" VALUES (98, 19, 97, 'Potato', 9.70, '2022-11-21 03:40:12.559126');
INSERT INTO public."order" VALUES (99, 60, 105, 'Potato', 9.30, '2023-01-26 17:57:12.559369');
INSERT INTO public."order" VALUES (100, 28, 107, 'Potato', 6.40, '2023-01-22 23:40:12.559608');
INSERT INTO public."order" VALUES (101, 58, 96, 'Potato', 8.80, '2022-12-13 23:30:12.559856');
INSERT INTO public."order" VALUES (102, 42, 87, 'Potato', 9.50, '2022-10-24 18:09:12.5601');
INSERT INTO public."order" VALUES (103, 59, 114, 'Potato', 6.60, '2022-10-21 11:23:12.560333');
INSERT INTO public."order" VALUES (104, 57, 96, 'Potato', 7.10, '2022-11-24 18:15:12.560571');
INSERT INTO public."order" VALUES (105, 58, 104, 'Potato', 5.20, '2022-09-12 11:14:12.560808');
INSERT INTO public."order" VALUES (106, 40, 88, 'Potato', 8.50, '2022-09-07 11:14:12.561049');
INSERT INTO public."order" VALUES (107, 84, 93, 'Potato', 6.20, '2022-12-09 17:29:12.561289');
INSERT INTO public."order" VALUES (108, 20, 104, 'Potato', 5.00, '2022-10-01 07:56:12.561531');
INSERT INTO public."order" VALUES (109, 82, 87, 'Potato', 6.80, '2022-10-12 00:17:12.561891');
INSERT INTO public."order" VALUES (110, 59, 114, 'Potato', 5.90, '2023-01-09 11:04:12.562144');
INSERT INTO public."order" VALUES (111, 74, 110, 'Potato', 9.50, '2022-12-16 12:48:12.562403');
INSERT INTO public."order" VALUES (112, 36, 109, 'Potato', 5.00, '2022-12-16 09:15:12.562664');
INSERT INTO public."order" VALUES (113, 58, 106, 'Potato', 5.60, '2022-10-01 12:48:12.562917');
INSERT INTO public."order" VALUES (114, 75, 104, 'Potato', 7.20, '2022-08-14 06:43:12.563162');
INSERT INTO public."order" VALUES (115, 26, 90, 'Potato', 9.30, '2022-12-26 02:29:12.5634');
INSERT INTO public."order" VALUES (116, 52, 95, 'Potato', 6.40, '2022-11-09 18:05:12.563639');
INSERT INTO public."order" VALUES (117, 30, 94, 'Potato', 8.40, '2022-08-25 20:20:12.563874');
INSERT INTO public."order" VALUES (118, 21, 103, 'Potato', 7.80, '2022-08-11 05:46:12.564108');
INSERT INTO public."order" VALUES (119, 51, 111, 'Potato', 6.10, '2022-12-16 15:50:12.56434');
INSERT INTO public."order" VALUES (120, 59, 99, 'Potato', 5.70, '2022-11-08 22:27:12.56458');
INSERT INTO public."order" VALUES (121, 42, 98, 'Potato', 9.10, '2022-11-08 20:12:12.564834');
INSERT INTO public."order" VALUES (122, 44, 94, 'Potato', 5.30, '2022-10-18 00:24:12.565075');
INSERT INTO public."order" VALUES (123, 46, 110, 'Potato', 6.10, '2022-09-01 03:34:12.565314');
INSERT INTO public."order" VALUES (124, 83, 107, 'Potato', 8.40, '2022-11-06 06:09:12.565804');
INSERT INTO public."order" VALUES (125, 45, 116, 'Potato', 6.50, '2022-12-28 01:10:12.566051');
INSERT INTO public."order" VALUES (126, 27, 116, 'Potato', 9.40, '2022-12-04 21:55:12.566357');
INSERT INTO public."order" VALUES (127, 68, 101, 'Potato', 7.70, '2022-09-29 01:52:12.566597');
INSERT INTO public."order" VALUES (128, 45, 105, 'Potato', 9.00, '2022-09-05 17:43:12.566845');
INSERT INTO public."order" VALUES (129, 24, 104, 'Potato', 7.40, '2022-08-16 02:29:12.567084');


--
-- TOC entry 3688 (class 0 OID 730821)
-- Dependencies: 219
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public.order_item VALUES (1, 37, 1, 57.10);
INSERT INTO public.order_item VALUES (1, 52, 1, 26.60);
INSERT INTO public.order_item VALUES (1, 14, 5, 79.90);
INSERT INTO public.order_item VALUES (1, 110, 4, 18.70);
INSERT INTO public.order_item VALUES (1, 13, 5, 12.50);
INSERT INTO public.order_item VALUES (2, 91, 5, 21.00);
INSERT INTO public.order_item VALUES (3, 95, 3, 80.20);
INSERT INTO public.order_item VALUES (3, 67, 5, 80.20);
INSERT INTO public.order_item VALUES (3, 4, 1, 16.20);
INSERT INTO public.order_item VALUES (4, 108, 5, 0.80);
INSERT INTO public.order_item VALUES (4, 5, 5, 47.60);
INSERT INTO public.order_item VALUES (5, 91, 5, 21.00);
INSERT INTO public.order_item VALUES (5, 104, 3, 52.30);
INSERT INTO public.order_item VALUES (5, 28, 5, 74.70);
INSERT INTO public.order_item VALUES (6, 31, 1, 0.40);
INSERT INTO public.order_item VALUES (6, 78, 4, 1.40);
INSERT INTO public.order_item VALUES (6, 60, 3, 59.60);
INSERT INTO public.order_item VALUES (6, 82, 2, 75.30);
INSERT INTO public.order_item VALUES (7, 11, 1, 73.20);
INSERT INTO public.order_item VALUES (7, 82, 4, 75.30);
INSERT INTO public.order_item VALUES (7, 70, 3, 3.80);
INSERT INTO public.order_item VALUES (8, 48, 4, 66.70);
INSERT INTO public.order_item VALUES (8, 58, 3, 98.70);
INSERT INTO public.order_item VALUES (8, 6, 2, 5.50);
INSERT INTO public.order_item VALUES (8, 86, 5, 18.30);
INSERT INTO public.order_item VALUES (8, 33, 4, 17.60);
INSERT INTO public.order_item VALUES (9, 89, 3, 25.60);
INSERT INTO public.order_item VALUES (9, 38, 5, 0.70);
INSERT INTO public.order_item VALUES (9, 54, 4, 99.20);
INSERT INTO public.order_item VALUES (9, 27, 1, 84.40);
INSERT INTO public.order_item VALUES (10, 113, 3, 1.30);
INSERT INTO public.order_item VALUES (10, 31, 5, 0.40);
INSERT INTO public.order_item VALUES (10, 111, 4, 48.50);
INSERT INTO public.order_item VALUES (10, 85, 2, 64.70);
INSERT INTO public.order_item VALUES (10, 58, 4, 98.70);
INSERT INTO public.order_item VALUES (11, 101, 4, 61.70);
INSERT INTO public.order_item VALUES (12, 62, 2, 10.20);
INSERT INTO public.order_item VALUES (12, 59, 3, 72.80);
INSERT INTO public.order_item VALUES (12, 6, 2, 5.50);
INSERT INTO public.order_item VALUES (13, 107, 2, 67.20);
INSERT INTO public.order_item VALUES (13, 115, 3, 69.30);
INSERT INTO public.order_item VALUES (13, 113, 2, 1.30);
INSERT INTO public.order_item VALUES (14, 95, 3, 80.20);
INSERT INTO public.order_item VALUES (15, 46, 4, 60.60);
INSERT INTO public.order_item VALUES (15, 29, 4, 13.80);
INSERT INTO public.order_item VALUES (15, 111, 4, 48.50);
INSERT INTO public.order_item VALUES (15, 76, 3, 67.60);
INSERT INTO public.order_item VALUES (15, 68, 3, 92.10);
INSERT INTO public.order_item VALUES (16, 65, 3, 39.20);
INSERT INTO public.order_item VALUES (16, 99, 2, 97.40);
INSERT INTO public.order_item VALUES (16, 35, 4, 96.40);
INSERT INTO public.order_item VALUES (16, 18, 2, 77.30);
INSERT INTO public.order_item VALUES (17, 39, 1, 28.00);
INSERT INTO public.order_item VALUES (17, 86, 1, 18.30);
INSERT INTO public.order_item VALUES (17, 68, 4, 92.10);
INSERT INTO public.order_item VALUES (17, 27, 1, 84.40);
INSERT INTO public.order_item VALUES (17, 48, 3, 66.70);
INSERT INTO public.order_item VALUES (18, 55, 3, 77.50);
INSERT INTO public.order_item VALUES (18, 11, 4, 73.20);
INSERT INTO public.order_item VALUES (18, 114, 3, 62.70);
INSERT INTO public.order_item VALUES (18, 92, 4, 53.80);
INSERT INTO public.order_item VALUES (19, 109, 5, 86.10);
INSERT INTO public.order_item VALUES (19, 114, 3, 62.70);
INSERT INTO public.order_item VALUES (20, 27, 4, 84.40);
INSERT INTO public.order_item VALUES (20, 90, 5, 74.40);
INSERT INTO public.order_item VALUES (20, 109, 3, 86.10);
INSERT INTO public.order_item VALUES (20, 62, 4, 10.20);
INSERT INTO public.order_item VALUES (20, 108, 1, 0.80);
INSERT INTO public.order_item VALUES (21, 70, 3, 3.80);
INSERT INTO public.order_item VALUES (21, 72, 1, 61.70);
INSERT INTO public.order_item VALUES (22, 52, 5, 26.60);
INSERT INTO public.order_item VALUES (23, 10, 5, 31.50);
INSERT INTO public.order_item VALUES (24, 97, 4, 75.40);
INSERT INTO public.order_item VALUES (24, 25, 5, 65.50);
INSERT INTO public.order_item VALUES (24, 78, 1, 1.40);
INSERT INTO public.order_item VALUES (25, 22, 5, 89.20);
INSERT INTO public.order_item VALUES (25, 96, 4, 6.80);
INSERT INTO public.order_item VALUES (26, 101, 2, 61.70);
INSERT INTO public.order_item VALUES (26, 48, 1, 66.70);
INSERT INTO public.order_item VALUES (26, 105, 5, 99.00);
INSERT INTO public.order_item VALUES (26, 74, 2, 26.80);
INSERT INTO public.order_item VALUES (26, 11, 3, 73.20);
INSERT INTO public.order_item VALUES (27, 94, 3, 67.90);
INSERT INTO public.order_item VALUES (27, 115, 5, 69.30);
INSERT INTO public.order_item VALUES (27, 7, 1, 5.70);
INSERT INTO public.order_item VALUES (28, 56, 5, 11.60);
INSERT INTO public.order_item VALUES (28, 83, 5, 82.40);
INSERT INTO public.order_item VALUES (28, 34, 2, 91.70);
INSERT INTO public.order_item VALUES (28, 114, 3, 62.70);
INSERT INTO public.order_item VALUES (29, 64, 5, 25.40);
INSERT INTO public.order_item VALUES (29, 77, 5, 15.60);
INSERT INTO public.order_item VALUES (30, 56, 5, 11.60);
INSERT INTO public.order_item VALUES (31, 32, 2, 32.20);
INSERT INTO public.order_item VALUES (31, 91, 2, 21.00);
INSERT INTO public.order_item VALUES (31, 105, 3, 99.00);
INSERT INTO public.order_item VALUES (31, 113, 4, 1.30);
INSERT INTO public.order_item VALUES (32, 4, 1, 16.20);
INSERT INTO public.order_item VALUES (32, 52, 4, 26.60);
INSERT INTO public.order_item VALUES (32, 29, 5, 13.80);
INSERT INTO public.order_item VALUES (32, 68, 4, 92.10);
INSERT INTO public.order_item VALUES (32, 107, 3, 67.20);
INSERT INTO public.order_item VALUES (33, 109, 5, 86.10);
INSERT INTO public.order_item VALUES (33, 23, 2, 66.90);
INSERT INTO public.order_item VALUES (33, 15, 3, 71.00);
INSERT INTO public.order_item VALUES (33, 74, 2, 26.80);
INSERT INTO public.order_item VALUES (33, 69, 3, 84.90);
INSERT INTO public.order_item VALUES (34, 29, 4, 13.80);
INSERT INTO public.order_item VALUES (34, 77, 5, 15.60);
INSERT INTO public.order_item VALUES (34, 4, 1, 16.20);
INSERT INTO public.order_item VALUES (34, 58, 3, 98.70);
INSERT INTO public.order_item VALUES (35, 22, 2, 89.20);
INSERT INTO public.order_item VALUES (36, 78, 4, 1.40);
INSERT INTO public.order_item VALUES (36, 23, 1, 66.90);
INSERT INTO public.order_item VALUES (37, 86, 4, 18.30);
INSERT INTO public.order_item VALUES (37, 93, 5, 78.30);
INSERT INTO public.order_item VALUES (37, 45, 2, 91.90);
INSERT INTO public.order_item VALUES (37, 88, 1, 91.70);
INSERT INTO public.order_item VALUES (38, 115, 4, 69.30);
INSERT INTO public.order_item VALUES (38, 50, 4, 80.30);
INSERT INTO public.order_item VALUES (39, 62, 1, 10.20);
INSERT INTO public.order_item VALUES (39, 36, 2, 11.30);
INSERT INTO public.order_item VALUES (39, 53, 3, 64.80);
INSERT INTO public.order_item VALUES (39, 100, 5, 62.60);
INSERT INTO public.order_item VALUES (39, 55, 3, 77.50);
INSERT INTO public.order_item VALUES (40, 72, 4, 61.70);
INSERT INTO public.order_item VALUES (41, 96, 4, 6.80);
INSERT INTO public.order_item VALUES (41, 61, 3, 97.30);
INSERT INTO public.order_item VALUES (42, 70, 1, 3.80);
INSERT INTO public.order_item VALUES (43, 83, 2, 82.40);
INSERT INTO public.order_item VALUES (43, 95, 4, 80.20);
INSERT INTO public.order_item VALUES (44, 112, 1, 96.30);
INSERT INTO public.order_item VALUES (45, 59, 3, 72.80);
INSERT INTO public.order_item VALUES (45, 11, 3, 73.20);
INSERT INTO public.order_item VALUES (45, 47, 5, 80.40);
INSERT INTO public.order_item VALUES (45, 106, 2, 45.80);
INSERT INTO public.order_item VALUES (46, 82, 4, 75.30);
INSERT INTO public.order_item VALUES (46, 44, 2, 43.70);
INSERT INTO public.order_item VALUES (46, 83, 4, 82.40);
INSERT INTO public.order_item VALUES (47, 14, 2, 79.90);
INSERT INTO public.order_item VALUES (48, 29, 1, 13.80);
INSERT INTO public.order_item VALUES (48, 100, 3, 62.60);
INSERT INTO public.order_item VALUES (48, 17, 2, 96.10);
INSERT INTO public.order_item VALUES (49, 81, 2, 56.80);
INSERT INTO public.order_item VALUES (50, 7, 1, 5.70);
INSERT INTO public.order_item VALUES (50, 104, 1, 52.30);
INSERT INTO public.order_item VALUES (50, 97, 3, 75.40);
INSERT INTO public.order_item VALUES (50, 6, 5, 5.50);
INSERT INTO public.order_item VALUES (50, 23, 4, 66.90);
INSERT INTO public.order_item VALUES (51, 69, 1, 84.90);
INSERT INTO public.order_item VALUES (52, 25, 5, 65.50);
INSERT INTO public.order_item VALUES (52, 113, 1, 1.30);
INSERT INTO public.order_item VALUES (53, 116, 1, 40.40);
INSERT INTO public.order_item VALUES (53, 43, 1, 60.20);
INSERT INTO public.order_item VALUES (53, 63, 4, 0.40);
INSERT INTO public.order_item VALUES (53, 51, 4, 62.30);
INSERT INTO public.order_item VALUES (53, 104, 1, 52.30);
INSERT INTO public.order_item VALUES (54, 103, 1, 28.10);
INSERT INTO public.order_item VALUES (55, 95, 4, 80.20);
INSERT INTO public.order_item VALUES (55, 10, 1, 31.50);
INSERT INTO public.order_item VALUES (55, 86, 4, 18.30);
INSERT INTO public.order_item VALUES (55, 47, 5, 80.40);
INSERT INTO public.order_item VALUES (55, 31, 5, 0.40);
INSERT INTO public.order_item VALUES (56, 107, 5, 67.20);
INSERT INTO public.order_item VALUES (56, 4, 2, 16.20);
INSERT INTO public.order_item VALUES (56, 56, 3, 11.60);
INSERT INTO public.order_item VALUES (56, 35, 1, 96.40);
INSERT INTO public.order_item VALUES (56, 28, 4, 74.70);
INSERT INTO public.order_item VALUES (57, 3, 3, 27.00);
INSERT INTO public.order_item VALUES (58, 8, 5, 83.90);
INSERT INTO public.order_item VALUES (58, 99, 2, 97.40);
INSERT INTO public.order_item VALUES (58, 108, 2, 0.80);
INSERT INTO public.order_item VALUES (59, 55, 2, 77.50);
INSERT INTO public.order_item VALUES (59, 109, 3, 86.10);
INSERT INTO public.order_item VALUES (59, 51, 1, 62.30);
INSERT INTO public.order_item VALUES (59, 97, 2, 75.40);
INSERT INTO public.order_item VALUES (59, 56, 1, 11.60);
INSERT INTO public.order_item VALUES (60, 58, 4, 98.70);
INSERT INTO public.order_item VALUES (61, 71, 4, 64.40);
INSERT INTO public.order_item VALUES (62, 50, 3, 80.30);
INSERT INTO public.order_item VALUES (62, 85, 1, 64.70);
INSERT INTO public.order_item VALUES (62, 8, 1, 83.90);
INSERT INTO public.order_item VALUES (63, 54, 5, 99.20);
INSERT INTO public.order_item VALUES (64, 11, 5, 73.20);
INSERT INTO public.order_item VALUES (65, 27, 2, 84.40);
INSERT INTO public.order_item VALUES (66, 12, 3, 19.20);
INSERT INTO public.order_item VALUES (67, 108, 5, 0.80);
INSERT INTO public.order_item VALUES (68, 12, 2, 19.20);
INSERT INTO public.order_item VALUES (68, 56, 3, 11.60);
INSERT INTO public.order_item VALUES (69, 74, 3, 26.80);
INSERT INTO public.order_item VALUES (69, 2, 3, 19.90);
INSERT INTO public.order_item VALUES (70, 64, 5, 25.40);
INSERT INTO public.order_item VALUES (70, 50, 3, 80.30);
INSERT INTO public.order_item VALUES (71, 45, 5, 91.90);
INSERT INTO public.order_item VALUES (72, 44, 4, 43.70);
INSERT INTO public.order_item VALUES (72, 59, 2, 72.80);
INSERT INTO public.order_item VALUES (72, 94, 4, 67.90);
INSERT INTO public.order_item VALUES (72, 102, 1, 87.50);
INSERT INTO public.order_item VALUES (72, 79, 4, 63.10);
INSERT INTO public.order_item VALUES (73, 104, 5, 52.30);
INSERT INTO public.order_item VALUES (73, 1, 3, 5.10);
INSERT INTO public.order_item VALUES (73, 20, 5, 3.10);
INSERT INTO public.order_item VALUES (73, 8, 4, 83.90);
INSERT INTO public.order_item VALUES (74, 75, 5, 97.20);
INSERT INTO public.order_item VALUES (75, 34, 4, 91.70);
INSERT INTO public.order_item VALUES (75, 32, 1, 32.20);
INSERT INTO public.order_item VALUES (75, 53, 2, 64.80);
INSERT INTO public.order_item VALUES (75, 49, 5, 25.80);
INSERT INTO public.order_item VALUES (76, 71, 1, 64.40);
INSERT INTO public.order_item VALUES (76, 30, 4, 10.50);
INSERT INTO public.order_item VALUES (76, 3, 5, 27.00);
INSERT INTO public.order_item VALUES (76, 84, 2, 92.90);
INSERT INTO public.order_item VALUES (76, 2, 5, 19.90);
INSERT INTO public.order_item VALUES (77, 59, 2, 72.80);
INSERT INTO public.order_item VALUES (77, 69, 5, 84.90);
INSERT INTO public.order_item VALUES (77, 112, 5, 96.30);
INSERT INTO public.order_item VALUES (78, 85, 4, 64.70);
INSERT INTO public.order_item VALUES (78, 90, 5, 74.40);
INSERT INTO public.order_item VALUES (79, 18, 2, 77.30);
INSERT INTO public.order_item VALUES (79, 58, 1, 98.70);
INSERT INTO public.order_item VALUES (79, 80, 3, 75.00);
INSERT INTO public.order_item VALUES (80, 61, 2, 97.30);
INSERT INTO public.order_item VALUES (80, 2, 2, 19.90);
INSERT INTO public.order_item VALUES (81, 19, 2, 36.00);
INSERT INTO public.order_item VALUES (81, 8, 4, 83.90);
INSERT INTO public.order_item VALUES (82, 92, 4, 53.80);
INSERT INTO public.order_item VALUES (82, 77, 5, 15.60);
INSERT INTO public.order_item VALUES (82, 94, 3, 67.90);
INSERT INTO public.order_item VALUES (82, 84, 3, 92.90);
INSERT INTO public.order_item VALUES (83, 11, 1, 73.20);
INSERT INTO public.order_item VALUES (83, 102, 1, 87.50);
INSERT INTO public.order_item VALUES (83, 50, 2, 80.30);
INSERT INTO public.order_item VALUES (83, 80, 2, 75.00);
INSERT INTO public.order_item VALUES (84, 77, 2, 15.60);
INSERT INTO public.order_item VALUES (84, 111, 4, 48.50);
INSERT INTO public.order_item VALUES (84, 22, 1, 89.20);
INSERT INTO public.order_item VALUES (85, 44, 5, 43.70);
INSERT INTO public.order_item VALUES (85, 97, 3, 75.40);
INSERT INTO public.order_item VALUES (85, 16, 4, 36.60);
INSERT INTO public.order_item VALUES (85, 42, 3, 92.30);
INSERT INTO public.order_item VALUES (85, 82, 3, 75.30);
INSERT INTO public.order_item VALUES (86, 23, 5, 66.90);
INSERT INTO public.order_item VALUES (86, 77, 5, 15.60);
INSERT INTO public.order_item VALUES (87, 23, 3, 66.90);
INSERT INTO public.order_item VALUES (87, 30, 2, 10.50);
INSERT INTO public.order_item VALUES (87, 39, 2, 28.00);
INSERT INTO public.order_item VALUES (87, 77, 5, 15.60);
INSERT INTO public.order_item VALUES (87, 103, 3, 28.10);
INSERT INTO public.order_item VALUES (88, 35, 1, 96.40);
INSERT INTO public.order_item VALUES (89, 69, 5, 84.90);
INSERT INTO public.order_item VALUES (89, 53, 4, 64.80);
INSERT INTO public.order_item VALUES (89, 16, 2, 36.60);
INSERT INTO public.order_item VALUES (89, 95, 3, 80.20);
INSERT INTO public.order_item VALUES (89, 102, 1, 87.50);
INSERT INTO public.order_item VALUES (90, 51, 2, 62.30);
INSERT INTO public.order_item VALUES (90, 53, 3, 64.80);
INSERT INTO public.order_item VALUES (90, 74, 5, 26.80);
INSERT INTO public.order_item VALUES (90, 114, 2, 62.70);
INSERT INTO public.order_item VALUES (90, 12, 2, 19.20);
INSERT INTO public.order_item VALUES (91, 11, 3, 73.20);
INSERT INTO public.order_item VALUES (91, 69, 3, 84.90);
INSERT INTO public.order_item VALUES (92, 38, 5, 0.70);
INSERT INTO public.order_item VALUES (92, 57, 5, 80.10);
INSERT INTO public.order_item VALUES (92, 55, 4, 77.50);
INSERT INTO public.order_item VALUES (92, 53, 2, 64.80);
INSERT INTO public.order_item VALUES (92, 8, 3, 83.90);
INSERT INTO public.order_item VALUES (93, 116, 5, 40.40);
INSERT INTO public.order_item VALUES (93, 43, 3, 60.20);
INSERT INTO public.order_item VALUES (93, 33, 5, 17.60);
INSERT INTO public.order_item VALUES (93, 30, 4, 10.50);
INSERT INTO public.order_item VALUES (93, 105, 5, 99.00);
INSERT INTO public.order_item VALUES (94, 81, 5, 56.80);
INSERT INTO public.order_item VALUES (94, 28, 2, 74.70);
INSERT INTO public.order_item VALUES (94, 32, 4, 32.20);
INSERT INTO public.order_item VALUES (95, 54, 3, 99.20);
INSERT INTO public.order_item VALUES (95, 28, 1, 74.70);
INSERT INTO public.order_item VALUES (96, 37, 4, 57.10);
INSERT INTO public.order_item VALUES (96, 33, 2, 17.60);
INSERT INTO public.order_item VALUES (96, 47, 3, 80.40);
INSERT INTO public.order_item VALUES (97, 35, 5, 96.40);
INSERT INTO public.order_item VALUES (97, 113, 1, 1.30);
INSERT INTO public.order_item VALUES (97, 92, 1, 53.80);
INSERT INTO public.order_item VALUES (97, 115, 1, 69.30);
INSERT INTO public.order_item VALUES (98, 113, 5, 1.30);
INSERT INTO public.order_item VALUES (98, 23, 3, 66.90);
INSERT INTO public.order_item VALUES (98, 64, 3, 25.40);
INSERT INTO public.order_item VALUES (98, 57, 1, 80.10);
INSERT INTO public.order_item VALUES (98, 84, 1, 92.90);
INSERT INTO public.order_item VALUES (99, 16, 5, 36.60);
INSERT INTO public.order_item VALUES (99, 17, 4, 96.10);
INSERT INTO public.order_item VALUES (99, 94, 5, 67.90);
INSERT INTO public.order_item VALUES (99, 4, 3, 16.20);
INSERT INTO public.order_item VALUES (99, 26, 3, 5.70);
INSERT INTO public.order_item VALUES (100, 112, 5, 96.30);
INSERT INTO public.order_item VALUES (100, 67, 5, 80.20);
INSERT INTO public.order_item VALUES (100, 35, 3, 96.40);
INSERT INTO public.order_item VALUES (100, 116, 2, 40.40);
INSERT INTO public.order_item VALUES (101, 102, 5, 87.50);
INSERT INTO public.order_item VALUES (101, 27, 3, 84.40);
INSERT INTO public.order_item VALUES (101, 94, 3, 67.90);
INSERT INTO public.order_item VALUES (102, 13, 5, 12.50);
INSERT INTO public.order_item VALUES (102, 19, 5, 36.00);
INSERT INTO public.order_item VALUES (103, 56, 2, 11.60);
INSERT INTO public.order_item VALUES (103, 111, 1, 48.50);
INSERT INTO public.order_item VALUES (103, 8, 3, 83.90);
INSERT INTO public.order_item VALUES (104, 72, 4, 61.70);
INSERT INTO public.order_item VALUES (105, 84, 5, 92.90);
INSERT INTO public.order_item VALUES (105, 110, 2, 18.70);
INSERT INTO public.order_item VALUES (105, 44, 3, 43.70);
INSERT INTO public.order_item VALUES (105, 97, 5, 75.40);
INSERT INTO public.order_item VALUES (106, 34, 5, 91.70);
INSERT INTO public.order_item VALUES (106, 68, 1, 92.10);
INSERT INTO public.order_item VALUES (106, 31, 5, 0.40);
INSERT INTO public.order_item VALUES (106, 80, 4, 75.00);
INSERT INTO public.order_item VALUES (106, 111, 5, 48.50);
INSERT INTO public.order_item VALUES (107, 98, 1, 50.00);
INSERT INTO public.order_item VALUES (107, 34, 4, 91.70);
INSERT INTO public.order_item VALUES (108, 94, 5, 67.90);
INSERT INTO public.order_item VALUES (108, 78, 1, 1.40);
INSERT INTO public.order_item VALUES (108, 100, 4, 62.60);
INSERT INTO public.order_item VALUES (108, 95, 4, 80.20);
INSERT INTO public.order_item VALUES (109, 26, 5, 5.70);
INSERT INTO public.order_item VALUES (109, 34, 3, 91.70);
INSERT INTO public.order_item VALUES (110, 76, 1, 67.60);
INSERT INTO public.order_item VALUES (110, 57, 2, 80.10);
INSERT INTO public.order_item VALUES (110, 108, 2, 0.80);
INSERT INTO public.order_item VALUES (110, 40, 5, 13.70);
INSERT INTO public.order_item VALUES (110, 10, 5, 31.50);
INSERT INTO public.order_item VALUES (111, 29, 2, 13.80);
INSERT INTO public.order_item VALUES (112, 57, 4, 80.10);
INSERT INTO public.order_item VALUES (112, 105, 1, 99.00);
INSERT INTO public.order_item VALUES (112, 85, 3, 64.70);
INSERT INTO public.order_item VALUES (112, 14, 4, 79.90);
INSERT INTO public.order_item VALUES (113, 18, 2, 77.30);
INSERT INTO public.order_item VALUES (114, 81, 5, 56.80);
INSERT INTO public.order_item VALUES (114, 69, 5, 84.90);
INSERT INTO public.order_item VALUES (114, 37, 4, 57.10);
INSERT INTO public.order_item VALUES (115, 54, 5, 99.20);
INSERT INTO public.order_item VALUES (116, 62, 2, 10.20);
INSERT INTO public.order_item VALUES (116, 109, 5, 86.10);
INSERT INTO public.order_item VALUES (116, 95, 5, 80.20);
INSERT INTO public.order_item VALUES (116, 45, 5, 91.90);
INSERT INTO public.order_item VALUES (117, 82, 1, 75.30);
INSERT INTO public.order_item VALUES (118, 46, 5, 60.60);
INSERT INTO public.order_item VALUES (118, 25, 4, 65.50);
INSERT INTO public.order_item VALUES (118, 21, 4, 80.80);
INSERT INTO public.order_item VALUES (118, 45, 3, 91.90);
INSERT INTO public.order_item VALUES (118, 55, 3, 77.50);
INSERT INTO public.order_item VALUES (119, 32, 2, 32.20);
INSERT INTO public.order_item VALUES (119, 96, 1, 6.80);
INSERT INTO public.order_item VALUES (119, 15, 1, 71.00);
INSERT INTO public.order_item VALUES (119, 58, 3, 98.70);
INSERT INTO public.order_item VALUES (120, 16, 4, 36.60);
INSERT INTO public.order_item VALUES (120, 74, 3, 26.80);
INSERT INTO public.order_item VALUES (121, 6, 5, 5.50);
INSERT INTO public.order_item VALUES (121, 63, 4, 0.40);
INSERT INTO public.order_item VALUES (122, 54, 2, 99.20);
INSERT INTO public.order_item VALUES (122, 38, 1, 0.70);
INSERT INTO public.order_item VALUES (122, 87, 1, 73.40);
INSERT INTO public.order_item VALUES (122, 31, 4, 0.40);
INSERT INTO public.order_item VALUES (122, 88, 2, 91.70);
INSERT INTO public.order_item VALUES (123, 73, 2, 7.40);
INSERT INTO public.order_item VALUES (123, 99, 2, 97.40);
INSERT INTO public.order_item VALUES (124, 55, 3, 77.50);
INSERT INTO public.order_item VALUES (124, 39, 5, 28.00);
INSERT INTO public.order_item VALUES (124, 33, 3, 17.60);
INSERT INTO public.order_item VALUES (124, 86, 2, 18.30);
INSERT INTO public.order_item VALUES (125, 106, 4, 45.80);
INSERT INTO public.order_item VALUES (126, 17, 5, 96.10);
INSERT INTO public.order_item VALUES (126, 66, 5, 17.80);
INSERT INTO public.order_item VALUES (126, 39, 4, 28.00);
INSERT INTO public.order_item VALUES (126, 20, 1, 3.10);
INSERT INTO public.order_item VALUES (126, 82, 1, 75.30);
INSERT INTO public.order_item VALUES (127, 78, 2, 1.40);
INSERT INTO public.order_item VALUES (128, 114, 3, 62.70);
INSERT INTO public.order_item VALUES (128, 89, 4, 25.60);
INSERT INTO public.order_item VALUES (128, 113, 2, 1.30);
INSERT INTO public.order_item VALUES (128, 29, 1, 13.80);
INSERT INTO public.order_item VALUES (128, 26, 4, 5.70);
INSERT INTO public.order_item VALUES (129, 47, 3, 80.40);
INSERT INTO public.order_item VALUES (129, 28, 1, 74.70);
INSERT INTO public.order_item VALUES (129, 116, 1, 40.40);


--
-- TOC entry 3685 (class 0 OID 730793)
-- Dependencies: 216
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public.product VALUES (1, 'Licensed Steel Hat', 5.10, 6);
INSERT INTO public.product VALUES (2, 'Tasty Pants', 19.90, 3);
INSERT INTO public.product VALUES (3, 'Awesome Metal Hat', 27.00, 2);
INSERT INTO public.product VALUES (4, 'Gently Used Shoes', 16.20, 5);
INSERT INTO public.product VALUES (5, 'Gorgeous Chicken', 47.60, 13);
INSERT INTO public.product VALUES (6, 'Intelligent Fresh Mouse', 5.50, 13);
INSERT INTO public.product VALUES (7, 'New Pants', 5.70, 14);
INSERT INTO public.product VALUES (8, 'Awesome Mouse', 83.90, 16);
INSERT INTO public.product VALUES (9, 'Rustic Chips', 40.40, 7);
INSERT INTO public.product VALUES (10, 'Unbranded Table', 31.50, 8);
INSERT INTO public.product VALUES (11, 'Handcrafted Rubber Keyboard', 73.20, 5);
INSERT INTO public.product VALUES (12, 'Frozen Table', 19.20, 7);
INSERT INTO public.product VALUES (13, 'New Metal Ball', 12.50, 13);
INSERT INTO public.product VALUES (14, 'Tasty Soap', 79.90, 8);
INSERT INTO public.product VALUES (15, 'Steel Car', 71.00, 14);
INSERT INTO public.product VALUES (16, 'Frozen Computer', 36.60, 4);
INSERT INTO public.product VALUES (17, 'Pizza', 96.10, 14);
INSERT INTO public.product VALUES (18, 'Generic Tuna', 77.30, 7);
INSERT INTO public.product VALUES (19, 'Wooden Chips', 36.00, 7);
INSERT INTO public.product VALUES (20, 'Plastic Ball', 3.10, 16);
INSERT INTO public.product VALUES (21, 'Gorgeous Gloves', 80.80, 15);
INSERT INTO public.product VALUES (22, 'Soap', 89.20, 6);
INSERT INTO public.product VALUES (23, 'Metal Table', 66.90, 10);
INSERT INTO public.product VALUES (24, 'Awesome Keyboard', 24.60, 6);
INSERT INTO public.product VALUES (25, 'Soft Shirt', 65.50, 16);
INSERT INTO public.product VALUES (26, 'New Table', 5.70, 10);
INSERT INTO public.product VALUES (27, 'New Fresh Bacon', 84.40, 4);
INSERT INTO public.product VALUES (28, 'Wooden Shirt', 74.70, 14);
INSERT INTO public.product VALUES (29, 'Granite Bacon', 13.80, 16);
INSERT INTO public.product VALUES (30, 'Practical Cotton Cheese', 10.50, 6);
INSERT INTO public.product VALUES (31, 'Fantastic Concrete Bike', 0.40, 10);
INSERT INTO public.product VALUES (32, 'Used Frozen Car', 32.20, 15);
INSERT INTO public.product VALUES (33, 'Pants', 17.60, 4);
INSERT INTO public.product VALUES (34, 'Computer', 91.70, 2);
INSERT INTO public.product VALUES (35, 'Soft Car', 96.40, 15);
INSERT INTO public.product VALUES (36, 'Handmade Salad', 11.30, 8);
INSERT INTO public.product VALUES (37, 'Plastic Pants', 57.10, 9);
INSERT INTO public.product VALUES (38, 'Rubber Ball', 0.70, 2);
INSERT INTO public.product VALUES (39, 'Sleek Metal Cheese', 28.00, 14);
INSERT INTO public.product VALUES (40, 'For repair Tuna', 13.70, 3);
INSERT INTO public.product VALUES (41, 'Fresh Computer', 66.40, 9);
INSERT INTO public.product VALUES (42, 'Unbranded Fresh Keyboard', 92.30, 9);
INSERT INTO public.product VALUES (43, 'Generic Plastic Pizza', 60.20, 11);
INSERT INTO public.product VALUES (44, 'Small Cotton Gloves', 43.70, 5);
INSERT INTO public.product VALUES (45, 'Keyboard', 91.90, 9);
INSERT INTO public.product VALUES (46, 'Rubber Bike', 60.60, 10);
INSERT INTO public.product VALUES (47, 'Intelligent Concrete Car', 80.40, 11);
INSERT INTO public.product VALUES (48, 'Sausages', 66.70, 10);
INSERT INTO public.product VALUES (49, 'For repair Cheese', 25.80, 5);
INSERT INTO public.product VALUES (50, 'Bacon', 80.30, 3);
INSERT INTO public.product VALUES (51, 'Plastic Keyboard', 62.30, 12);
INSERT INTO public.product VALUES (52, 'Wooden Bacon', 26.60, 6);
INSERT INTO public.product VALUES (53, 'Rustic Granite Hat', 64.80, 10);
INSERT INTO public.product VALUES (54, 'Fresh Keyboard', 99.20, 4);
INSERT INTO public.product VALUES (55, 'Fantastic Concrete Chair', 77.50, 2);
INSERT INTO public.product VALUES (56, 'Intelligent Sausages', 11.60, 6);
INSERT INTO public.product VALUES (57, 'Ergonomic Frozen Ball', 80.10, 10);
INSERT INTO public.product VALUES (58, 'New Rubber Chair', 98.70, 6);
INSERT INTO public.product VALUES (59, 'Intelligent Cotton Bacon', 72.80, 16);
INSERT INTO public.product VALUES (60, 'Practical Wooden Computer', 59.60, 14);
INSERT INTO public.product VALUES (61, 'Awesome Granite Pizza', 97.30, 4);
INSERT INTO public.product VALUES (62, 'Incredible Steel Towels', 10.20, 2);
INSERT INTO public.product VALUES (63, 'Chicken', 0.40, 5);
INSERT INTO public.product VALUES (64, 'Rubber Bacon', 25.40, 8);
INSERT INTO public.product VALUES (65, 'Sleek Granite Ball', 39.20, 11);
INSERT INTO public.product VALUES (66, 'Unbranded Chips', 17.80, 4);
INSERT INTO public.product VALUES (67, 'Steel Bike', 80.20, 5);
INSERT INTO public.product VALUES (68, 'Concrete Salad', 92.10, 11);
INSERT INTO public.product VALUES (69, 'Table', 84.90, 2);
INSERT INTO public.product VALUES (70, 'Keyboard', 3.80, 16);
INSERT INTO public.product VALUES (71, 'Salad', 64.40, 6);
INSERT INTO public.product VALUES (72, 'Licensed Tuna', 61.70, 3);
INSERT INTO public.product VALUES (73, 'Frozen Chicken', 7.40, 4);
INSERT INTO public.product VALUES (74, 'Shoes', 26.80, 12);
INSERT INTO public.product VALUES (75, 'Gorgeous Pants', 97.20, 15);
INSERT INTO public.product VALUES (76, 'Sausages', 67.60, 14);
INSERT INTO public.product VALUES (77, 'Chips', 15.60, 13);
INSERT INTO public.product VALUES (78, 'Chips', 1.40, 3);
INSERT INTO public.product VALUES (79, 'Gorgeous Plastic Pants', 63.10, 8);
INSERT INTO public.product VALUES (80, 'Tuna', 75.00, 16);
INSERT INTO public.product VALUES (81, 'Handcrafted Fresh Shirt', 56.80, 10);
INSERT INTO public.product VALUES (82, 'Pizza', 75.30, 10);
INSERT INTO public.product VALUES (83, 'Awesome Sausages', 82.40, 4);
INSERT INTO public.product VALUES (84, 'Chips', 92.90, 12);
INSERT INTO public.product VALUES (85, 'Small Fresh Computer', 64.70, 8);
INSERT INTO public.product VALUES (86, 'Generic Ball', 18.30, 11);
INSERT INTO public.product VALUES (87, 'Frozen Gloves', 73.40, 7);
INSERT INTO public.product VALUES (88, 'Handmade Soap', 91.70, 8);
INSERT INTO public.product VALUES (89, 'Licensed Cheese', 25.60, 14);
INSERT INTO public.product VALUES (90, 'Gently Used Hat', 74.40, 11);
INSERT INTO public.product VALUES (91, 'Salad', 21.00, 9);
INSERT INTO public.product VALUES (92, 'Rustic Soap', 53.80, 10);
INSERT INTO public.product VALUES (93, 'Metal Sausages', 78.30, 5);
INSERT INTO public.product VALUES (94, 'Unbranded Soft Chicken', 67.90, 15);
INSERT INTO public.product VALUES (95, 'Steel Bacon', 80.20, 4);
INSERT INTO public.product VALUES (96, 'Tuna', 6.80, 16);
INSERT INTO public.product VALUES (97, 'Soap', 75.40, 14);
INSERT INTO public.product VALUES (98, 'New Ball', 50.00, 5);
INSERT INTO public.product VALUES (99, 'Computer', 97.40, 2);
INSERT INTO public.product VALUES (100, 'Hat', 62.60, 9);
INSERT INTO public.product VALUES (101, 'Chair', 61.70, 14);
INSERT INTO public.product VALUES (102, 'Sausages', 87.50, 15);
INSERT INTO public.product VALUES (103, 'Used Wooden Chicken', 28.10, 3);
INSERT INTO public.product VALUES (104, 'Ball', 52.30, 4);
INSERT INTO public.product VALUES (105, 'Fantastic Cotton Pizza', 99.00, 11);
INSERT INTO public.product VALUES (106, 'Pants', 45.80, 14);
INSERT INTO public.product VALUES (107, 'Handmade Tuna', 67.20, 15);
INSERT INTO public.product VALUES (108, 'Cotton Computer', 0.80, 8);
INSERT INTO public.product VALUES (109, 'Soap', 86.10, 9);
INSERT INTO public.product VALUES (110, 'For repair Soft Mouse', 18.70, 7);
INSERT INTO public.product VALUES (111, 'Pizza', 48.50, 7);
INSERT INTO public.product VALUES (112, 'Gorgeous Keyboard', 96.30, 6);
INSERT INTO public.product VALUES (113, 'Chair', 1.30, 8);
INSERT INTO public.product VALUES (114, 'Ball', 62.70, 10);
INSERT INTO public.product VALUES (115, 'Fresh Table', 69.30, 3);
INSERT INTO public.product VALUES (116, 'Used Frozen Car', 40.40, 10);


--
-- TOC entry 3682 (class 0 OID 730772)
-- Dependencies: 213
-- Data for Name: seller; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public.seller VALUES (2, '30593824219487');
INSERT INTO public.seller VALUES (3, '213156593877841');
INSERT INTO public.seller VALUES (4, '4975351393328711');
INSERT INTO public.seller VALUES (5, '3585839894719655');
INSERT INTO public.seller VALUES (6, '5322018684833967');
INSERT INTO public.seller VALUES (7, '3533041352560126');
INSERT INTO public.seller VALUES (8, '3561510903217308');
INSERT INTO public.seller VALUES (9, '6011087091634577');
INSERT INTO public.seller VALUES (10, '371972076984567');
INSERT INTO public.seller VALUES (11, '4759459924661096');
INSERT INTO public.seller VALUES (12, '4069602714278788');
INSERT INTO public.seller VALUES (13, '213120665030085');
INSERT INTO public.seller VALUES (14, '6011047142851240');
INSERT INTO public.seller VALUES (15, '3576582369402248');
INSERT INTO public.seller VALUES (16, '4294568241730428');


--
-- TOC entry 3694 (class 0 OID 730898)
-- Dependencies: 225
-- Data for Name: seller_company_transaction; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public.seller_company_transaction VALUES (8, 15);
INSERT INTO public.seller_company_transaction VALUES (19, 16);
INSERT INTO public.seller_company_transaction VALUES (23, 10);
INSERT INTO public.seller_company_transaction VALUES (29, 16);
INSERT INTO public.seller_company_transaction VALUES (32, 6);
INSERT INTO public.seller_company_transaction VALUES (34, 6);
INSERT INTO public.seller_company_transaction VALUES (49, 14);
INSERT INTO public.seller_company_transaction VALUES (50, 3);
INSERT INTO public.seller_company_transaction VALUES (59, 10);
INSERT INTO public.seller_company_transaction VALUES (69, 8);
INSERT INTO public.seller_company_transaction VALUES (74, 10);
INSERT INTO public.seller_company_transaction VALUES (89, 2);
INSERT INTO public.seller_company_transaction VALUES (132, 6);
INSERT INTO public.seller_company_transaction VALUES (134, 12);
INSERT INTO public.seller_company_transaction VALUES (137, 14);
INSERT INTO public.seller_company_transaction VALUES (156, 5);
INSERT INTO public.seller_company_transaction VALUES (181, 3);
INSERT INTO public.seller_company_transaction VALUES (183, 6);
INSERT INTO public.seller_company_transaction VALUES (188, 14);
INSERT INTO public.seller_company_transaction VALUES (193, 2);
INSERT INTO public.seller_company_transaction VALUES (199, 14);
INSERT INTO public.seller_company_transaction VALUES (204, 14);
INSERT INTO public.seller_company_transaction VALUES (211, 4);
INSERT INTO public.seller_company_transaction VALUES (219, 14);
INSERT INTO public.seller_company_transaction VALUES (221, 14);


--
-- TOC entry 3690 (class 0 OID 730837)
-- Dependencies: 221
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public.transaction VALUES (1, 'customer_company_transaction', 139.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (2, 'customer_driver_transaction', 1.70, '2022-12-12 05:17:12.671388');
INSERT INTO public.transaction VALUES (3, 'customer_company_transaction', 903.20, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (4, 'customer_driver_transaction', 0.30, '2022-12-30 10:47:12.671723');
INSERT INTO public.transaction VALUES (5, 'driver_company_transaction', 2.00, '2023-01-26 16:04:12.671755');
INSERT INTO public.transaction VALUES (6, 'customer_company_transaction', 1103.60, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (7, 'customer_company_transaction', 319.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (8, 'seller_company_transaction', 9.70, '2022-11-11 17:14:12.671476');
INSERT INTO public.transaction VALUES (9, 'driver_company_transaction', 7.50, '2023-01-22 13:25:12.671511');
INSERT INTO public.transaction VALUES (10, 'customer_driver_transaction', 0.90, '2023-01-02 22:19:12.671454');
INSERT INTO public.transaction VALUES (11, 'customer_company_transaction', 105.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (12, 'customer_company_transaction', 1102.90, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (13, 'driver_company_transaction', 6.30, '2022-11-06 23:55:12.671495');
INSERT INTO public.transaction VALUES (14, 'customer_company_transaction', 212.30, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (15, 'customer_company_transaction', 160.20, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (16, 'company_driver_transaction', 1.90, '2023-02-04 11:52:12.671573');
INSERT INTO public.transaction VALUES (17, 'customer_company_transaction', 215.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (18, 'customer_driver_transaction', 4.50, '2022-08-18 22:10:12.671333');
INSERT INTO public.transaction VALUES (19, 'seller_company_transaction', 0.80, '2022-11-04 04:36:12.67173');
INSERT INTO public.transaction VALUES (20, 'customer_company_transaction', 78.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (21, 'customer_company_transaction', 728.20, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (22, 'customer_company_transaction', 90.90, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (23, 'seller_company_transaction', 10.00, '2022-11-20 04:32:12.671479');
INSERT INTO public.transaction VALUES (24, 'company_driver_transaction', 4.30, '2022-09-13 09:11:12.67159');
INSERT INTO public.transaction VALUES (25, 'customer_company_transaction', 494.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (26, 'customer_company_transaction', 707.00, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (27, 'customer_company_transaction', 645.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (28, 'customer_company_transaction', 482.30, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (29, 'seller_company_transaction', 8.30, '2023-01-16 13:47:12.671607');
INSERT INTO public.transaction VALUES (30, 'customer_company_transaction', 624.50, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (31, 'customer_company_transaction', 416.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (32, 'seller_company_transaction', 8.70, '2022-11-27 10:53:12.671617');
INSERT INTO public.transaction VALUES (33, 'customer_company_transaction', 466.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (34, 'seller_company_transaction', 7.20, '2022-08-09 01:34:12.671508');
INSERT INTO public.transaction VALUES (35, 'company_driver_transaction', 0.10, '2022-09-03 03:28:12.671758');
INSERT INTO public.transaction VALUES (36, 'customer_company_transaction', 83.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (37, 'driver_company_transaction', 1.00, '2022-08-23 15:57:12.671629');
INSERT INTO public.transaction VALUES (38, 'customer_company_transaction', 37.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (39, 'customer_company_transaction', 470.30, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (40, 'customer_company_transaction', 465.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (41, 'company_driver_transaction', 3.20, '2022-08-01 21:27:12.671498');
INSERT INTO public.transaction VALUES (42, 'customer_company_transaction', 252.00, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (43, 'customer_driver_transaction', 3.70, '2022-10-12 23:28:12.671412');
INSERT INTO public.transaction VALUES (44, 'driver_company_transaction', 8.60, '2023-01-03 02:34:12.671424');
INSERT INTO public.transaction VALUES (45, 'company_driver_transaction', 3.40, '2022-12-29 09:54:12.671707');
INSERT INTO public.transaction VALUES (46, 'customer_company_transaction', 745.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (47, 'customer_driver_transaction', 0.80, '2022-10-03 20:35:12.671517');
INSERT INTO public.transaction VALUES (48, 'customer_company_transaction', 111.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (49, 'seller_company_transaction', 1.60, '2022-11-05 16:55:12.671457');
INSERT INTO public.transaction VALUES (50, 'seller_company_transaction', 4.60, '2022-09-18 02:22:12.671748');
INSERT INTO public.transaction VALUES (51, 'customer_company_transaction', 639.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (52, 'customer_company_transaction', 248.60, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (53, 'customer_driver_transaction', 5.80, '2022-08-30 18:12:12.671713');
INSERT INTO public.transaction VALUES (54, 'company_driver_transaction', 0.10, '2022-12-25 21:11:12.6717');
INSERT INTO public.transaction VALUES (55, 'customer_company_transaction', 449.90, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (56, 'customer_company_transaction', 628.50, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (57, 'customer_driver_transaction', 8.20, '2022-11-06 03:14:12.671745');
INSERT INTO public.transaction VALUES (58, 'customer_company_transaction', 781.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (59, 'seller_company_transaction', 5.00, '2022-08-07 00:37:12.671614');
INSERT INTO public.transaction VALUES (60, 'customer_company_transaction', 1100.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (61, 'customer_company_transaction', 338.50, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (62, 'customer_company_transaction', 118.90, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (63, 'customer_company_transaction', 807.90, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (64, 'customer_company_transaction', 38.20, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (65, 'customer_driver_transaction', 3.70, '2023-01-06 00:38:12.671685');
INSERT INTO public.transaction VALUES (66, 'customer_company_transaction', 183.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (67, 'customer_driver_transaction', 6.00, '2022-10-25 02:53:12.671482');
INSERT INTO public.transaction VALUES (68, 'customer_company_transaction', 264.90, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (69, 'seller_company_transaction', 8.20, '2022-08-31 09:45:12.671703');
INSERT INTO public.transaction VALUES (70, 'customer_driver_transaction', 8.30, '2022-08-05 09:27:12.67162');
INSERT INTO public.transaction VALUES (71, 'customer_company_transaction', 664.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (72, 'company_driver_transaction', 1.70, '2022-12-26 20:12:12.671419');
INSERT INTO public.transaction VALUES (73, 'customer_company_transaction', 149.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (74, 'seller_company_transaction', 4.50, '2023-01-18 17:45:12.671736');
INSERT INTO public.transaction VALUES (75, 'driver_company_transaction', 1.00, '2022-09-30 06:11:12.67164');
INSERT INTO public.transaction VALUES (76, 'customer_company_transaction', 783.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (77, 'customer_company_transaction', 858.90, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (78, 'customer_company_transaction', 240.60, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (79, 'customer_company_transaction', 1404.20, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (80, 'customer_company_transaction', 37.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (81, 'customer_company_transaction', 374.50, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (82, 'customer_company_transaction', 403.60, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (83, 'customer_company_transaction', 414.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (84, 'company_driver_transaction', 1.50, '2022-11-30 05:05:12.671545');
INSERT INTO public.transaction VALUES (85, 'driver_company_transaction', 6.80, '2022-10-31 16:49:12.671567');
INSERT INTO public.transaction VALUES (86, 'customer_company_transaction', 11.30, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (87, 'customer_company_transaction', 363.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (88, 'customer_driver_transaction', 4.90, '2022-12-17 15:10:12.671678');
INSERT INTO public.transaction VALUES (89, 'seller_company_transaction', 2.10, '2022-10-24 22:19:12.671661');
INSERT INTO public.transaction VALUES (90, 'customer_company_transaction', 729.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (91, 'customer_driver_transaction', 7.70, '2022-09-05 20:17:12.671395');
INSERT INTO public.transaction VALUES (92, 'customer_company_transaction', 340.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (93, 'customer_company_transaction', 938.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (94, 'driver_company_transaction', 6.80, '2022-10-05 17:35:12.671461');
INSERT INTO public.transaction VALUES (95, 'customer_company_transaction', 1060.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (96, 'customer_company_transaction', 401.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (97, 'customer_driver_transaction', 7.60, '2022-11-02 05:58:12.671526');
INSERT INTO public.transaction VALUES (98, 'driver_company_transaction', 2.80, '2022-11-01 02:06:12.671553');
INSERT INTO public.transaction VALUES (99, 'customer_company_transaction', 642.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (100, 'company_driver_transaction', 9.00, '2022-11-18 10:41:12.671538');
INSERT INTO public.transaction VALUES (101, 'customer_company_transaction', 86.00, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (102, 'customer_company_transaction', 250.20, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (103, 'customer_company_transaction', 614.00, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (104, 'customer_company_transaction', 981.90, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (105, 'company_driver_transaction', 7.50, '2022-09-21 15:52:12.671445');
INSERT INTO public.transaction VALUES (106, 'customer_driver_transaction', 1.20, '2022-08-07 01:02:12.671384');
INSERT INTO public.transaction VALUES (107, 'customer_driver_transaction', 5.60, '2023-02-06 05:19:12.67155');
INSERT INTO public.transaction VALUES (108, 'customer_company_transaction', 1093.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (109, 'driver_company_transaction', 0.40, '2022-10-22 16:01:12.67161');
INSERT INTO public.transaction VALUES (110, 'customer_company_transaction', 177.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (111, 'customer_company_transaction', 963.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (112, 'customer_company_transaction', 167.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (113, 'customer_company_transaction', 483.30, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (114, 'customer_driver_transaction', 2.00, '2022-09-01 06:57:12.671367');
INSERT INTO public.transaction VALUES (115, 'driver_company_transaction', 5.20, '2022-10-02 17:31:12.671697');
INSERT INTO public.transaction VALUES (116, 'customer_company_transaction', 769.30, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (117, 'customer_company_transaction', 189.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (118, 'customer_company_transaction', 310.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (119, 'customer_company_transaction', 771.00, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (120, 'customer_company_transaction', 462.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (121, 'driver_company_transaction', 5.90, '2022-10-06 02:07:12.671623');
INSERT INTO public.transaction VALUES (122, 'customer_company_transaction', 461.30, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (123, 'customer_company_transaction', 353.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (124, 'customer_company_transaction', 338.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (125, 'customer_driver_transaction', 0.20, '2022-09-13 19:07:12.671408');
INSERT INTO public.transaction VALUES (126, 'customer_company_transaction', 849.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (127, 'customer_company_transaction', 377.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (128, 'driver_company_transaction', 3.60, '2022-10-24 01:55:12.671733');
INSERT INTO public.transaction VALUES (129, 'customer_company_transaction', 1013.30, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (130, 'customer_company_transaction', 398.20, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (131, 'driver_company_transaction', 7.30, '2022-10-25 15:33:12.671559');
INSERT INTO public.transaction VALUES (132, 'seller_company_transaction', 10.00, '2022-12-05 17:26:12.671486');
INSERT INTO public.transaction VALUES (133, 'customer_company_transaction', 256.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (134, 'seller_company_transaction', 0.70, '2023-02-06 22:47:12.671415');
INSERT INTO public.transaction VALUES (135, 'customer_company_transaction', 63.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (136, 'customer_company_transaction', 422.30, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (137, 'seller_company_transaction', 1.00, '2022-09-22 20:30:12.67172');
INSERT INTO public.transaction VALUES (138, 'driver_company_transaction', 7.30, '2022-09-23 05:35:12.671489');
INSERT INTO public.transaction VALUES (139, 'customer_company_transaction', 81.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (140, 'driver_company_transaction', 1.60, '2022-08-16 00:00:12.67157');
INSERT INTO public.transaction VALUES (141, 'customer_driver_transaction', 0.40, '2022-10-12 16:27:12.671379');
INSERT INTO public.transaction VALUES (142, 'customer_company_transaction', 330.00, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (143, 'customer_company_transaction', 232.50, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (144, 'customer_company_transaction', 512.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (145, 'customer_company_transaction', 1091.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (146, 'driver_company_transaction', 9.30, '2022-12-28 21:19:12.671716');
INSERT INTO public.transaction VALUES (147, 'customer_company_transaction', 587.60, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (148, 'customer_company_transaction', 637.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (149, 'driver_company_transaction', 1.10, '2022-10-17 17:13:12.671353');
INSERT INTO public.transaction VALUES (150, 'customer_company_transaction', 1258.90, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (151, 'driver_company_transaction', 1.60, '2022-09-03 13:58:12.671727');
INSERT INTO public.transaction VALUES (152, 'customer_company_transaction', 664.90, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (153, 'customer_driver_transaction', 8.90, '2022-11-07 12:17:12.671604');
INSERT INTO public.transaction VALUES (154, 'customer_company_transaction', 622.60, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (155, 'customer_company_transaction', 391.50, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (156, 'seller_company_transaction', 8.20, '2022-12-29 09:56:12.671469');
INSERT INTO public.transaction VALUES (157, 'customer_company_transaction', 917.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (158, 'customer_company_transaction', 505.30, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (159, 'customer_company_transaction', 744.00, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (160, 'company_driver_transaction', 8.00, '2022-09-22 01:40:12.67143');
INSERT INTO public.transaction VALUES (161, 'customer_driver_transaction', 0.90, '2023-01-12 22:17:12.671764');
INSERT INTO public.transaction VALUES (162, 'company_driver_transaction', 4.40, '2022-08-14 02:10:12.671562');
INSERT INTO public.transaction VALUES (163, 'customer_company_transaction', 568.30, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (164, 'company_driver_transaction', 2.80, '2022-12-17 16:19:12.671502');
INSERT INTO public.transaction VALUES (165, 'customer_company_transaction', 944.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (166, 'customer_company_transaction', 938.60, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (167, 'customer_driver_transaction', 9.70, '2022-08-15 11:44:12.671739');
INSERT INTO public.transaction VALUES (168, 'customer_company_transaction', 628.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (169, 'customer_company_transaction', 80.60, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (170, 'customer_company_transaction', 492.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (171, 'company_driver_transaction', 4.70, '2022-11-29 09:14:12.671761');
INSERT INTO public.transaction VALUES (172, 'customer_company_transaction', 423.00, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (173, 'customer_company_transaction', 486.20, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (174, 'customer_company_transaction', 1317.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (175, 'customer_driver_transaction', 8.60, '2022-08-06 11:26:12.671532');
INSERT INTO public.transaction VALUES (176, 'customer_company_transaction', 410.20, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (177, 'customer_company_transaction', 479.00, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (178, 'customer_company_transaction', 978.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (179, 'customer_company_transaction', 1015.20, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (180, 'customer_company_transaction', 328.20, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (181, 'seller_company_transaction', 0.30, '2022-08-22 12:11:12.671771');
INSERT INTO public.transaction VALUES (182, 'driver_company_transaction', 3.40, '2023-02-04 12:25:12.671688');
INSERT INTO public.transaction VALUES (183, 'seller_company_transaction', 8.50, '2022-11-25 07:58:12.671637');
INSERT INTO public.transaction VALUES (184, 'customer_company_transaction', 372.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (185, 'company_driver_transaction', 6.60, '2023-01-31 13:12:12.671626');
INSERT INTO public.transaction VALUES (186, 'customer_company_transaction', 104.50, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (187, 'customer_company_transaction', 450.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (188, 'seller_company_transaction', 9.00, '2022-11-05 15:48:12.671505');
INSERT INTO public.transaction VALUES (189, 'customer_company_transaction', 1016.00, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (190, 'customer_company_transaction', 604.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (191, 'customer_driver_transaction', 3.50, '2022-12-26 11:48:12.671767');
INSERT INTO public.transaction VALUES (192, 'company_driver_transaction', 6.70, '2022-10-07 11:24:12.671473');
INSERT INTO public.transaction VALUES (193, 'seller_company_transaction', 1.00, '2022-09-25 17:34:12.671587');
INSERT INTO public.transaction VALUES (194, 'customer_company_transaction', 835.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (195, 'customer_driver_transaction', 3.80, '2022-12-20 21:08:12.67171');
INSERT INTO public.transaction VALUES (196, 'customer_company_transaction', 11.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (197, 'customer_company_transaction', 561.50, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (198, 'company_driver_transaction', 5.00, '2022-12-31 10:28:12.671675');
INSERT INTO public.transaction VALUES (199, 'seller_company_transaction', 0.70, '2022-08-08 19:50:12.671581');
INSERT INTO public.transaction VALUES (200, 'driver_company_transaction', 9.90, '2022-12-14 11:51:12.671433');
INSERT INTO public.transaction VALUES (201, 'customer_company_transaction', 637.60, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (202, 'customer_company_transaction', 572.00, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (203, 'company_driver_transaction', 5.30, '2022-12-26 15:10:12.671464');
INSERT INTO public.transaction VALUES (204, 'seller_company_transaction', 2.20, '2022-08-09 12:00:12.671399');
INSERT INTO public.transaction VALUES (205, 'customer_company_transaction', 167.00, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (206, 'customer_company_transaction', 504.80, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (207, 'customer_company_transaction', 253.90, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (208, 'customer_company_transaction', 256.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (209, 'customer_company_transaction', 941.20, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (210, 'driver_company_transaction', 5.00, '2023-02-02 01:10:12.671523');
INSERT INTO public.transaction VALUES (211, 'seller_company_transaction', 6.60, '2023-01-18 12:34:12.671439');
INSERT INTO public.transaction VALUES (212, 'customer_company_transaction', 535.70, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (213, 'customer_driver_transaction', 1.10, '2022-12-31 05:04:12.671362');
INSERT INTO public.transaction VALUES (214, 'customer_company_transaction', 936.60, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (215, 'customer_company_transaction', 444.40, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (216, 'driver_company_transaction', 6.60, '2023-01-13 08:48:12.671541');
INSERT INTO public.transaction VALUES (217, 'customer_company_transaction', 254.30, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (218, 'customer_company_transaction', 63.10, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (219, 'seller_company_transaction', 9.50, '2022-09-01 21:01:12.671694');
INSERT INTO public.transaction VALUES (220, 'customer_company_transaction', 10.50, '2023-02-01 23:09:12.671776');
INSERT INTO public.transaction VALUES (221, 'seller_company_transaction', 0.80, '2022-11-21 23:13:12.671632');


--
-- TOC entry 3680 (class 0 OID 730756)
-- Dependencies: 211
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: silal_agent
--

INSERT INTO public."user" VALUES (1, '1234567890', 'manager', 'Account Manager', 'pbkdf2:sha512:200000$cvdPhKzc$552c4298b989945a1fca9b5018cb59afff6e5b251a66ced1b83d2697e236d0a71a13ff0430897345a764ae68fc1d748cd978ca56a0b0062851c86925a783a575', 'admin@silal.app');
INSERT INTO public."user" VALUES (2, '+972589197368', 'seller', 'Chang-Fisher', 'pbkdf2:sha512:200000$H5CCaUC6$5e5947173feb9610b8284e2c786b25e432a703c69dd5c1f88fa4604a390f2fbad7d0ae766b5e1127f8ee149d810c1c6a0763da97c9d2fc5c64a483e2a69f7edc', 'tammy76@example.com');
INSERT INTO public."user" VALUES (3, '+972546976432', 'seller', 'Patrick, Barrera and Collins', 'pbkdf2:sha512:200000$lB5W2Uqe$5ec8a28cc3f47c2ada234c1198e40f2238428b1aff1e4628ef3008ec8feaec4d88c9b2842b7a843d454bc4beca81fcc0a3bbe42d5808a1dbefc57c8797a05c58', 'nolangabriella@example.com');
INSERT INTO public."user" VALUES (4, '+972525175417', 'seller', 'Trujillo PLC', 'pbkdf2:sha512:200000$Y5ADYGKO$2b2522ea4a7724f978412f8f9604f404480c35dac480a09f0e509ecd0541254e5f2982db5c0688bf25b4e6cf56c1eeda28267ecae229ba288533cae09d17cc35', 'davismary@example.net');
INSERT INTO public."user" VALUES (5, '+970560403977', 'seller', 'Kaiser PLC', 'pbkdf2:sha512:200000$ydGCRg41$87440513f6d02ce06310b84013aef1728531e9c194f7f3cc92382ae3ddc984299094850b13b0db5da56ab5e99e3fd456d431eec8ba3e9496a51af0674b3efff9', 'jrodriguez@example.com');
INSERT INTO public."user" VALUES (6, '+972569988568', 'seller', 'Allen, White and Underwood', 'pbkdf2:sha512:200000$lVvDShlt$1d8e6e73cb74342215903dadcfeb700433d21e6552b59efdb8e5465162419bd505017610b3a7cdd54c134f0ebd0bc5fd7761511cf5833d78b66f0ff03dd9b314', 'salazardiane@example.com');
INSERT INTO public."user" VALUES (7, '+970595448262', 'seller', 'Hill, Vasquez and Davidson', 'pbkdf2:sha512:200000$uFAnvR35$b8bb5db3efe0e543bb8266e959a66aad5f4160530274436016094108bd1a49f592db4555ef142d6a1c08f77bb2d80279abda70e2401282d42faf4718f461eecc', 'christopher91@example.com');
INSERT INTO public."user" VALUES (8, '+970592819825', 'seller', 'Robinson, Montoya and Walters', 'pbkdf2:sha512:200000$JAPZNvgD$486494c4bec59cbae54e91dc5c37e797beb31f2b3327dde9cc0e5f4fda70f316e18fbbac597d5c7e77e963bfe65311dd26876e48d73a9e5d1c1c1ef4266664bc', 'johnsoncynthia@example.net');
INSERT INTO public."user" VALUES (9, '+970593406459', 'seller', 'Johnson, Coleman and Garcia', 'pbkdf2:sha512:200000$s2lpPovV$5fe517daadf8bc65caa251199fca9a96c49a6ca15700cbbcea885670ed660ff59df8d5e2ed060d776daf2ca5f8a00c15f06a7611dcb2a37871759bf999d4ac1f', 'chad14@example.com');
INSERT INTO public."user" VALUES (10, '+972565382380', 'seller', 'Jackson, Chambers and Levy', 'pbkdf2:sha512:200000$iQKpDscF$762c316b1082f8b28025ea3b77dac2543d2de1b1f57e55cd75385dd35101ce197a15e020fd7ccd4dc28e6825c7f803806c3d0efc58486972c09d8375bcf4771a', 'kramereric@example.org');
INSERT INTO public."user" VALUES (11, '+972595696689', 'seller', 'King, Castro and Smith', 'pbkdf2:sha512:200000$dWbvWQz3$289d83a74999843d70cf222f15572e22a609d2f377ed1f7a5153067cbad4cddadefeb917e699cdf805c8ac87b995134ba42502e4c37bfc5e4d9297a5f120d912', 'rogersbrandon@example.com');
INSERT INTO public."user" VALUES (12, '+972521318968', 'seller', 'Hale and Sons', 'pbkdf2:sha512:200000$jO22QzoX$93a9f1346457de3a4d6be5d7a84b64687d99944c8a6d465e0dbe832ae949fea003a6389aa22d29bdd3ef49ea740048d5a8071a87a25b0523a5f00ac8f92b73e0', 'jeffreywest@example.net');
INSERT INTO public."user" VALUES (13, '+972525991317', 'seller', 'Campos, Henson and Simpson', 'pbkdf2:sha512:200000$XGK0Op1X$c4e96aa7ae0a76a1756bc0a2f0d9d9984871d95ad599d3d9974c597214e3f107e0d21d7f6e896dbf4dfd263ebd9d64f8b85d146510cdccd9780bfdbada99abb5', 'mary06@example.org');
INSERT INTO public."user" VALUES (14, '+970560088925', 'seller', 'Davis, Wilson and Banks', 'pbkdf2:sha512:200000$vTUJB2eG$d4c3ad0028926952e5440053872064707b1cb513343dd1e2d8694a8b3da3b62fa24cef10e87e44a22c14c1369da63a4d48e9d10ba8ce35973d8d6488b40a6ead', 'joshua21@example.com');
INSERT INTO public."user" VALUES (15, '+970594699101', 'seller', 'Williams and Sons', 'pbkdf2:sha512:200000$P3CX5yf6$5b1fb2261d1f35ef4cadc63b68c803e7976435f6ad79908ad259e213e42594bbc7054d2a2040af5ce0a2ec6eddefe37c822b5cc2227d3bdaafa66e054f00f13a', 'angela59@example.org');
INSERT INTO public."user" VALUES (16, '+972593788342', 'seller', 'Morgan-Richardson', 'pbkdf2:sha512:200000$Iu04a5GK$c34ebbac7eb068f403d1c69206b77798a446091d85c22668cb764e5491fb88b288a231ac3ce9fdf93c3e4629cf237120ee72d792fa1cdcd9f19720f93bbc631e', 'morganchristine@example.org');
INSERT INTO public."user" VALUES (17, '+972528861666', 'customer', 'Norma Fisher', 'pbkdf2:sha512:200000$czGYpPsV$18b364b59aad88d019773cb44aacf39d445c640dd2386d5c7f4e2c3e22b3cda390f2b9408cc733ee7542f0476524349f83c6a126590c83ded394a4dc04aa409c', 'tammy76@example.com');
INSERT INTO public."user" VALUES (18, '+972580087709', 'customer', 'Susan Levy', 'pbkdf2:sha512:200000$Uh3IPdfS$714429ae8efbc9e8e576ad7bbb8565c9c392a8e27664c4941a5cba494ad82ded431d682bbd6e50498c598e743cddd230d2a1eb617c8fa3a13e7a343a62425096', 'hramos@example.com');
INSERT INTO public."user" VALUES (19, '+972528361307', 'customer', 'Robin Fernandez', 'pbkdf2:sha512:200000$ZauvIcmF$d8f577f93e9f3c1a3d80b06ac8df7d600ca628dc5b11f2c213e477daf841f078bc1222e1999477f711ccb18fbc920b945d4f76dd7dfb58f2507bbe531d1451b4', 'sean96@example.com');
INSERT INTO public."user" VALUES (20, '+972537120927', 'customer', 'Mr. Ryan Sanchez', 'pbkdf2:sha512:200000$s7my8Vy3$acc484a5b176a11b2ed9ef3162a2fdb9569259f22014672ca83e6df3f746534ddb108102d9869385b97916bcb15c022b1f68a91f19ca3ea27c556d4c4a033fb8', 'dave35@example.org');
INSERT INTO public."user" VALUES (21, '+972565639153', 'customer', 'Brian Green', 'pbkdf2:sha512:200000$zgNkbNwd$96bc470134d28ea5131f56d6acf8c8c2430f93da22e62c97c4df5ef2601673b4da8ecd0e2f9d9d8d1a392c7b7591b2d925378752db924f25eb10f148fc9ab7cc', 'charlesturner@example.com');
INSERT INTO public."user" VALUES (22, '+972531894922', 'customer', 'Alexandria Harmon', 'pbkdf2:sha512:200000$oAbSpo6F$f5d883e9b054e4401017afa23a3f57768eb61cc472ce4109e000a80540ce559b2b0d3d52b539ec5a8b9d9e16243c3fbca0b134957beeca4a346ecca67c186bc9', 'joanne84@example.org');
INSERT INTO public."user" VALUES (23, '+972523136600', 'customer', 'Katelyn Hoffman', 'pbkdf2:sha512:200000$0J8D0fbC$9e1f65bca7863231b3ad92e5101353b8a2ba5904ab0950c4d6c3de5b4a05f6434faa0b65171e2e0cf10601170bdeebdffe9456df39ad4db3d737b81e3cd6f38a', 'hensontroy@example.com');
INSERT INTO public."user" VALUES (24, '+972589322460', 'customer', 'Diana Good', 'pbkdf2:sha512:200000$7e94NmJV$3251bc59ac37d1582c5c59d413970c4277f918584cc73bfe6dcf2699f241a8eb60fcf55b2af8182e303e8edf32e89df9952869ba167f1a309fd6b2b5fe7e4d8c', 'alvarezsandra@example.net');
INSERT INTO public."user" VALUES (25, '+972529413816', 'customer', 'Gavin Clarke', 'pbkdf2:sha512:200000$BofyGCBW$803ab77e7372727945d7069d882cbd23ff3cc6050923b9ef2166c95d468382be8230a982e3718078897afb5b70f1f5c1b5dec573ab61b576612bd059ae526352', 'morganchristine@example.org');
INSERT INTO public."user" VALUES (26, '+972543813820', 'customer', 'Michael Simmons', 'pbkdf2:sha512:200000$zK3DLaOS$0b98328bf5affb93510826b27e36862a664d6fa293af84508dbb24dba08b6bf45a32827e1b60dcc973491300f43507471f2f9e9078e45a7088c8e92aec7904f8', 'matthew22@example.net');
INSERT INTO public."user" VALUES (27, '+970565969623', 'customer', 'Jocelyn Rhodes', 'pbkdf2:sha512:200000$D81wD1SF$d70c58062d48275d035496c5971484df34b7f0c2ec5200a558ea39a7c8c4c1dcd33dc83b24ca36a8f29df716579e277570a1c0e5ffd6e85b1029a1148a53ea67', 'crawfordjonathan@example.net');
INSERT INTO public."user" VALUES (28, '+970561474125', 'customer', 'Amanda Hernandez', 'pbkdf2:sha512:200000$T2zaUxDv$c20085ebbe70d1c80de92feed9b3839bbda3024b124f984b4c6dfef9a5d0258bd9c3969ce27b1386eec5e631e677994798575eed04a63f9de756a6adb276c84b', 'carrie26@example.net');
INSERT INTO public."user" VALUES (29, '+972567032578', 'customer', 'William Bruce', 'pbkdf2:sha512:200000$u9jfun9c$c88a0d2086c462ec1e1297a9c59636a1828afaf7f7aa564bd3e221f4c94b44b50b2944d8605f08e9aa37d97f2726e42bbe14a37e14d6c56cf87fc8bfc8378dd5', 'olawson@example.org');
INSERT INTO public."user" VALUES (30, '+970560744636', 'customer', 'Megan Hernandez', 'pbkdf2:sha512:200000$JhcMtECo$52e2ffcb6fa44acf4bbb71198fbb012865bff4e856a736570814cc37819a02cf0b4d4c798cae8d37019c097aff74c2e4cc7ad4834ac230e4bfafab2719f9b6a9', 'robert97@example.com');
INSERT INTO public."user" VALUES (31, '+972594821043', 'customer', 'Peter Gibson', 'pbkdf2:sha512:200000$T3WWEQ1t$e2b7f877f0b7495076367557910b5f82383299785d0d1056a1cfffa32f7d2cb719c868b2c7421cb987d6d0a2962d462ea1efadecd72e5914f061d4a1ae029416', 'huberrachel@example.org');
INSERT INTO public."user" VALUES (32, '+972560728220', 'customer', 'Tonya Sharp', 'pbkdf2:sha512:200000$EhiWW9kX$2d88cd5be492f3ff480b0f6ea2bc68a1cd5cda3d36ab004de19d53a5f3034d10a9a791a2ff843aca9bcd77f2253e89eaeb1c3bedf8174297eb730898c0a2340a', 'gomezdavid@example.net');
INSERT INTO public."user" VALUES (33, '+972568258723', 'customer', 'Angela Ferguson', 'pbkdf2:sha512:200000$KSP9G06o$b6483306c9385f534e478958caf993da79a3152e4049177e3901efaf0dd5fd36e470908872f23ceb248891c0f344a0950cbe81be8bf940bce60e506b0b509946', 'eric22@example.org');
INSERT INTO public."user" VALUES (34, '+970590599368', 'customer', 'Jason Chandler', 'pbkdf2:sha512:200000$xDe1dIZz$9ad0c073fb9faf78ee903cfd06a16ccf82164fb6bfc9c044f30c3f8b1fb1068743228942f17b799017d012412fa1606beb856495e88112977d9953abe4e7dad1', 'scott54@example.com');
INSERT INTO public."user" VALUES (35, '+970560425906', 'customer', 'Edwin Mack', 'pbkdf2:sha512:200000$qvLoL6ZR$e807674c933f36938feda3d539544815e9069ce48c1704fe237e934f861e5d5ff978dabffaf3b086f4b7852bb1f07a809f0c41afa0f264b400d09152fca01b49', 'amy26@example.net');
INSERT INTO public."user" VALUES (36, '+972526497800', 'customer', 'Joseph Wright', 'pbkdf2:sha512:200000$7BMzmCN3$08f4d4eea444d19145b7ba55ae7ef64c573eeb8da5b8d4c0a967a2118a6421a9e772f6e89bba760c2e33e94ae4e657ab156048d92b05c477d037c72291fbcaee', 'carloscallahan@example.com');
INSERT INTO public."user" VALUES (37, '+972599640188', 'customer', 'Jonathan Vasquez DVM', 'pbkdf2:sha512:200000$c5HDGPqV$d322d870c21576151aa8c91196f45631377ee0b694f25e5300851018f6a1743139119c33795bce115d787128c44f6cda2e4dd1e159c93a1a37064c0fd66cd6f3', 'vevans@example.com');
INSERT INTO public."user" VALUES (38, '+972527586955', 'customer', 'Janet Rivera', 'pbkdf2:sha512:200000$1O5QYa3A$59178635d0c51302098134cbaa6d6eaafde2caee26ba97547de970001c47d501fe84691fb8af73e86d223b7180dbbed5fae98aaf7a5f8793f54d2d1f35aa82f0', 'thernandez@example.org');
INSERT INTO public."user" VALUES (39, '+972593138507', 'customer', 'Edward Miller', 'pbkdf2:sha512:200000$qH6uigRt$9ed55eee2a16180f80e67054a79f2d147867efeedb6836bdeebc734b1724e8a3c9c7363c43e8130ceb3c19085f95c79c2c83c46b763d6a07abb919065cb48b17', 'kelsey56@example.com');
INSERT INTO public."user" VALUES (40, '+970569136730', 'customer', 'Erica Bryant', 'pbkdf2:sha512:200000$TV6KBea1$7b1f27d0f9420cd2f102d8ddd332a0dc4901c79ea8a5278a875899fc882987fabe0df032a03c04e78ffe6f5b99ee883aa02f9253b8e7dfa1e18ab2e24d83c712', 'jonathan80@example.org');
INSERT INTO public."user" VALUES (41, '+972524320251', 'customer', 'Bradley Allen', 'pbkdf2:sha512:200000$aMVkpny9$a7b6d2cc4463a82db7ee0e6bef4565801079f5828bcd1d0fd424b555a0cc6a15a340a9e4d46e63cd5fb6fcec4b9f695589b17e69ea032ea0bf9542e5162c98c4', 'robertcalhoun@example.com');
INSERT INTO public."user" VALUES (42, '+970594119774', 'customer', 'Danielle Mitchell', 'pbkdf2:sha512:200000$hY8YYRKb$9083c3cd5f405b2128e8c4204920452fbf0bee836d978301046028f56a843f66f8c83ebc10178f6065c6f30160c524ae5efcbc30772ae35f92c6f9f48e116ca7', 'harmonzachary@example.org');
INSERT INTO public."user" VALUES (43, '+972563822307', 'customer', 'Rachael Hampton', 'pbkdf2:sha512:200000$ISnhwXek$2351b8cdd369073823fd0e4740103521844ab8d6343ecc4451a9613eb5d80cf91afead6efe3e345b36de98c47ce29da1248075ea9993df0cf5dcc2ad8b97d6b3', 'joeanderson@example.org');
INSERT INTO public."user" VALUES (44, '+972594568040', 'customer', 'Nicholas Nixon', 'pbkdf2:sha512:200000$TcNsw3tw$0711c4d6585d14fb58a51c95761b190c1d65fa74df52df072cad48c8c7875bf8629be5fa2a861e5b97bcd62ad016bbf95811ad83ca1a5774b982aa458a3f7245', 'michelle34@example.com');
INSERT INTO public."user" VALUES (45, '+970593324901', 'customer', 'Dennis Schmidt', 'pbkdf2:sha512:200000$1r1ah9hI$59e40efc44740b356f62bfe1866a30d0b636ab8f510e456f6db5f8944d8bf8c6ebbff918204a40d0f19b8ec2ec8c629e3af84d11d63a4eeab125a592f14b2ee7', 'kmalone@example.org');
INSERT INTO public."user" VALUES (46, '+972561778543', 'customer', 'Edward Hernandez', 'pbkdf2:sha512:200000$I5xYzxgw$39b7c83531be14749ba54afac033661ce7a9efc6a669d1c3aaaf8cfc41ef78980586acee128304ebefd22418dbb6846a9d29f74a9cdba76f37e01bd376c530ac', 'williammartin@example.com');
INSERT INTO public."user" VALUES (47, '+972582686472', 'customer', 'Terri Sanchez', 'pbkdf2:sha512:200000$KJUZaqgj$52cc0309c26d988afd9e1f3bac39d7170a0b08f08534b106031b7570dd1becdee00e02861709fb7dbd7e535f07b2285edffc6cd90cbe9a9f328b811f22dca7f5', 'francisco25@example.net');
INSERT INTO public."user" VALUES (48, '+972581876136', 'customer', 'Matthew Moore', 'pbkdf2:sha512:200000$CM40t64e$8c942fb31824dbe3b7c774459deb1fdb110e2aeda2d90efc617c6b8d6a54321fb62d229a977e3459d57fc567679edf82c87367a1cc9c94c0b058b27a1f42d533', 'davidcrystal@example.net');
INSERT INTO public."user" VALUES (49, '+972566617189', 'customer', 'Nicolas Duncan', 'pbkdf2:sha512:200000$HSC7tP1Z$51ed92b54736874bb13a5bd5427cdadb56f20c529b58736ba8cd00758008205c3c89729a15c1434b3e0d1759de0daa4f1157349380666f2c30eb57882135a3a6', 'joshuaduffy@example.com');
INSERT INTO public."user" VALUES (50, '+972594451852', 'customer', 'Beth Page', 'pbkdf2:sha512:200000$12TK4Ieb$b16854d15b35136e93072c6171aa888131a9a26415a5957f294c00edc85b94f383c50a58b759f98235722cb17d7ed709d7af2f432c7733a9d351b89ce85f2be8', 'lynn67@example.net');
INSERT INTO public."user" VALUES (51, '+970569237033', 'customer', 'Justin Manning', 'pbkdf2:sha512:200000$yi7S1yrJ$594c2af77aa215d5e2f1ee6e40157630dc1d6105858bdfb511e061f22c518f1530ffd4ebf5a0389953f65381fdaa4af19ec3e2d199376b3f72cc2d703571c0cd', 'wherring@example.net');
INSERT INTO public."user" VALUES (52, '+970596787517', 'customer', 'Jimmy Moore', 'pbkdf2:sha512:200000$jExNPazR$105ed0d944e580567ae576ad3ea51be6f3032775bf64e869dd137a5863b8adb14a5f46e18a53b50a5801d9e0454fbe77e7e10534ac3ce56af5fb240cc7571223', 'roberta27@example.net');
INSERT INTO public."user" VALUES (53, '+970563734765', 'customer', 'Lindsay Bauer', 'pbkdf2:sha512:200000$T1uenBJc$bb37a46632e6a08d39cf571cddf5d943bfa7a02a095c992d186f429242fa5252b33e91a65ae8ad5bfc53f1a2d43e93bec240ef7e760c72b66d17464b462a152e', 'michaelconley@example.org');
INSERT INTO public."user" VALUES (54, '+972584834610', 'customer', 'Ronald Cook', 'pbkdf2:sha512:200000$h2vmWTbG$e521f8eb68e4d01fefe3206c84376b991bc188ea608a0929f00bee0206a696bf3abaa18592c96982f2a983e95a91e2aa7f7a9e02c76e4b227515a73353f64627', 'ruizantonio@example.net');
INSERT INTO public."user" VALUES (55, '+972546550961', 'customer', 'Randy Martin', 'pbkdf2:sha512:200000$KC3KfMlk$d0d1c4aa260237474a1211ecd6be972bbdc9118b810d76b4cf0402b0b9f638ae68a8cd1f962a700df41296f36f964dc9568a78310ad492996661e3eabcd8bb62', 'mcdanieljennifer@example.org');
INSERT INTO public."user" VALUES (56, '+970597635711', 'customer', 'Keith Bell', 'pbkdf2:sha512:200000$EFGbFziG$26271dfa472d75bb563da422d32758e1e2c7f351a6ba41fc2ec9fabd2fcac2ff6b816c9bdf1721c5960e351c86da2d32b697c2edbf964e3ecdc495eb0e5b0a37', 'reynoldsryan@example.com');
INSERT INTO public."user" VALUES (57, '+972533457995', 'customer', 'Jason Lawrence', 'pbkdf2:sha512:200000$1RZYTeAG$e36feb9dfa2cdfaedfcc643ab944ce1e1d7cba6a294d156ee48cead718c45872c7cac109ed7e8f02c61aafa0295ec30c0512b69e6ceea50bded741a26ea23163', 'kathleen15@example.com');
INSERT INTO public."user" VALUES (58, '+972534608055', 'customer', 'Michelle Miller', 'pbkdf2:sha512:200000$fPYjRHzm$9cdb8f21118c5093fbc66b0759f0caf99f7897eb772f32220934ef9fe2e38fbe0d0cbedd7ce542c0199ab7b279466bbeb3e0b14a0ce956ae8511c8822d571206', 'jgardner@example.org');
INSERT INTO public."user" VALUES (59, '+972598650789', 'customer', 'Kayla Oconnell', 'pbkdf2:sha512:200000$ryCxzHJ9$66d7bf824671ecd3b6e5829bbe67bf7530d35bd395d0394f60dd1ce3d3a6f389f5bd157fbffbec6bc0a165c365c4a7862f9afc09a6d46a4fc9f028c318e3e2df', 'rhess@example.org');
INSERT INTO public."user" VALUES (60, '+972586875784', 'customer', 'Angela Gates', 'pbkdf2:sha512:200000$HfoPDF99$a71c4a112809430dc7cb2c64385d03e302ff284897236d31074f7ab8983a775d699a793f0aa10b86535cbb2cdd7c4b530b93df8801ccf502d8ebc7ea086fff3a', 'anthonyday@example.org');
INSERT INTO public."user" VALUES (61, '+972528533841', 'customer', 'David Diaz', 'pbkdf2:sha512:200000$gHfrM21k$347c222e842a222508784ab2b93090bb24cef43f7ffbbcf6985b2ace7d4198e3fdbe7995348ab965c4bc9be3ecffa251ac087bf2c5422f227a39b8411e1af536', 'melissa27@example.org');
INSERT INTO public."user" VALUES (62, '+972592998780', 'customer', 'Andrew Sullivan', 'pbkdf2:sha512:200000$F6SU8V0N$6d7fc9bc983065c7434f9787666bff5fdee740584b52dd4036b81e8f82c5660a4552648d194f57fcf0b1dc3207f6fc47eee897506ca54e964742c734db4ea3e5', 'gklein@example.com');
INSERT INTO public."user" VALUES (63, '+972546957988', 'customer', 'Sean Perez', 'pbkdf2:sha512:200000$4T4lLGfo$dd308111a13d111584e94c41ae176df45e76eb00d1ca017f469e4a1d7bb14200921d473ce9f133fbf07a4583c3863f609b691fe73b92aa02c38e66ff449a7dc8', 'crystal56@example.com');
INSERT INTO public."user" VALUES (64, '+972598794809', 'customer', 'Anna Stewart', 'pbkdf2:sha512:200000$XibHbhT5$e2266d967e0f060e551c9b38d34f24dc064196b5d853971b366d4df23220b150fc2a87ab399a783a2a4222de8ce951290d31603ecd6822a1ea6f38823a72ed3d', 'lorireynolds@example.org');
INSERT INTO public."user" VALUES (65, '+972522739862', 'customer', 'Sarah Jones', 'pbkdf2:sha512:200000$oB33QdKw$8afd97d7d2ae361ddf402f1bca0af4e9a488b63daede9044e0b94c6ad249a4913b399d139085acd856253dc86d8b8d422ae80a555011fc0bef5bb5dc4afc1e6d', 'saraperez@example.com');
INSERT INTO public."user" VALUES (66, '+972542999579', 'customer', 'Jonathan Hansen', 'pbkdf2:sha512:200000$uOwvgI2y$cf9c4d66c377feeadccaeb499cd2812f5c008c669a1486a4ea3fcee3a6ad2bb0989c9835aa78b5a4d4a66a3267407a48e8f4254af20d30dfa36d50d0f88d796f', 'cmartinez@example.com');
INSERT INTO public."user" VALUES (67, '+972527374528', 'customer', 'John Frederick', 'pbkdf2:sha512:200000$pSId0Hp6$f30f1f15ca2394ab5b8a0d5077b011473cbdf6c24193b376a78dd75a8aa3a598fa486a750ff0b7b339e03224bab1b099270cc99643045d8faab0ac6d2efa901c', 'tanyaboyd@example.org');
INSERT INTO public."user" VALUES (68, '+972532617927', 'customer', 'Laura Lewis', 'pbkdf2:sha512:200000$ciIOBMAl$451bf8718a327d5ae5dd08c8b33bbaa2529fcdf666541ac4ce6980d0eeb8d1327b821532672c2746543cbac1d8f55e0a6355e66dd6dd76d0d194b79f4e08f144', 'fjohnson@example.net');
INSERT INTO public."user" VALUES (69, '+972567544910', 'customer', 'Brian Moore', 'pbkdf2:sha512:200000$MlcAT7vo$23780ea327e326b3f12b93d48182386657e4d612ff61f6c60e16edd609e08b241349c2276c7ad79befba4acbe7dbac12fb92c9ad3926ef8ba26b5eab17b19c3b', 'tsampson@example.net');
INSERT INTO public."user" VALUES (70, '+970592080155', 'customer', 'Cynthia Faulkner', 'pbkdf2:sha512:200000$dFd65o42$a11bcb5b784c6dc5053702431e819469a22120476c06195fe5a3b8e9b5750acbb9f9adbc8b4858f5454eafbf6a5bc7502cd9ea08e54bfbba8c5c521796cc9971', 'matthewssusan@example.com');
INSERT INTO public."user" VALUES (71, '+972582735242', 'customer', 'Mark Baker', 'pbkdf2:sha512:200000$hRWsJBxQ$fe0f3739d4daa30ceaae7d6aced5b3f69e0fc6b5d9b43ea505e0d850e1bc365680b4f7998dbf93999cdb16b584b9ee29eaa7086576eb06253bc9edcfc2ee027a', 'coopernathaniel@example.net');
INSERT INTO public."user" VALUES (72, '+970590494864', 'customer', 'Rachael Reed', 'pbkdf2:sha512:200000$5d2r7xYO$42f24ccb3fd559bf076ef3070f694dc5642437eb63fd46266e43e949358afce6744617dad8cab2842731d61cc8a8e9072ce00fcef511ec1591d2701d5119f42e', 'wendysteele@example.org');
INSERT INTO public."user" VALUES (73, '+972566955609', 'customer', 'Jonathan Decker', 'pbkdf2:sha512:200000$XvbUyQcl$fd40022bb40cf84ff771de113bf29f0ea4cfd5854a9a7364391f909533f42750dc5ef7eb42a2a2d44c627c46379da0be78048e0182f0826223a6dda48edabe0a', 'millertiffany@example.com');
INSERT INTO public."user" VALUES (74, '+972569263543', 'customer', 'Kim Preston', 'pbkdf2:sha512:200000$wIsGHS7C$fd6784b45ee5bcac78e1a5db415fbf52ceb0e5c72e9a955de02fdb5314c2e4de0885f01ee83a0ba60211ba1209ad62753d989c1481f8906b775579a4d9e9cbb5', 'hendersongavin@example.org');
INSERT INTO public."user" VALUES (75, '+970565045015', 'customer', 'Sean Bowen', 'pbkdf2:sha512:200000$E3AnEeFc$bc817ff8babe84bc0fc9ee635e0bc385c8f3ef5cc6f2287e14d54e33e4aeab603bafc7c7c2a47bd98f68ce20936f06052d286f729cb508e7ca7cbbc0cc7ad2f4', 'johncastro@example.net');
INSERT INTO public."user" VALUES (76, '+972598197185', 'customer', 'Victoria Dudley', 'pbkdf2:sha512:200000$hiuuRG3h$5afa5f1c4f42f3adc201908f2a056835b54eaef9160a4d5dacc52d7f456909d00ea1f0b2d024937560779197883fc2e1b71d22d10d5fc825cec8e88687c9c404', 'escott@example.org');
INSERT INTO public."user" VALUES (77, '+972535650700', 'customer', 'John Gross', 'pbkdf2:sha512:200000$CLAZe8Nm$4bc59ac2510e7e8222872a99115dd96184a6b8ae3db4a3f4a5de9ffeb032c7f9c962ff3942867f42b9551ac5cca1d4d0de7b6520e1c35a01d6f3f2f0856fbca5', 'charlottemorgan@example.com');
INSERT INTO public."user" VALUES (78, '+970595437993', 'customer', 'David Bauer', 'pbkdf2:sha512:200000$h4nQPZH5$30c5f7e1ebc237e5e0b88b6f38db24c45fdd683b990a0a4da6e75347c3ebda6ac96d7b2c879f20c8523874ebc59e9c2df3e454de06a57bc0b2cc55a8896d378e', 'petersenjay@example.org');
INSERT INTO public."user" VALUES (79, '+970595727612', 'customer', 'Lisa Wagner', 'pbkdf2:sha512:200000$rXyB5NWP$1bd383e03b900cc10c65172ae64f89f0e78306e66f8d3c98106ff214daecb870b4615a333ed9d54ad8081638b8c2ab24ba09c1d0265461345fe93dfb2819a906', 'rebeccabrown@example.net');
INSERT INTO public."user" VALUES (80, '+972543264045', 'customer', 'Michael Lawson', 'pbkdf2:sha512:200000$cTQHTRtf$077e1fb9952a7824cdb27dd00fc91f9a2752c128db7b3e60c42bf9db7785f639c0a2dd7ad1f4f99e50292e85651597fa7aea959ce50e330bbcc3536b029edc4f', 'rmiranda@example.net');
INSERT INTO public."user" VALUES (81, '+972541461974', 'customer', 'Robert Miller', 'pbkdf2:sha512:200000$zkZMV1rs$d9e752fcaa81bd5ddc2c797dff1866fcc8961c0e1fca54025fe870b82890bb25b2546643253919a31f0428d992c4efcbae9b0e5d57f05d016a4b3e4f5b344b5b', 'vschneider@example.org');
INSERT INTO public."user" VALUES (82, '+972565103950', 'customer', 'Katie Mays', 'pbkdf2:sha512:200000$OXbMAoMP$971e5d8ac271e5c90e0c488af5225f6c54a1707fcbc3830ecf980ae1f6a4223659d65fbd08144a8b56c577e3711b544224cbc8fdd1f2b6cc8eb6b68754bf1ee1', 'ashleyadam@example.com');
INSERT INTO public."user" VALUES (83, '+972536238178', 'customer', 'Briana Johnson', 'pbkdf2:sha512:200000$VFyzkJV0$b2ad5ea7a0ae20cf8ebabe61f09b70db97ee225867334b8c37c7a0f7f9013098822758665e35031847ec54814aba582912913bd41a546d9b85d048980ddd2782', 'beckalice@example.net');
INSERT INTO public."user" VALUES (84, '+972583219265', 'customer', 'John Avila', 'pbkdf2:sha512:200000$2yhj3jUw$cddd2fb27d1515d62302e1c8f08ffef73cfa8829e64676e3f5c5243d7ec104fb71ec825a34b6c4845508f223b93f8c0a1944960b683780c9223dc014200ccd5f', 'psmith@example.org');
INSERT INTO public."user" VALUES (85, '+972569921037', 'customer', 'Daniel Estes', 'pbkdf2:sha512:200000$Y0y0uBpz$9e9b098cad1a832810bdeb4e6ecb36b7ae6388502f82833815d9ba201ad972535d1a71ea07028e1754e464a76a590c1783cd9de15135ebc92d40b7e7e886f038', 'sheri39@example.com');
INSERT INTO public."user" VALUES (86, '+972539154910', 'customer', 'Tyler Munoz', 'pbkdf2:sha512:200000$tmPH8yGP$1bffd690a406a73dc6045d1f0b5ef14f2eee301f11515f9c37a0fe526168d6b61e5ba49508ead4d9c670f487a96d9cfd46218a0c0bccfaeb4c0999aa366f027d', 'melanieellis@example.com');
INSERT INTO public."user" VALUES (87, '+972537753199', 'driver', 'Norma Fisher', 'pbkdf2:sha512:200000$0YM41xl3$32a1da1451b352bb56c0bd9f0087fedf88c5639ce6eb9270689f0f4268d5db15db69fe74f19a459edbb1e073f6304483217bac68a196c8378eb44d338afbe2dd', 'tammy76@example.com');
INSERT INTO public."user" VALUES (88, '+972587396643', 'driver', 'Dr. Stephanie Collins', 'pbkdf2:sha512:200000$jMDs9Tf3$930067bc204ba2cba9e78e35d484f76a62efb11de0a4905cf736243ccd13c5b7fca81419f4b042e28a2e277e56d66f915ee724e92cc35ae48da73c7c4739444b', 'nolangabriella@example.com');
INSERT INTO public."user" VALUES (89, '+972591580097', 'driver', 'Thomas Moon', 'pbkdf2:sha512:200000$dfJz11EH$bfe8337fe4827e05558a8e8dde7865a3aeaab1b152c350afa075370233dcbb8b19a375d677d4820354ffd41a180f8ea420b8c9ac530b8e7cca2c8e24a7673511', 'cortezraymond@example.net');
INSERT INTO public."user" VALUES (90, '+972521050915', 'driver', 'Francisco Romero', 'pbkdf2:sha512:200000$byhKkfX9$1494f3ea76f545986111eac462e30c48d0a3abf374c592d55d57a95e0ce8c442d54f8f5f9bb39cccdecd939d37ac5d2f38242e9cd56ee64de2c3197ab31cbb95', 'jrodriguez@example.com');
INSERT INTO public."user" VALUES (91, '+972538808613', 'driver', 'Donna Lopez', 'pbkdf2:sha512:200000$i5zKdCKG$eb1374c67d0e041c46617a277c9de874ea8cac3077e5022aa4255b9aa28c5699c39868f67823ab0718fd04d78ec48b38a2d9ed4c5cf9166db8ee1515ef686758', 'antoniozavala@example.com');
INSERT INTO public."user" VALUES (92, '+972543703442', 'driver', 'Sarah Jacobson', 'pbkdf2:sha512:200000$IhD0OkqR$6171e7c4d9d1a3b184a302957df2d8c37d910279ddf74b8ae10cf80ffcdfefa3428051c8f6f3eeb8cc90abd960db113ba8ca3ad62cb3663ba7793a947a5ddda6', 'criley@example.com');
INSERT INTO public."user" VALUES (93, '+972524743533', 'driver', 'Faith Cabrera', 'pbkdf2:sha512:200000$AD0o8DmZ$e586d6c132f4abe239e7b49062ae2e3dc1023b4613a377ee9eb39cd127e43cdbde9c7fcd36d49240e668fdca2a748a42a4f036c6bfc2d999cc476fefed4e446e', 'loganmelissa@example.org');
INSERT INTO public."user" VALUES (94, '+972521984443', 'driver', 'Barbara Davis', 'pbkdf2:sha512:200000$tV8HFAxv$9d48b3c5fce0965e79405aaddf278c9f1e15d7b539e0de6c0099a0b89b8971f0b65aec105807c4257e178d94b3724de5dadd7f342c4cfd241d6552827aedbd64', 'johnsonandrew@example.org');
INSERT INTO public."user" VALUES (95, '+970598826582', 'driver', 'Christopher Gordon', 'pbkdf2:sha512:200000$CBr34Nej$a178b8869029d01eeacdf55cdc3c661b786f8da931e13354b0457f6ed16da975c8e84b08f07f4140495b4697e1e66e0e689194d3ce7de565ed75aefd721336ba', 'carlsonholly@example.com');
INSERT INTO public."user" VALUES (96, '+972543567464', 'driver', 'Thomas Wade', 'pbkdf2:sha512:200000$HnyYOR5b$eec3894595a2395c3a19acf783a668f7c5495c6adad909a0528950c31251eabbdf1533bc18489ba149e9fe409876ffc12a483302f476e051615fb88442837e77', 'ruizrobert@example.net');
INSERT INTO public."user" VALUES (97, '+970568656626', 'driver', 'Brandy Gill', 'pbkdf2:sha512:200000$uNtdNUEx$0ef3ab1707fb2b0ffa271374fa85c183059fae1916da3d92f49897081794782cf4494d4fd72c4e3b78a3e802d7d166ea88cb59ad9407dcf4b14b384b1edd2b36', 'sbell@example.net');
INSERT INTO public."user" VALUES (98, '+970566005226', 'driver', 'Shawn Carroll', 'pbkdf2:sha512:200000$TSUjRnUT$7b980e9cf54673459f009d6adaa72c41afecac2425928d6064e03421c9bf45c58208442b0dccd13af1e6a0b754f6f283a763c3d220584bd50cab6176408ccf30', 'sjohnson@example.net');
INSERT INTO public."user" VALUES (99, '+972593040993', 'driver', 'Kathleen Collins', 'pbkdf2:sha512:200000$nJDzgDDT$d32d182ee332c997d38046bcb5a68c83ba4cb3823a395e309a4e4d109557111e1842e3e0a955e39ca5c2712182052843989ca2759554d35ff70f658e54d8fc9f', 'zwilliams@example.com');
INSERT INTO public."user" VALUES (100, '+972523071838', 'driver', 'Bryan Banks', 'pbkdf2:sha512:200000$1ZyE6Ot5$7989c7f5d5430b903f32371b64e42771aea76bec38a5936f6912eda41ad02b8459a252314664a0fab2d4c851a3be26de66ceb41f1f3308dbcbafa406fc177239', 'joshua21@example.com');
INSERT INTO public."user" VALUES (101, '+972549524989', 'driver', 'Amanda Harris', 'pbkdf2:sha512:200000$1XU1qCZc$61fefdffb95464048e77fe8e397276e53a65c6fad7310b24b8db47b63afb415edd1317427925ec996ce3c41f3e7b3e258691b68f363c16f92a9c06252a053b60', 'angela59@example.org');
INSERT INTO public."user" VALUES (102, '+970564233339', 'driver', 'Richard Higgins', 'pbkdf2:sha512:200000$krIv4C5R$1fddd88528c70dd62f28b975c5a11e882010e80488d245433e738d6ad15a6da465eee9c39d7c229bf2343ca921a1d4a8cb4b098a00509ed62b92c5e93ba1f857', 'kimberly00@example.com');
INSERT INTO public."user" VALUES (103, '+972526075782', 'driver', 'Elizabeth Houston', 'pbkdf2:sha512:200000$vYlOfTbb$91200736fee71d3e536c0107a4cc94b83e2d9eebd3ff2c81cf9659c7cd3aed6492fb39257b4e31e2a42cfec7fa821174a6504a5726efe5d0e35061bd98b68c9f', 'robert18@example.com');
INSERT INTO public."user" VALUES (104, '+970561550422', 'driver', 'Lori Bennett', 'pbkdf2:sha512:200000$8V7ZuW4U$0597b4da6374ed32c3a004e54b1a3e1f561081d2aeaef138223310d444819cc2639ebf8dacec8839ed6ee605a78b13e82acc54b8d1c3ae39d05c169e4f6e0d12', 'joneschristopher@example.net');
INSERT INTO public."user" VALUES (105, '+972536034316', 'driver', 'Jacob Hinton', 'pbkdf2:sha512:200000$7nNM1LJD$f214d6872023eda1eec796e3619c4598067988e6aaf2457541ee7aeccbf1976a670b9ff3b5afa590177920a61ceacdc0b6b22a6251799ed329c677051a7fd3d2', 'brenda26@example.org');
INSERT INTO public."user" VALUES (106, '+970565188976', 'driver', 'Ashley Ellis', 'pbkdf2:sha512:200000$d3AbpPkP$2a4ffb9310fc2badb22dfdc1c8643256eb60bb228ee224640228bc98c4cc8ef936c8750ca97176e959e08cd49d6f1652bebc36fdbd588f424e54a20d118c7754', 'amy21@example.net');
INSERT INTO public."user" VALUES (107, '+970599745424', 'driver', 'Colleen Peterson', 'pbkdf2:sha512:200000$dajSfVoy$0ed24fc6eaed620127f2df870ea22b06e9381b813be610b0134f4d71088a572b0365c2bc107e92b48d0a0042429c017b9c7354a0e957928725101ac1efefb649', 'lisa08@example.org');
INSERT INTO public."user" VALUES (108, '+972588215785', 'driver', 'Sheila Murray', 'pbkdf2:sha512:200000$7Uxlb0eR$e8e51e42d944cf2680c77241f4277aab244105f4b28cbc393fee99bcd88db6404c209057e1c5d77e632e6e5f618846ed58db94cbb1043ef51ce6a75b23a15f1b', 'william88@example.org');
INSERT INTO public."user" VALUES (109, '+972597308611', 'driver', 'Sean Smith', 'pbkdf2:sha512:200000$C4be5MhT$399dda32d50a99f8d54bea82f252f47b0c0795eac0d5ca8b51387449f474cd9ff09351253d6e606f0dedd116f620371de51bc4a1f1cc7d1646360f10113ccb1e', 'yangkevin@example.net');
INSERT INTO public."user" VALUES (110, '+972564034757', 'driver', 'Steve Guzman', 'pbkdf2:sha512:200000$TccwSUni$4b711dcb3ce2958aa0a7f4eef5cdda3f5b45b632427cf78610aacbabbe991ad0d42607ca88a622b3c42ccd6a8b5e22adb23b97b1dbd3872ba4e721276eb05422', 'nunezedward@example.com');
INSERT INTO public."user" VALUES (111, '+970561314690', 'driver', 'Lorraine Garcia', 'pbkdf2:sha512:200000$UNG3cDTl$981c1c79333245430a488b62eda668e626b252a3e579078c607b1510f48c7b10e73e4a003cf397668a17df2d9466178f7539dba236c33bf275ca12b51910f817', 'james71@example.org');
INSERT INTO public."user" VALUES (112, '+972535673788', 'driver', 'Peter Gibson', 'pbkdf2:sha512:200000$pLTU9HQo$10d8ab0d703ec6589101b44ab62cd52c806fb8729d4812971b534175e3a3b0e37a5ed842652fb4c68db45b54e2476e47cc092541a2dbe91653cc59ba0db9aaf4', 'huberrachel@example.org');
INSERT INTO public."user" VALUES (113, '+972597328308', 'driver', 'Theresa Thomas', 'pbkdf2:sha512:200000$iN151a2X$6faf350cd68f03974f1e048cf3dd4954ad04fd9cda05ea6acd9e1689da6d5a61f27962efe32219f797e9bc4fdf119f76d23156c64184de4462d29069165ca747', 'glivingston@example.com');
INSERT INTO public."user" VALUES (114, '+972595013755', 'driver', 'Michael Reed', 'pbkdf2:sha512:200000$Ccb2911l$d35d8ab56d8de47eace0fb4bb4068755e4bbd2845fbeb284d085af561fa2d0135ec3d04c55fc2f23c90b554899e4347e023794bd36292a642031951b2fc6d628', 'alejandromccann@example.com');
INSERT INTO public."user" VALUES (115, '+970597794166', 'driver', 'Chelsea Rodriguez', 'pbkdf2:sha512:200000$WTGi2lUz$36850a6c22e5600a083dc2ad6e6422aec90590ca5f5425b4359eda5aadbcb77ede5556053e7159400fc4e4421eb779521247e4f668b43ad91eebfccf6c6e7f4b', 'jasmine42@example.org');
INSERT INTO public."user" VALUES (116, '+972528486396', 'driver', 'Brooke Hurst', 'pbkdf2:sha512:200000$Uai39MhY$d2c5fe2996178bac2669a5cce552f312cf2c5919cfd725d13df48056c4c53a96b89fe27c157c01ceba9e5964eb2b2af6a540bf3b0aefb24bc959e75d1f865b71', 'lindastewart@example.org');


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 209
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: silal_agent
--

SELECT pg_catalog.setval('public.order_order_id_seq', 1000, true);


--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 217
-- Name: order_order_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: silal_agent
--

SELECT pg_catalog.setval('public.order_order_id_seq1', 129, true);


--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 215
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: silal_agent
--

SELECT pg_catalog.setval('public.product_product_id_seq', 116, true);


--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 220
-- Name: transaction_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: silal_agent
--

SELECT pg_catalog.setval('public.transaction_transaction_id_seq', 221, true);


--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 210
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: silal_agent
--

SELECT pg_catalog.setval('public.user_user_id_seq', 116, true);


-- Completed on 2023-02-06 23:09:19 EET

--
-- PostgreSQL database dump complete
--

