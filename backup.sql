--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

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
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blogs (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    descricao character varying(255),
    texto text NOT NULL,
    autor character varying(255) NOT NULL,
    img_id integer,
    ativo boolean DEFAULT true,
    usuario_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.blogs OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: compraevendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compraevendas (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    modelo text,
    descricao character varying(255),
    valor character varying(255),
    img_id integer,
    usuario_id integer NOT NULL,
    ativo boolean DEFAULT true,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    ano integer
);


ALTER TABLE public.compraevendas OWNER TO postgres;

--
-- Name: compraevendas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compraevendas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compraevendas_id_seq OWNER TO postgres;

--
-- Name: compraevendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compraevendas_id_seq OWNED BY public.compraevendas.id;


--
-- Name: contatoforms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contatoforms (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    telefone character varying(255),
    assunto character varying(255),
    mensagem text NOT NULL,
    lida boolean DEFAULT false,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.contatoforms OWNER TO postgres;

--
-- Name: contatoforms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contatoforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contatoforms_id_seq OWNER TO postgres;

--
-- Name: contatoforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contatoforms_id_seq OWNED BY public.contatoforms.id;


--
-- Name: detalhescvs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalhescvs (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    descricao text,
    cv_id integer NOT NULL,
    usuario_id integer NOT NULL,
    ativo boolean DEFAULT true,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.detalhescvs OWNER TO postgres;

--
-- Name: detalhescvs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalhescvs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalhescvs_id_seq OWNER TO postgres;

--
-- Name: detalhescvs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalhescvs_id_seq OWNED BY public.detalhescvs.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: ondeestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ondeestamos (
    id integer NOT NULL,
    responsavel character varying(255),
    email character varying(255) NOT NULL,
    telefone character varying(255),
    cep character varying(255) NOT NULL,
    rua character varying(255) NOT NULL,
    numero integer NOT NULL,
    complemento character varying(255),
    bairro character varying(255) NOT NULL,
    cidade character varying(255) NOT NULL,
    uf character varying(255) NOT NULL,
    mapa text,
    img_id integer,
    usuario_id integer NOT NULL,
    ativo boolean DEFAULT true,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.ondeestamos OWNER TO postgres;

--
-- Name: ondeestamos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ondeestamos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ondeestamos_id_seq OWNER TO postgres;

--
-- Name: ondeestamos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ondeestamos_id_seq OWNED BY public.ondeestamos.id;


--
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    descricao text,
    codigo character varying(255),
    marca character varying(255),
    embalagem character varying(255),
    peso character varying(255),
    informacaoalergica character varying(255),
    garantia character varying(255),
    paisorigem character varying(255),
    img_id integer,
    usuario_id integer NOT NULL,
    ativo boolean DEFAULT true,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produtos_id_seq OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255),
    admin boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    img_id integer
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Name: compraevendas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compraevendas ALTER COLUMN id SET DEFAULT nextval('public.compraevendas_id_seq'::regclass);


--
-- Name: contatoforms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contatoforms ALTER COLUMN id SET DEFAULT nextval('public.contatoforms_id_seq'::regclass);


--
-- Name: detalhescvs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalhescvs ALTER COLUMN id SET DEFAULT nextval('public.detalhescvs_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: ondeestamos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ondeestamos ALTER COLUMN id SET DEFAULT nextval('public.ondeestamos_id_seq'::regclass);


--
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20200329073206-create-usuarios.js
20200415154844-create-files.js
20200403005533-create-blog.js
20200417085028-create-produtos.js
20200417191620-create-contatoforms.js
20200419012158-create-ondeestamos.js
20200421084710-add-img-field-to-usuarios.js
20200514074735-create-compraevenda.js
20200514103321-create-blog.js
20200604001705-add-field-ano-to-compraevenda.js
20200604041911-create-detalhescv.js
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blogs (id, titulo, descricao, texto, autor, img_id, ativo, usuario_id, created_at, updated_at) FROM stdin;
1	Novo modelo de helicóptero chega na HCS 6	Modelo XYZ já está disponível para táxi aéreo.	Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal.	Verena Solheiro	2	t	1	2020-06-04 03:52:30.932+00	2020-06-04 03:52:30.932+00
2	Novo modelo de helicóptero chega na HCS	Modelo XYZ já está disponível para táxi aéreo.	Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal.	Verena Solheiro	2	t	1	2020-06-04 03:52:45.131+00	2020-06-04 03:52:45.131+00
3	Novo modelo de helicóptero chega na HCS 2	Modelo XYZ já está disponível para táxi aéreo.	Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal.	Verena Solheiro	2	t	1	2020-06-04 03:52:49.877+00	2020-06-04 03:52:49.877+00
4	Novo modelo de helicóptero chega na HCS 3	Modelo XYZ já está disponível para táxi aéreo.	Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal.	Verena Solheiro	2	t	1	2020-06-04 03:52:53.481+00	2020-06-04 03:52:53.481+00
5	Novo modelo de helicóptero chega na HCS 4	Modelo XYZ já está disponível para táxi aéreo.	Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal.	Verena Solheiro	2	t	1	2020-06-04 03:52:57.433+00	2020-06-04 03:52:57.433+00
6	Novo modelo de helicóptero chega na HCS 5	Modelo XYZ já está disponível para táxi aéreo.	Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal. Tal tal tal tal tal, tal tal.	Verena Solheiro	2	t	1	2020-06-04 03:53:00.087+00	2020-06-04 03:53:00.087+00
\.


--
-- Data for Name: compraevendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compraevendas (id, nome, modelo, descricao, valor, img_id, usuario_id, ativo, created_at, updated_at, ano) FROM stdin;
2	AGUSTA A109E POWER ELITE	880 H.T. 1070 CICLOS	1850 H.T.	US$ 1,700,000.00	4	1	t	2020-05-14 11:02:41.506+00	2020-06-04 17:54:49.92+00	\N
1	R66 TURBINE | ROBINSON HELICOPTER	880 H.T. 1070 CICLOS	Aeronave super moderna.	R$ 2.600.000,00	3	1	t	2020-05-14 10:31:43.186+00	2020-06-04 17:55:08.74+00	\N
3	AS 350 B2 | HELIBRÁS	700 HT	Aeronave super moderna.	US$ 1,600,000.00	5	1	t	2020-05-14 11:02:43.551+00	2020-06-04 18:03:15.263+00	\N
4	206L4 | BELL HELICOPTER	4.800 H.T.	Aeronave super moderna.	R$ 5.500.000,00	6	1	t	2020-05-14 11:02:45.796+00	2020-06-04 18:12:00.564+00	\N
5	LONG RANGER 206L-4 | BELL HELICOPTER	1580 H.T.	Aeronave super moderna.	U$ 1,700,000.00	7	1	t	2020-05-14 11:02:47.442+00	2020-06-04 18:12:05.926+00	\N
6	R22 BETA II | ROBINSON HELICOPTER	250 H.T.	Aeronave super moderna.	US$ 220,000.00	8	1	t	2020-05-14 11:02:49.011+00	2020-06-04 18:15:42.62+00	\N
\.


--
-- Data for Name: contatoforms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contatoforms (id, nome, email, telefone, assunto, mensagem, lida, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: detalhescvs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalhescvs (id, titulo, descricao, cv_id, usuario_id, ativo, created_at, updated_at) FROM stdin;
1	Aviônicos e Rádios	- Horizonte Artificial;- Coordenador de Curvas;- Bússola Vertical;- GPS/COM Garmin GNC 420W;- Transponder GTX 330 Modo S;- Remote Altitude Enconder;- NAA12 Controller	1	1	t	2020-06-04 14:07:27.803+00	2020-06-04 14:07:27.803+00
2	Equipamentos Adicionais	- Ar Condicionado	1	1	t	2020-06-04 14:09:29.1+00	2020-06-04 14:09:29.1+00
3	Exterior	Pintura em Excelente Estado	1	1	t	2020-06-04 14:10:29.877+00	2020-06-04 14:10:29.877+00
4	Interior	Bancos em Couro Cinza em Excelente Estado	1	1	t	2020-06-04 14:10:41.674+00	2020-06-04 14:10:41.674+00
5	Observação	A aeronave acima é de terceiro e como tal sujeita a venda prévia e/ou alteração de preço. Dados fornecidos pelo proprietário, sujeitos a verificação.	1	1	t	2020-06-04 14:11:27.185+00	2020-06-04 14:11:27.185+00
6	 	Empty Weight 2014 Kg – MGW 2850 Kg; Aircraft Total Hours: 1850; Pratt & Whitney PW206C Engines; Single Pilot IFR / RAI-FAA Certified	2	1	t	2020-06-04 17:56:28.343+00	2020-06-04 17:56:28.343+00
7	INSTALLED ACCESSORIES	-Dual Controls;-Pilot/Co-Pilot Windshield Wipers;-Main Transmission Vibration Dampers;-Wiper Switch on Cyclic Grip;-Co-Pilot’s Instruments;-“Paulstra” Soundproofing;-Baggage Compartment Cover Extension;-Pilot Multipurpose Holder / Console Tray;-Locking Fuel Filler Cap;-214 US Gallon Fuel System;-Rotor Brake;-Retractable Landing Light;-Engine Compartment Fire Extinguishers;-Electrically Operated Passenger Step;-MP3 CD Player/Ipod Connection -Heavy Duty Battery;-Pulsed Chip Detectors;-Rotor Blade Tie Downs & Wheel Chocks;-ECU (Heating & Air Conditioning)	2	1	t	2020-06-04 17:58:10.58+00	2020-06-04 17:58:10.58+00
8	INSTALLED AVIONICS	-Honeywell SP-711 3-Axis Duplex Autopilot;-Dual Collins VHF-22A VHF Coms;-Dual Collins VIR-32 VHF Navs;-Collins TDR-90 Transponder w/ Mode C;-Trimble 2101 I/O GPS Nav;-Collins ADF-60 ADF;-Rogerson Kratos Pilot/Co-Pilot LCD;-EADI/EFIS;-Avionics Master Switch/Ground Function;-Collins DME 42;-Honeywell FZ-702Flight Director w/ Auto-Trim;-Standby Attitude Indicator;-Honeywell C-14 Slaved Compass -System;-Honeywell RDR-2000 WX Radar;-Artex ELT;-Honeywell AA300 Radio Altimeter;-Dual AC Inverters;-Bendix King - Moving Map;-Honeywell C-14 Slaved Compass System;-NAT Intercom System;-6 Bose X ANR Headsets;-Pilot & Co-Pilot EFIS on Command Switch;-TCAS	2	1	t	2020-06-04 17:59:10.225+00	2020-06-04 17:59:10.225+00
9	INTERIOR	Custom Executive Interior of Gray Leather to Include “PAULSTRA” Soundproofing System with VVIP 3 Seats Aft Facing Bench with See-Through Armrest and Lower Cooled Cabinet and 3 VVIP Forward Facing Seats with Central Armrest. Covered Liners are in Matching Leatherette with Co Coordinated VIP Pilot & Co-Pilot Seats with Headrests.	2	1	t	2020-06-04 17:59:56.108+00	2020-06-04 17:59:56.108+00
10	Observação	A aeronave acima é de terceiro e como tal sujeita a venda prévia e/ou alteração de preço. Dados fornecidos pelo proprietário, sujeitos a verificação.	2	1	t	2020-06-04 18:00:09.808+00	2020-06-04 18:00:09.808+00
11	Configuração	Acabamento luxo;Revestimento isonorizante;Revestimento dos bancos e das almofadas em couro.;Revestimento das portas, do teto, das paredes laterais e traseiras em couro.;Saia dos bancos traseiros em couro.;Carpete no piso da cabine e bagageiros;Proteção em inox para o kit de rolagem;Pintura de faixas de alta visibilidade das pás principais	3	1	t	2020-06-04 18:04:14.368+00	2020-06-04 18:04:14.368+00
12	Equipamentos	Giro horizonte Thales H321 EHM;• Giro-bússola KING KCS-55A-06 com sistema pictorial de nav. KING KI 525;• VHF/VOR/LOC/GS/GPS Garmin GNS 430;• VHF/VOR/LOC/GS Honeywell KX 165 A;• Transponder (mode A + C) Garmin GTX 327;• Codificador de Altitude Shadin 8800T;• ICS GARMIN GMA 340 H + Interfone de passageiros;• ELT Kannad 406;• Chaveamento de rádios no cíclico;• Chave master de rádios;• 2o Farol de táxi (450 watts);• Cronômetro;• Pulse light;• MFD EX600 AVIDYNE;• STORMSCOPE WX 500 (indicado no MFD EX600);• TAS 600 AVIDYNE (indicado no MFD EX600);• Entretenimento composto por DVD Player Sony com tela de LCD;• 6 fones Bose.;• Porta esquerda deslizante;• Trem de pouso alto com degraus alongados;• Ar condicionado;• Duplo comando;• Limpador de pára-brisa do piloto;• Strobe light estabilizador horizontal	3	1	t	2020-06-04 18:04:58.346+00	2020-06-04 18:04:58.346+00
13	Observação	A aeronave acima é de terceiro e como tal sujeita a venda prévia e/ou alteração de preço. Dados fornecidos pelo proprietário, sujeitos a verificação.	3	1	t	2020-06-04 18:05:33.258+00	2020-06-04 18:05:33.258+00
14	Aviônicos / Rádios	• Bendix King KMA-24 - Audio Panel;• Trimble GPS TNL 2000A;• Bendix King KX-165 Nav/Comm With Glideslope;• Bendix King KY-196A VHF Com Transceiver;• Bendix King KR-87 SYSTEM (SV) ADF System;• Bendix King KT-76C Mode A/C Transponder;• Horizonte Artificial	4	1	t	2020-06-04 18:09:13.541+00	2020-06-04 18:09:13.541+00
15	Observação	A aeronave acima é de terceiro e como tal sujeita a venda prévia e/ou alteração de preço. Dados fornecidos pelo proprietário, sujeitos a verificação.	4	1	t	2020-06-04 18:09:28.932+00	2020-06-04 18:09:28.932+00
16	Equipamentos	• Corta Fio;• Esqui Alto;• Interior VIP;• Fones Bose;• Duplo Comando;• Separador de partículas;• Homologado Aeromedico;• TPX SAE;• Cargo hook com capacidade para 900 kg;• Ar Condicionado	5	1	t	2020-06-04 18:13:14.238+00	2020-06-04 18:13:14.238+00
17	Observação	A aeronave acima é de terceiro e como tal sujeita a venda prévia e/ou alteração de preço. Dados fornecidos pelo proprietário, sujeitos a verificação.	5	1	t	2020-06-04 18:13:29.407+00	2020-06-04 18:13:29.407+00
18	Equipamentos	• PS GARMIN GNS 430;• TRANSPONDER GARMIN GTX 327;• INDICADOR VOR INTEGRADO COM GARMIN 430;• VSI: INDICADOR DE VELOCIDADE VERTICAL;• INDICADOR DE VELOCIDADE DO VENTO;• ALTIMETRO;• AUDIO CONTROLLER;• GIRO DIRECTIONAL COM TURN BUNK;• HORIZONTE ARTIFICIAL COM SLIP/SKID INDICADOR;• LUZES DE LED, XENON	6	1	t	2020-06-04 18:16:28.666+00	2020-06-04 18:16:28.666+00
19	Observação	A aeronave acima é de terceiro e como tal sujeita a venda prévia e/ou alteração de preço. Dados fornecidos pelo proprietário, sujeitos a verificação.	6	1	t	2020-06-04 18:16:38.649+00	2020-06-04 18:16:38.649+00
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, name, path, created_at, updated_at) FROM stdin;
1	aeronave.png	971bea694954cc18619f041f2292de4d.png	2020-05-14 08:32:53.642+00	2020-05-14 08:32:53.642+00
2	helicoptero.jpg	4c1e09cd9650a122c56518c8aa341328.jpg	2020-05-14 10:23:41.976+00	2020-05-14 10:23:41.976+00
3	01.jpg	f541edb1975da36510546f6d8e9b2b5c.jpg	2020-06-03 21:50:27.868+00	2020-06-03 21:50:27.868+00
4	01.jpg	60fb74e0a0e55519187a559457870535.jpg	2020-06-04 17:53:42.898+00	2020-06-04 17:53:42.898+00
5	01.jpg	e6e839c7905ff023c09d34cd55f3e864.jpg	2020-06-04 18:02:06.997+00	2020-06-04 18:02:06.997+00
6	01.jpg	bf98bed5b1abac8d3f40cb9b5952bb7b.jpg	2020-06-04 18:07:28.934+00	2020-06-04 18:07:28.934+00
7	01.jpg	99a18f47b6e76e992f89e5f34f341bba.jpg	2020-06-04 18:11:11.984+00	2020-06-04 18:11:11.984+00
8	01.jpg	0f6ccaefbd0ce576ebf0a463a9be43a3.jpg	2020-06-04 18:15:03.935+00	2020-06-04 18:15:03.935+00
\.


--
-- Data for Name: ondeestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ondeestamos (id, responsavel, email, telefone, cep, rua, numero, complemento, bairro, cidade, uf, mapa, img_id, usuario_id, ativo, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, nome, descricao, codigo, marca, embalagem, peso, informacaoalergica, garantia, paisorigem, img_id, usuario_id, ativo, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nome, email, password_hash, admin, created_at, updated_at, img_id) FROM stdin;
1	Alexandre Feio	alefeio@gmail.com	$2a$08$uWYRgYqVRFWfQcviiKeZ9.21/DRgJVeA9IKhspGl9XqojpT.2TAUi	t	2020-05-14 08:32:05.674+00	2020-05-14 08:32:05.674+00	\N
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blogs_id_seq', 6, true);


--
-- Name: compraevendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compraevendas_id_seq', 7, true);


--
-- Name: contatoforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contatoforms_id_seq', 1, false);


--
-- Name: detalhescvs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalhescvs_id_seq', 19, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 8, true);


--
-- Name: ondeestamos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ondeestamos_id_seq', 1, false);


--
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 1, false);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, true);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: compraevendas compraevendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compraevendas
    ADD CONSTRAINT compraevendas_pkey PRIMARY KEY (id);


--
-- Name: contatoforms contatoforms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contatoforms
    ADD CONSTRAINT contatoforms_pkey PRIMARY KEY (id);


--
-- Name: detalhescvs detalhescvs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalhescvs
    ADD CONSTRAINT detalhescvs_pkey PRIMARY KEY (id);


--
-- Name: files files_path_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_path_key UNIQUE (path);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: ondeestamos ondeestamos_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ondeestamos
    ADD CONSTRAINT ondeestamos_email_key UNIQUE (email);


--
-- Name: ondeestamos ondeestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ondeestamos
    ADD CONSTRAINT ondeestamos_pkey PRIMARY KEY (id);


--
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: blogs blogs_img_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_img_id_fkey FOREIGN KEY (img_id) REFERENCES public.files(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: blogs blogs_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: compraevendas compraevendas_img_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compraevendas
    ADD CONSTRAINT compraevendas_img_id_fkey FOREIGN KEY (img_id) REFERENCES public.files(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: compraevendas compraevendas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compraevendas
    ADD CONSTRAINT compraevendas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: detalhescvs detalhescvs_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalhescvs
    ADD CONSTRAINT detalhescvs_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ondeestamos ondeestamos_img_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ondeestamos
    ADD CONSTRAINT ondeestamos_img_id_fkey FOREIGN KEY (img_id) REFERENCES public.files(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ondeestamos ondeestamos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ondeestamos
    ADD CONSTRAINT ondeestamos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: produtos produtos_img_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_img_id_fkey FOREIGN KEY (img_id) REFERENCES public.files(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: produtos produtos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuarios usuarios_img_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_img_id_fkey FOREIGN KEY (img_id) REFERENCES public.files(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

