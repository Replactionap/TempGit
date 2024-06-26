toc.dat                                                                                             0000600 0004000 0002000 00000023336 14632042174 0014451 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       #                |            LZT.ServerRental    16.3    16.3 #    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16398    LZT.ServerRental    DATABASE     �   CREATE DATABASE "LZT.ServerRental" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
 "   DROP DATABASE "LZT.ServerRental";
                postgres    false         �            1259    16400    clients    TABLE     �   CREATE TABLE public.clients (
    clientid integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20),
    address character varying(255)
);
    DROP TABLE public.clients;
       public         heap    postgres    false         �            1259    16399    clients_clientid_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_clientid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.clients_clientid_seq;
       public          postgres    false    216         �           0    0    clients_clientid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.clients_clientid_seq OWNED BY public.clients.clientid;
          public          postgres    false    215         �            1259    16414    rentals    TABLE     �   CREATE TABLE public.rentals (
    rentalid integer NOT NULL,
    clientid integer,
    serverid integer,
    rentalstart date NOT NULL,
    rentalend date NOT NULL,
    price numeric(10,2) NOT NULL
);
    DROP TABLE public.rentals;
       public         heap    postgres    false         �            1259    16413    rentals_rentalid_seq    SEQUENCE     �   CREATE SEQUENCE public.rentals_rentalid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.rentals_rentalid_seq;
       public          postgres    false    220         �           0    0    rentals_rentalid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.rentals_rentalid_seq OWNED BY public.rentals.rentalid;
          public          postgres    false    219         �            1259    16407    servers    TABLE       CREATE TABLE public.servers (
    serverid integer NOT NULL,
    servername character varying(100) NOT NULL,
    cpu character varying(50) NOT NULL,
    ram character varying(50) NOT NULL,
    storage character varying(100) NOT NULL,
    location character varying(100) NOT NULL
);
    DROP TABLE public.servers;
       public         heap    postgres    false         �            1259    16406    servers_serverid_seq    SEQUENCE     �   CREATE SEQUENCE public.servers_serverid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.servers_serverid_seq;
       public          postgres    false    218         �           0    0    servers_serverid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.servers_serverid_seq OWNED BY public.servers.serverid;
          public          postgres    false    217         �            1259    16431    users    TABLE     �   CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(50) NOT NULL,
    passwordhash character varying(255) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap    postgres    false         �            1259    16430    users_userid_seq    SEQUENCE     �   CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    222         �           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    221         )           2604    16403    clients clientid    DEFAULT     t   ALTER TABLE ONLY public.clients ALTER COLUMN clientid SET DEFAULT nextval('public.clients_clientid_seq'::regclass);
 ?   ALTER TABLE public.clients ALTER COLUMN clientid DROP DEFAULT;
       public          postgres    false    216    215    216         +           2604    16417    rentals rentalid    DEFAULT     t   ALTER TABLE ONLY public.rentals ALTER COLUMN rentalid SET DEFAULT nextval('public.rentals_rentalid_seq'::regclass);
 ?   ALTER TABLE public.rentals ALTER COLUMN rentalid DROP DEFAULT;
       public          postgres    false    219    220    220         *           2604    16410    servers serverid    DEFAULT     t   ALTER TABLE ONLY public.servers ALTER COLUMN serverid SET DEFAULT nextval('public.servers_serverid_seq'::regclass);
 ?   ALTER TABLE public.servers ALTER COLUMN serverid DROP DEFAULT;
       public          postgres    false    217    218    218         ,           2604    16434    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    221    222    222         �          0    16400    clients 
   TABLE DATA           H   COPY public.clients (clientid, name, email, phone, address) FROM stdin;
    public          postgres    false    216       4810.dat �          0    16414    rentals 
   TABLE DATA           ^   COPY public.rentals (rentalid, clientid, serverid, rentalstart, rentalend, price) FROM stdin;
    public          postgres    false    220       4814.dat �          0    16407    servers 
   TABLE DATA           T   COPY public.servers (serverid, servername, cpu, ram, storage, location) FROM stdin;
    public          postgres    false    218       4812.dat �          0    16431    users 
   TABLE DATA           J   COPY public.users (userid, username, passwordhash, createdat) FROM stdin;
    public          postgres    false    222       4816.dat �           0    0    clients_clientid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.clients_clientid_seq', 10, true);
          public          postgres    false    215         �           0    0    rentals_rentalid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.rentals_rentalid_seq', 10, true);
          public          postgres    false    219         �           0    0    servers_serverid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.servers_serverid_seq', 10, true);
          public          postgres    false    217         �           0    0    users_userid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.users_userid_seq', 2, true);
          public          postgres    false    221         /           2606    16405    clients clients_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (clientid);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            postgres    false    216         3           2606    16419    rentals rentals_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (rentalid);
 >   ALTER TABLE ONLY public.rentals DROP CONSTRAINT rentals_pkey;
       public            postgres    false    220         1           2606    16412    servers servers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (serverid);
 >   ALTER TABLE ONLY public.servers DROP CONSTRAINT servers_pkey;
       public            postgres    false    218         5           2606    16437    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    222         7           2606    16439    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    222         8           2606    16420    rentals rentals_clientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.clients(clientid);
 G   ALTER TABLE ONLY public.rentals DROP CONSTRAINT rentals_clientid_fkey;
       public          postgres    false    220    4655    216         9           2606    16425    rentals rentals_serverid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_serverid_fkey FOREIGN KEY (serverid) REFERENCES public.servers(serverid);
 G   ALTER TABLE ONLY public.rentals DROP CONSTRAINT rentals_serverid_fkey;
       public          postgres    false    220    4657    218                                                                                                                                                                                                                                                                                                          4810.dat                                                                                            0000600 0004000 0002000 00000001100 14632042174 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Bob Smith	bob@example.com	555-2345	234 Oak Street
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


                                                                                                                                                                                                                                                                                                                                                                                                                                                                4814.dat                                                                                            0000600 0004000 0002000 00000000560 14632042174 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1	2024-01-01	2024-06-01	1000.00
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


                                                                                                                                                4812.dat                                                                                            0000600 0004000 0002000 00000000775 14632042174 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Server1	Intel Xeon E5-2670	64GB	1TB SSD	New York
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


   4816.dat                                                                                            0000600 0004000 0002000 00000000306 14632042174 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	replactionap	50703eae181c1b78834624d9af39102a14294d44505c2b2ad1bf2ca7534e4847	2024-06-11 12:50:00
