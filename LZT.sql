PGDMP                       |            LZT.ServerRental    16.3    16.3 #    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    LZT.ServerRental    DATABASE     �   CREATE DATABASE "LZT.ServerRental" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
 "   DROP DATABASE "LZT.ServerRental";
                postgres    false            �            1259    16400    clients    TABLE     �   CREATE TABLE public.clients (
    clientid integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20),
    address character varying(255)
);
    DROP TABLE public.clients;
       public         heap    postgres    false            �            1259    16399    clients_clientid_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_clientid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.clients_clientid_seq;
       public          postgres    false    216            �           0    0    clients_clientid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.clients_clientid_seq OWNED BY public.clients.clientid;
          public          postgres    false    215            �            1259    16414    rentals    TABLE     �   CREATE TABLE public.rentals (
    rentalid integer NOT NULL,
    clientid integer,
    serverid integer,
    rentalstart date NOT NULL,
    rentalend date NOT NULL,
    price numeric(10,2) NOT NULL
);
    DROP TABLE public.rentals;
       public         heap    postgres    false            �            1259    16413    rentals_rentalid_seq    SEQUENCE     �   CREATE SEQUENCE public.rentals_rentalid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.rentals_rentalid_seq;
       public          postgres    false    220            �           0    0    rentals_rentalid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.rentals_rentalid_seq OWNED BY public.rentals.rentalid;
          public          postgres    false    219            �            1259    16407    servers    TABLE       CREATE TABLE public.servers (
    serverid integer NOT NULL,
    servername character varying(100) NOT NULL,
    cpu character varying(50) NOT NULL,
    ram character varying(50) NOT NULL,
    storage character varying(100) NOT NULL,
    location character varying(100) NOT NULL
);
    DROP TABLE public.servers;
       public         heap    postgres    false            �            1259    16406    servers_serverid_seq    SEQUENCE     �   CREATE SEQUENCE public.servers_serverid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.servers_serverid_seq;
       public          postgres    false    218            �           0    0    servers_serverid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.servers_serverid_seq OWNED BY public.servers.serverid;
          public          postgres    false    217            �            1259    16431    users    TABLE     �   CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(50) NOT NULL,
    passwordhash character varying(255) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16430    users_userid_seq    SEQUENCE     �   CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    222            �           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    221            )           2604    16403    clients clientid    DEFAULT     t   ALTER TABLE ONLY public.clients ALTER COLUMN clientid SET DEFAULT nextval('public.clients_clientid_seq'::regclass);
 ?   ALTER TABLE public.clients ALTER COLUMN clientid DROP DEFAULT;
       public          postgres    false    216    215    216            +           2604    16417    rentals rentalid    DEFAULT     t   ALTER TABLE ONLY public.rentals ALTER COLUMN rentalid SET DEFAULT nextval('public.rentals_rentalid_seq'::regclass);
 ?   ALTER TABLE public.rentals ALTER COLUMN rentalid DROP DEFAULT;
       public          postgres    false    219    220    220            *           2604    16410    servers serverid    DEFAULT     t   ALTER TABLE ONLY public.servers ALTER COLUMN serverid SET DEFAULT nextval('public.servers_serverid_seq'::regclass);
 ?   ALTER TABLE public.servers ALTER COLUMN serverid DROP DEFAULT;
       public          postgres    false    217    218    218            ,           2604    16434    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    221    222    222            �          0    16400    clients 
   TABLE DATA           H   COPY public.clients (clientid, name, email, phone, address) FROM stdin;
    public          postgres    false    216   J'       �          0    16414    rentals 
   TABLE DATA           ^   COPY public.rentals (rentalid, clientid, serverid, rentalstart, rentalend, price) FROM stdin;
    public          postgres    false    220   x(       �          0    16407    servers 
   TABLE DATA           T   COPY public.servers (serverid, servername, cpu, ram, storage, location) FROM stdin;
    public          postgres    false    218   )       �          0    16431    users 
   TABLE DATA           J   COPY public.users (userid, username, passwordhash, createdat) FROM stdin;
    public          postgres    false    222   (*       �           0    0    clients_clientid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.clients_clientid_seq', 10, true);
          public          postgres    false    215            �           0    0    rentals_rentalid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.rentals_rentalid_seq', 10, true);
          public          postgres    false    219            �           0    0    servers_serverid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.servers_serverid_seq', 10, true);
          public          postgres    false    217            �           0    0    users_userid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.users_userid_seq', 2, true);
          public          postgres    false    221            /           2606    16405    clients clients_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (clientid);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            postgres    false    216            3           2606    16419    rentals rentals_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (rentalid);
 >   ALTER TABLE ONLY public.rentals DROP CONSTRAINT rentals_pkey;
       public            postgres    false    220            1           2606    16412    servers servers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (serverid);
 >   ALTER TABLE ONLY public.servers DROP CONSTRAINT servers_pkey;
       public            postgres    false    218            5           2606    16437    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    222            7           2606    16439    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    222            8           2606    16420    rentals rentals_clientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.clients(clientid);
 G   ALTER TABLE ONLY public.rentals DROP CONSTRAINT rentals_clientid_fkey;
       public          postgres    false    220    4655    216            9           2606    16425    rentals rentals_serverid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_serverid_fkey FOREIGN KEY (serverid) REFERENCES public.servers(serverid);
 G   ALTER TABLE ONLY public.rentals DROP CONSTRAINT rentals_serverid_fkey;
       public          postgres    false    220    4657    218            �     x�m�MO�@����O1_@�[y�)*	�/^��hW�]�`�o�,I�\��4�ew����h[�c��e�����J'w�4���)4��;���1`��Yz7����Q�#hhcji��ܘ�fޝj�;��������le�E#��H�M����[5��s����U<>�Q�Shha����9������
C�u�������KN�|9�9/(o�����ݩ�S�4gz�u�9GNYڸ��n��b����B|��NV;����*���i��:8��ƚ��К�wK?:I��fͰ�      �   �   x�M��	�0��},'�%�ױ�&��� ��V茉�Ctη�\UDN�f�������#Ã/s�1��}����2<�ߨ��4��(M��As!�����472[ѹ��jQ�Af+J�w�F��+��6�{��~Ο<�      �     x�e��J�0G��=E^`�?M�^���;Ċl�M(acmT��mk�H��󝄢��f���c��x�wbä"Hf�
ч
�m������,"�M�ww�-V�PDY>�Y�����b��G����e��������s�鋇,2�b���2�����:>6��Z=���X�$�mAZ����]׏�I�	Ar����5��Z�<y�b��FM�_{��>OB�jIڗ�*?H�R�4ev��j4P���$��HZ1��mQ<]�7ˑ��      �   �   x��K�1��u�)r�J�dY9�ld��Ƀ���x{��/���|�kSJFR�A�Z+RYN�Y��A�.��Bw�����ER���`9P��Uqv������ĝ�f�R+4rfK	xDIŔ��ӍL�jc���	@z��.X���?���0|     