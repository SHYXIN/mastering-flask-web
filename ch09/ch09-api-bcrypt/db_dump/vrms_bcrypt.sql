--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 15.1

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: administrator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrator (
    id integer NOT NULL,
    adminid character varying(12) NOT NULL,
    username character varying(20) NOT NULL,
    firstname character varying(50) NOT NULL,
    midname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    email character varying(25) NOT NULL,
    mobile character varying(15) NOT NULL,
    "position" character varying(100) NOT NULL,
    status boolean NOT NULL,
    gender character varying(10) NOT NULL
);


ALTER TABLE public.administrator OWNER TO postgres;

--
-- Name: administrator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administrator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administrator_id_seq OWNER TO postgres;

--
-- Name: administrator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administrator_id_seq OWNED BY public.administrator.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: doctor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor (
    id integer NOT NULL,
    docid character varying(12) NOT NULL,
    username character varying(20) NOT NULL,
    firstname character varying(50) NOT NULL,
    midname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    age integer NOT NULL,
    gender character varying(10) NOT NULL,
    email character varying(25) NOT NULL,
    mobile character varying(15) NOT NULL,
    status boolean NOT NULL,
    vaccenterid character varying(20) NOT NULL
);


ALTER TABLE public.doctor OWNER TO postgres;

--
-- Name: doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_id_seq OWNER TO postgres;

--
-- Name: doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_id_seq OWNED BY public.doctor.id;


--
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    id integer NOT NULL,
    vacid character varying(20) NOT NULL,
    vaccenterid character varying(20) NOT NULL,
    date_delivered date NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_id_seq OWNER TO postgres;

--
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_id_seq OWNED BY public.inventory.id;


--
-- Name: login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    password character varying(200) NOT NULL,
    role integer NOT NULL
);


ALTER TABLE public.login OWNER TO postgres;

--
-- Name: login_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_id_seq OWNER TO postgres;

--
-- Name: login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;


--
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient (
    id integer NOT NULL,
    patientid character varying(20) NOT NULL,
    username character varying(20) NOT NULL,
    firstname character varying(50) NOT NULL,
    midname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    birthday date NOT NULL,
    age integer NOT NULL,
    address character varying(100) NOT NULL,
    email character varying(25) NOT NULL,
    mobile character varying(15) NOT NULL,
    gender character varying(10) NOT NULL
);


ALTER TABLE public.patient OWNER TO postgres;

--
-- Name: patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_id_seq OWNER TO postgres;

--
-- Name: patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patient_id_seq OWNED BY public.patient.id;


--
-- Name: vaccination_center; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vaccination_center (
    id integer NOT NULL,
    vaccenterid character varying(20) NOT NULL,
    centername character varying(100) NOT NULL,
    telephone character varying(20) NOT NULL,
    address character varying(100) NOT NULL,
    city character varying(50) NOT NULL,
    province character varying(50) NOT NULL,
    region character varying(50) NOT NULL
);


ALTER TABLE public.vaccination_center OWNER TO postgres;

--
-- Name: vaccination_center_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vaccination_center_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vaccination_center_id_seq OWNER TO postgres;

--
-- Name: vaccination_center_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vaccination_center_id_seq OWNED BY public.vaccination_center.id;


--
-- Name: vaccine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vaccine (
    id integer NOT NULL,
    vacid character varying(20) NOT NULL,
    vacname character varying(50) NOT NULL,
    vacdesc character varying(100) NOT NULL,
    qty integer NOT NULL,
    price double precision NOT NULL,
    status boolean NOT NULL
);


ALTER TABLE public.vaccine OWNER TO postgres;

--
-- Name: vaccine_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vaccine_card (
    id integer NOT NULL,
    cardid character varying(20) NOT NULL,
    patientid character varying(20) NOT NULL,
    docid character varying(100) NOT NULL,
    vacid character varying(20) NOT NULL,
    date_vaccinated double precision NOT NULL
);