1	admin	200747499121fb236605aefe8e4a09aa3e50f4ee02ab7174400967cc09729840	2015-01-01 00:05:00
\.


                                                                                                                                                                                                                                                                                                                          restore.sql                                                                                         0000600 0004000 0002000 00000020365 14632042174 0015375 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

DROP DATABASE "LZT.ServerRental";
--
-- Name: LZT.ServerRental; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "LZT.ServerRental" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "LZT.ServerRental" OWNER TO postgres;

\connect "LZT.ServerRental"

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
-- Name: clients_clientid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_clientid_seq OWNED BY public.clients.clientid;


--
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
-- Name: rentals_rentalid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rentals_rentalid_seq OWNED BY public.rentals.rentalid;


--
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
-- Name: servers_serverid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servers_serverid_seq OWNED BY public.servers.serverid;


--
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
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: clients clientid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN clientid SET DEFAULT nextval('public.clients_clientid_seq'::regclass);


--
-- Name: rentals rentalid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals ALTER COLUMN rentalid SET DEFAULT nextval('public.rentals_rentalid_seq'::regclass);


--
-- Name: servers serverid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers ALTER COLUMN serverid SET DEFAULT nextval('public.servers_serverid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (clientid, name, email, phone, address) FROM stdin;
\.
COPY public.clients (clientid, name, email, phone, address) FROM '$$PATH$$/4810.dat';

--
-- Data for Name: rentals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rentals (rentalid, clientid, serverid, rentalstart, rentalend, price) FROM stdin;
\.
COPY public.rentals (rentalid, clientid, serverid, rentalstart, rentalend, price) FROM '$$PATH$$/4814.dat';

--
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servers (serverid, servername, cpu, ram, storage, location) FROM stdin;
\.
COPY public.servers (serverid, servername, cpu, ram, storage, location) FROM '$$PATH$$/4812.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, username, passwordhash, createdat) FROM stdin;
\.
COPY public.users (userid, username, passwordhash, createdat) FROM '$$PATH$$/4816.dat';

--
-- Name: clients_clientid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_clientid_seq', 10, true);


--
-- Name: rentals_rentalid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rentals_rentalid_seq', 10, true);


--
-- Name: servers_serverid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servers_serverid_seq', 10, true);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 2, true);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (clientid);


--
-- Name: rentals rentals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (rentalid);


--
-- Name: servers servers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (serverid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: rentals rentals_clientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.clients(clientid);


--
-- Name: rentals rentals_serverid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_serverid_fkey FOREIGN KEY (serverid) REFERENCES public.servers(serverid);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           