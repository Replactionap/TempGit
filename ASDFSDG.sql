--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-11 15:35:22

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16400)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    clientid integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20),
    address character varying(255)
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: clients_clientid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_clientid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_clientid_seq OWNER TO postgres;

--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 215
-- Name: clients_clientid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_clientid_seq OWNED BY public.clients.clientid;


--
-- TOC entry 220 (class 1259 OID 16414)
-- Name: rentals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rentals (
    rentalid integer NOT NULL,
    clientid integer,
    serverid integer,
    rentalstart date NOT NULL,
    rentalend date NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.rentals OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16413)
-- Name: rentals_rentalid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rentals_rentalid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rentals_rentalid_seq OWNER TO postgres;

--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 219
-- Name: rentals_rentalid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rentals_rentalid_seq OWNED BY public.rentals.rentalid;


--
-- TOC entry 218 (class 1259 OID 16407)
-- Name: servers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servers (
    serverid integer NOT NULL,
    servername character varying(100) NOT NULL,
    cpu character varying(50) NOT NULL,
    ram character varying(50) NOT NULL,
    storage character varying(100) NOT NULL,
    location character varying(100) NOT NULL
);


ALTER TABLE public.servers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16406)
-- Name: servers_serverid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servers_serverid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servers_serverid_seq OWNER TO postgres;

--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 217
-- Name: servers_serverid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servers_serverid_seq OWNED BY public.servers.serverid;


--
-- TOC entry 222 (class 1259 OID 16431)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(50) NOT NULL,
    passwordhash character varying(255) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16430)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_userid_seq OWNER TO postgres;

--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 4649 (class 2604 OID 16403)
-- Name: clients clientid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN clientid SET DEFAULT nextval('public.clients_clientid_seq'::regclass);


--
-- TOC entry 4651 (class 2604 OID 16417)
-- Name: rentals rentalid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals ALTER COLUMN rentalid SET DEFAULT nextval('public.rentals_rentalid_seq'::regclass);


--
-- TOC entry 4650 (class 2604 OID 16410)
-- Name: servers serverid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers ALTER COLUMN serverid SET DEFAULT nextval('public.servers_serverid_seq'::regclass);


--
-- TOC entry 4652 (class 2604 OID 16434)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 4810 (class 0 OID 16400)
-- Dependencies: 216
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (clientid, name, email, phone, address) FROM stdin;
2	Bob Smith	bob@example.com	555-2345	234 Oak Street
3	Carol Williams	carol@example.com	555-3456	345 Pine Street
4	David Brown	david@example.com	555-4567	456 Birch Street
5	Eve Davis	eve@example.com	555-5678	567 Cedar Street
6	Frank Miller	frank@example.com	555-6789	678 Elm Street
7	Grace Wilson	grace@example.com	555-7890	789 Spruce Street
8	Hank Moore	hank@example.com	555-8901	890 Willow Street
9	Ivy Taylor	ivy@example.com	555-9012	901 Poplar Street
10	Jack Anderson	jack@example.com	555-0123	012 Fir Street
1	Mema Johnson	alice@example.com	555-1234	123 Maple Street
\.


--
-- TOC entry 4814 (class 0 OID 16414)
-- Dependencies: 220
-- Data for Name: rentals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rentals (rentalid, clientid, serverid, rentalstart, rentalend, price) FROM stdin;
1	1	1	2024-01-01	2024-06-01	1000.00
2	2	2	2024-02-01	2024-07-01	1500.00
3	3	3	2024-03-01	2024-08-01	1200.00
4	4	4	2024-04-01	2024-09-01	1300.00
5	5	5	2024-05-01	2024-10-01	1400.00
6	6	6	2024-06-01	2024-11-01	1600.00
7	7	7	2024-07-01	2024-12-01	1100.00
8	8	8	2024-08-01	2025-01-01	1250.00
9	9	9	2024-09-01	2025-02-01	1350.00
10	10	10	2024-10-01	2025-03-01	1450.00
\.


--
-- TOC entry 4812 (class 0 OID 16407)
-- Dependencies: 218
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servers (serverid, servername, cpu, ram, storage, location) FROM stdin;
1	Server1	Intel Xeon E5-2670	64GB	1TB SSD	New York
2	Server2	AMD EPYC 7301	128GB	2TB SSD	Los Angeles
3	Server3	Intel Xeon E3-1270	32GB	500GB SSD	Chicago
4	Server4	AMD Ryzen 9 3900X	64GB	1TB NVMe	Dallas
5	Server5	Intel Xeon E5-2690	128GB	2TB NVMe	San Francisco
6	Server6	AMD EPYC 7551	256GB	4TB SSD	Seattle
7	Server7	Intel Xeon E5-2680	64GB	1TB HDD	Miami
8	Server8	AMD Ryzen 7 3700X	32GB	500GB NVMe	Boston
9	Server9	Intel Xeon E5-2660	128GB	2TB HDD	Atlanta
10	Server10	AMD EPYC 7401	256GB	4TB HDD	Houston
\.


--
-- TOC entry 4816 (class 0 OID 16431)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, username, passwordhash, createdat) FROM stdin;
2	replactionap	50703eae181c1b78834624d9af39102a14294d44505c2b2ad1bf2ca7534e4847	2024-06-11 12:50:00
1	admin	200747499121fb236605aefe8e4a09aa3e50f4ee02ab7174400967cc09729840	2015-01-01 00:05:00
\.


--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 215
-- Name: clients_clientid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_clientid_seq', 10, true);


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 219
-- Name: rentals_rentalid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rentals_rentalid_seq', 10, true);


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 217
-- Name: servers_serverid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servers_serverid_seq', 10, true);


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 2, true);


--
-- TOC entry 4655 (class 2606 OID 16405)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (clientid);


--
-- TOC entry 4659 (class 2606 OID 16419)
-- Name: rentals rentals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (rentalid);


--
-- TOC entry 4657 (class 2606 OID 16412)
-- Name: servers servers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (serverid);


--
-- TOC entry 4661 (class 2606 OID 16437)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 4663 (class 2606 OID 16439)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4664 (class 2606 OID 16420)
-- Name: rentals rentals_clientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.clients(clientid);


--
-- TOC entry 4665 (class 2606 OID 16425)
-- Name: rentals rentals_serverid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_serverid_fkey FOREIGN KEY (serverid) REFERENCES public.servers(serverid);


-- Completed on 2024-06-11 15:35:22

--
-- PostgreSQL database dump complete
--