ALTER TABLE public.vaccine_card OWNER TO postgres;

--
-- Name: vaccine_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vaccine_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vaccine_card_id_seq OWNER TO postgres;

--
-- Name: vaccine_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vaccine_card_id_seq OWNED BY public.vaccine_card.id;


--
-- Name: vaccine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vaccine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vaccine_id_seq OWNER TO postgres;

--
-- Name: vaccine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vaccine_id_seq OWNED BY public.vaccine.id;


--
-- Name: vaccine_registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vaccine_registration (
    id integer NOT NULL,
    vacid character varying(20) NOT NULL,
    regcode character varying(50) NOT NULL,
    adminid character varying(12) NOT NULL,
    date_registration date NOT NULL
);


ALTER TABLE public.vaccine_registration OWNER TO postgres;

--
-- Name: vaccine_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vaccine_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vaccine_registration_id_seq OWNER TO postgres;

--
-- Name: vaccine_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vaccine_registration_id_seq OWNED BY public.vaccine_registration.id;


--
-- Name: administrator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator ALTER COLUMN id SET DEFAULT nextval('public.administrator_id_seq'::regclass);


--
-- Name: doctor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor ALTER COLUMN id SET DEFAULT nextval('public.doctor_id_seq'::regclass);


--
-- Name: inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN id SET DEFAULT nextval('public.inventory_id_seq'::regclass);


--
-- Name: login id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);


--
-- Name: patient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient ALTER COLUMN id SET DEFAULT nextval('public.patient_id_seq'::regclass);


--
-- Name: vaccination_center id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccination_center ALTER COLUMN id SET DEFAULT nextval('public.vaccination_center_id_seq'::regclass);


--
-- Name: vaccine id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine ALTER COLUMN id SET DEFAULT nextval('public.vaccine_id_seq'::regclass);


--
-- Name: vaccine_card id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine_card ALTER COLUMN id SET DEFAULT nextval('public.vaccine_card_id_seq'::regclass);


--
-- Name: vaccine_registration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine_registration ALTER COLUMN id SET DEFAULT nextval('public.vaccine_registration_id_seq'::regclass);


--
-- Data for Name: administrator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrator (id, adminid, username, firstname, midname, lastname, email, mobile, "position", status, gender) FROM stdin;
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
68ff6328b911
\.


--
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor (id, docid, username, firstname, midname, lastname, age, gender, email, mobile, status, vaccenterid) FROM stdin;
\.


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (id, vacid, vaccenterid, date_delivered) FROM stdin;
\.


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login (id, username, password, role) FROM stdin;
1	owen	$2b$12$tU2qgbWWkHyUI7XWrczCF.aAuMZ0yk31C7L0CYaWLl6Ya90dKKHIW	1
2	sjctrags	$2b$12$qeUA4TQ6hHP83DfIDef6Ou9y0F6LbJNWEplXA5qNaahNhvhHa2dx2	0
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient (id, patientid, username, firstname, midname, lastname, birthday, age, address, email, mobile, gender) FROM stdin;
\.


--
-- Data for Name: vaccination_center; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vaccination_center (id, vaccenterid, centername, telephone, address, city, province, region) FROM stdin;
\.


--
-- Data for Name: vaccine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vaccine (id, vacid, vacname, vacdesc, qty, price, status) FROM stdin;
\.


--
-- Data for Name: vaccine_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vaccine_card (id, cardid, patientid, docid, vacid, date_vaccinated) FROM stdin;
\.


--
-- Data for Name: vaccine_registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vaccine_registration (id, vacid, regcode, adminid, date_registration) FROM stdin;
\.


--
-- Name: administrator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administrator_id_seq', 1, false);


--
-- Name: doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_id_seq', 1, false);


--
-- Name: inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_id_seq', 1, false);


--
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_id_seq', 2, true);


--
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patient_id_seq', 1, false);


--
-- Name: vaccination_center_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vaccination_center_id_seq', 1, false);


--
-- Name: vaccine_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vaccine_card_id_seq', 1, false);


--
-- Name: vaccine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vaccine_id_seq', 1, false);


--
-- Name: vaccine_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vaccine_registration_id_seq', 1, false);


--
-- Name: administrator administrator_adminid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_adminid_key UNIQUE (adminid);


--
-- Name: administrator administrator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: doctor doctor_docid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_docid_key UNIQUE (docid);


--
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- Name: inventory inventory_vacid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_vacid_key UNIQUE (vacid);


--
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);


--
-- Name: login login_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_username_key UNIQUE (username);


--
-- Name: patient patient_patientid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_patientid_key UNIQUE (patientid);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- Name: vaccination_center vaccination_center_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccination_center
    ADD CONSTRAINT vaccination_center_pkey PRIMARY KEY (id);


--
-- Name: vaccination_center vaccination_center_vaccenterid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccination_center
    ADD CONSTRAINT vaccination_center_vaccenterid_key UNIQUE (vaccenterid);


--
-- Name: vaccine_card vaccine_card_cardid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine_card
    ADD CONSTRAINT vaccine_card_cardid_key UNIQUE (cardid);


--
-- Name: vaccine_card vaccine_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine_card
    ADD CONSTRAINT vaccine_card_pkey PRIMARY KEY (id);


--
-- Name: vaccine vaccine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine
    ADD CONSTRAINT vaccine_pkey PRIMARY KEY (id);


--
-- Name: vaccine_registration vaccine_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine_registration
    ADD CONSTRAINT vaccine_registration_pkey PRIMARY KEY (id);


--
-- Name: vaccine_registration vaccine_registration_vacid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine_registration
    ADD CONSTRAINT vaccine_registration_vacid_key UNIQUE (vacid);


--
-- Name: vaccine vaccine_vacid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine
    ADD CONSTRAINT vaccine_vacid_key UNIQUE (vacid);


--
-- Name: administrator administrator_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_username_fkey FOREIGN KEY (username) REFERENCES public.login(username);


--
-- Name: doctor doctor_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_username_fkey FOREIGN KEY (username) REFERENCES public.login(username);


--
-- Name: doctor doctor_vaccenterid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_vaccenterid_fkey FOREIGN KEY (vaccenterid) REFERENCES public.vaccination_center(vaccenterid);


--
-- Name: inventory inventory_vaccenterid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_vaccenterid_fkey FOREIGN KEY (vaccenterid) REFERENCES public.vaccination_center(vaccenterid);


--
-- Name: inventory inventory_vacid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_vacid_fkey FOREIGN KEY (vacid) REFERENCES public.vaccine(vacid);


--
-- Name: patient patient_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_username_fkey FOREIGN KEY (username) REFERENCES public.login(username);


--
-- Name: vaccine_card vaccine_card_docid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine_card
    ADD CONSTRAINT vaccine_card_docid_fkey FOREIGN KEY (docid) REFERENCES public.doctor(docid);


--
-- Name: vaccine_card vaccine_card_patientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine_card
    ADD CONSTRAINT vaccine_card_patientid_fkey FOREIGN KEY (patientid) REFERENCES public.patient(patientid);


--
-- Name: vaccine_card vaccine_card_vacid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine_card
    ADD CONSTRAINT vaccine_card_vacid_fkey FOREIGN KEY (vacid) REFERENCES public.vaccine(vacid);


--
-- Name: vaccine_registration vaccine_registration_adminid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine_registration
    ADD CONSTRAINT vaccine_registration_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.administrator(adminid);


--
-- Name: vaccine_registration vaccine_registration_vacid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vaccine_registration
    ADD CONSTRAINT vaccine_registration_vacid_fkey FOREIGN KEY (vacid) REFERENCES public.vaccine(vacid);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

