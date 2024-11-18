--
-- PostgreSQL database dump
--

-- Dumped from database version 14.14 (Homebrew)
-- Dumped by pg_dump version 14.14 (Homebrew)

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
-- Name: country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.country (
    cname character varying(50) NOT NULL,
    population bigint
);


--
-- Name: discover; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discover (
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    first_enc_date date
);


--
-- Name: disease; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.disease (
    disease_code character varying(50) NOT NULL,
    pathogen character varying(20),
    description character varying(140),
    id integer
);


--
-- Name: diseasetype; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.diseasetype (
    id integer NOT NULL,
    description character varying(140)
);


--
-- Name: doctor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.doctor (
    email character varying(60) NOT NULL,
    degree character varying(20)
);


--
-- Name: patientdisease; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.patientdisease (
    email character varying(60) NOT NULL,
    disease_code character varying(50) NOT NULL
);


--
-- Name: patients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.patients (
    email character varying(60) NOT NULL
);


--
-- Name: publicservant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.publicservant (
    email character varying(60) NOT NULL,
    department character varying(50)
);


--
-- Name: record; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.record (
    email character varying(60) NOT NULL,
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    total_deaths integer,
    total_patients integer
);


--
-- Name: specialize; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.specialize (
    id integer NOT NULL,
    email character varying(60) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    email character varying(60) NOT NULL,
    name character varying(30),
    surname character varying(40),
    salary integer,
    phone character varying(20),
    cname character varying(50)
);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.country (cname, population) FROM stdin;
Algeria	46814308
Austria	9120813
Bangladesh	173562364
Brazil	211998573
China	1419321278
Denmark	5977412
Ethiopia	132059767
France	66548530
Germany	84373946
Greece	10047817
India	1450935791
Indonesia	283487931
Italy	59342867
Japan	123753041
Kazakhstan	20592571
Nigeria	232679478
Pakistan	251269164
Russia	144820423
UK	69292801
USA	345426571
\.


--
-- Data for Name: discover; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.discover (cname, disease_code, first_enc_date) FROM stdin;
Algeria	MALARIA	1880-01-01
Austria	ATHEROSCL	1852-01-01
Brazil	CHAGAS	1909-01-01
Brazil	TOXO	1908-01-01
China	COVID19	2019-12-01
Denmark	MEASLES	1846-01-01
France	DEPRESSION	1856-01-01
France	HIV	1983-01-01
France	RA	1800-01-01
France	SKINTUMOR	1804-01-01
Germany	CANDID	1839-01-01
Germany	GIARDIA	1859-01-01
Germany	TB	1882-03-24
Greece	RINGWORM	0500-01-01
Italy	ASPERGIL	1729-01-01
Italy	CHOLERA	1854-08-17
Italy	HYPERTEN	1896-01-01
Japan	DENGUE	1943-01-01
UK	ALLERGIES	1819-01-01
UK	DIABETES	1674-01-01
UK	EPILEPSY	1861-01-01
UK	FLU	1933-01-01
UK	HYPOTHY	1873-01-01
UK	LUPUS	1786-01-01
UK	STREP	1874-11-01
UK	TYPHOID	1880-11-01
USA	BREASTCANCER	1894-01-01
USA	HYPERAD	1912-01-01
USA	IBS	1940-01-01
\.


--
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.disease (disease_code, pathogen, description, id) FROM stdin;
ALLERGIES	N/A	Allergies	11
ASPERGIL	Fungus	Aspergillosis	2
ATHEROSCL	N/A	Atherosclerosis	6
BREASTCANCER	N/A	Breast Cancer	5
CANDID	Fungus	Candidiasis	2
CHAGAS	Protist	Chagas Disease	3
CHOLERA	Bacteria	Cholera	1
COVID19	Virus	COVID-19	4
DENGUE	Virus	Dengue Fever	4
DEPRESSION	N/A	Depression	9
DIABETES	N/A	Diabetes	8
EPILEPSY	N/A	Epilepsy	9
FLU	Virus	Influenza	4
GIARDIA	Protist	Giardiasis	3
HISTO	Fungus	Histoplasmosis	2
HIV	Virus	HIV	11
HYPERAD	N/A	Hyperadrenocorticism	10
HYPERTEN	N/A	Hypertension	6
HYPOTHY	N/A	Hypothyroidism	10
IBS	N/A	Irritable Bowel Syndrome	8
LUPUS	N/A	Lupus	7
MALARIA	Protist	Malaria	3
MEASLES	Virus	Measles	4
RA	N/A	Rheumatoid Arthritis	7
RINGWORM	Fungus	Ringworm	2
SKINTUMOR	N/A	Skin Tumor	5
STREP	Bacteria	Strep Throat	1
TB	Bacteria	Tuberculosis	1
TOXO	Protist	Toxoplasmosis	3
TYPHOID	Bacteria	Typhoid Fever	1
\.


--
-- Data for Name: diseasetype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.diseasetype (id, description) FROM stdin;
1	Bacterial Diseases
2	Fungal Diseases
3	Protist Diseases
4	Viral Diseases
5	Cancers and Benign Tumors
6	Circulatory System Diseases
7	Connective Tissue Diseases
8	Digestive System Diseases and Metabolic Diseases
9	Nervous System Diseases and Mental Diseases
10	Endocrine System Diseases
11	Immune Diseases
12	Virology
13	Infectious Diseases
\.


--
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.doctor (email, degree) FROM stdin;
aibek.atrs@gmail.com	MD
akmalbek_uz@gmail.com	MD
alina.protassova@gmail.com	MD
amirbek_kaz@gmail.com	MD
dr.kapoor@gmail.com	PhD
george_muller_germany@gmail.com	MD
imane_ghazi_algeria@gmail.com	PhD
karine.alipova@gmail.com	PhD
lalabek.pernegul@gmail.com	MD
lara_schmidt_germany@gmail.com	MD
lucas_martin_france@gmail.com	MD
maria_oliveira@gmail.com	MD
mohammed_brahimi_algeria@gmail.com	MD
mr.badben@gmail.com	PhD
nora_durand_france@gmail.com	PhD
nurlanbek_kaz@gmail.com	MD
olivia.rodrigez@gmail.com	MD
rahim_hasan@gmail.com	PhD
zhannabek_kaz@gmail.com	PhD
\.


--
-- Data for Name: patientdisease; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.patientdisease (email, disease_code) FROM stdin;
abebe_kebede@gmail.com	CANDID
abebe_kebede@gmail.com	TB
adi_santoso@gmail.com	CANDID
aldibek_karat@gmail.com	COVID19
amaka_nwosu@gmail.com	HIV
arjun_verma@gmail.com	IBS
asylgul_sabyr@gmail.com	STREP
bakytgul_ab@gmail.com	ALLERGIES
carlos_souza@gmail.com	IBS
chinedu_okafor@gmail.com	HYPERTEN
ivan_petrov@gmail.com	CANDID
ivan_petrov@gmail.com	DEPRESSION
joao_silva@gmail.com	HYPOTHY
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.patients (email) FROM stdin;
abebe_kebede@gmail.com
adi_santoso@gmail.com
aldibek_karat@gmail.com
amaka_nwosu@gmail.com
arjun_verma@gmail.com
asylgul_sabyr@gmail.com
bakytgul_ab@gmail.com
carlos_souza@gmail.com
chinedu_okafor@gmail.com
ivan_petrov@gmail.com
joao_silva@gmail.com
\.


--
-- Data for Name: publicservant; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.publicservant (email, department) FROM stdin;
aibek_nur@gmail.com	Nutrition Services
ali_khan@gmail.com	Mental Health Services
aripova_k@gmail.com	Healthcare Administration
fatima_yousaf@gmail.com	Disease Surveillance
gulnara_kz@gmail.com	Maternal and Child Health
john_smith@gmail.com	Emergency Response
ling_zhang@gmail.com	Emergency Response
nurbek_alma@gmail.com	Maternal and Child Health
priya_patel@gmail.com	Emergency Response
sydab_piano@gmail.com	Healthcare Administration
wei_liu@gmail.com	Nutrition Services
\.


--
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.record (email, cname, disease_code, total_deaths, total_patients) FROM stdin;
aripova_k@gmail.com	Kazakhstan	COVID19	1	20
aibek_nur@gmail.com	Kazakhstan	DIABETES	40	705
ali_khan@gmail.com	Pakistan	DEPRESSION	5	844
aripova_k@gmail.com	Kazakhstan	EPILEPSY	15	500
fatima_yousaf@gmail.com	Pakistan	TB	400	1200
gulnara_kz@gmail.com	Kazakhstan	MALARIA	50	2002
john_smith@gmail.com	USA	MALARIA	103	3405
ling_zhang@gmail.com	China	IBS	354	2000
nurbek_alma@gmail.com	Kazakhstan	HIV	5	59
priya_patel@gmail.com	India	CHOLERA	250	1204
sydab_piano@gmail.com	Kazakhstan	COVID19	180	300
wei_liu@gmail.com	China	TYPHOID	300	1563
\.


--
-- Data for Name: specialize; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.specialize (id, email) FROM stdin;
1	lucas_martin_france@gmail.com
1	maria_oliveira@gmail.com
2	rahim_hasan@gmail.com
3	alina.protassova@gmail.com
3	amirbek_kaz@gmail.com
4	nurlanbek_kaz@gmail.com
5	zhannabek_kaz@gmail.com
6	akmalbek_uz@gmail.com
7	mohammed_brahimi_algeria@gmail.com
8	imane_ghazi_algeria@gmail.com
9	george_muller_germany@gmail.com
10	lara_schmidt_germany@gmail.com
11	nora_durand_france@gmail.com
12	aibek.atrs@gmail.com
12	alina.protassova@gmail.com
12	dr.kapoor@gmail.com
12	lalabek.pernegul@gmail.com
12	mr.badben@gmail.com
12	olivia.rodrigez@gmail.com
13	alina.protassova@gmail.com
13	karine.alipova@gmail.com
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (email, name, surname, salary, phone, cname) FROM stdin;
abebe_kebede@gmail.com	Abebe	Kebede	750000	2519000000001	Ethiopia
adi_santoso@gmail.com	Adi	Santoso	850000	6285100000041	Indonesia
aibek.atrs@gmail.com	Aibek	Atbasar	180000	87783542452	Kazakhstan
aibek_nur@gmail.com	Aibek	Nurpeisov	155000	87787777778	Kazakhstan
akmalbek_uz@gmail.com	Akmal	Rakhmetov	180000	77291234567	Kazakhstan
aldibek_karat@gmail.com	Aldibek	Karataiuly	1405000	87017777782	Kazakhstan
ali_khan@gmail.com	Ali	Khan	950000	923000000001	Pakistan
alina.protassova@gmail.com	Alina	Protassova	183000	87783542422	Kazakhstan
amaka_nwosu@gmail.com	Amaka	Nwosu	75000	2348000000002	Nigeria
amirbek_kaz@gmail.com	Amirbek	Kassymov	250000	77011234567	Kazakhstan
aripova_k@gmail.com	Karine	Aripova	2000000	87787777777	Kazakhstan
arjun_verma@gmail.com	Arjun	Verma	110000	919810000041	India
asylgul_sabyr@gmail.com	Asylgul	Sabyrkhanova	125000	87017777783	Kazakhstan
bakytgul_ab@gmail.com	Bakytgul	Abenova	130000	87017777781	Kazakhstan
carlos_souza@gmail.com	Carlos	Souza	1050000	5511900000003	Brazil
chinedu_okafor@gmail.com	Chinedu	Okafor	800000	2348000000001	Nigeria
dr.kapoor@gmail.com	Amit	Kapoor	140000	9991112233	India
fatima_yousaf@gmail.com	Fatima	Yousaf	900000	923000000002	Pakistan
george_muller_germany@gmail.com	George	Muller	380000	493112345678	Germany
gulnara_kz@gmail.com	Gulnara	Baigulova	120000	87027777779	Kazakhstan
imane_ghazi_algeria@gmail.com	Imane	Ghazi	230000	213561234568	Algeria
ivan_petrov@gmail.com	Ivan	Petrov	570000	749500000001	Russia
joao_silva@gmail.com	Joao	Silva	100000	5511900000001	Brazil
john_smith@gmail.com	John	Smith	2000000	123456789	USA
karine.alipova@gmail.com	Karine	Alipova	1502000	87774551230	Kazakhstan
lalabek.pernegul@gmail.com	Lalabek	Pernegul	150000	87774561230	Kazakhstan
lara_schmidt_germany@gmail.com	Lara	Schmidt	390000	493122345678	Germany
ling_zhang@gmail.com	Ling	Zhang	900000	8613900000051	China
lucas_martin_france@gmail.com	Lucas	Martin	3800000	334561234568	France
maria_oliveira@gmail.com	Maria	Oliveira	950000	5511900000002	Brazil
mohammed_brahimi_algeria@gmail.com	Mohammed	Brahimi	240000	213561234567	Algeria
mr.badben@gmail.com	Carlos	Badben	130000	8883334455	USA
nora_durand_france@gmail.com	Nora	Durand	370000	334561234567	France
nurbek_alma@gmail.com	Nurbek	Almagulov	180000	87473777780	Kazakhstan
nurlanbek_kaz@gmail.com	Nurlanbek	Suleimenov	30000	77013456789	Kazakhstan
olivia.rodrigez@gmail.com	Olivia	Rodrigez	160000	4442221133	France
priya_patel@gmail.com	Priya	Patel	105000	919810000042	India
rahim_hasan@gmail.com	Rahim	Hasan	850000	8801700000001	Bangladesh
sydab_piano@gmail.com	Abylay	Sydykov	150000	87017777784	Kazakhstan
wei_liu@gmail.com	Wei	Liu	95000	8613900000056	China
zhannabek_kaz@gmail.com	Zhanna	Bekmuratova	220000	77014567890	Kazakhstan
\.


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (cname);


--
-- Name: discover discover_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_pkey PRIMARY KEY (cname, disease_code);


--
-- Name: disease disease_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY (disease_code);


--
-- Name: diseasetype diseasetype_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diseasetype
    ADD CONSTRAINT diseasetype_pkey PRIMARY KEY (id);


--
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (email);


--
-- Name: patientdisease patientdisease_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patientdisease
    ADD CONSTRAINT patientdisease_pkey PRIMARY KEY (email, disease_code);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (email);


--
-- Name: publicservant publicservant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_pkey PRIMARY KEY (email);


--
-- Name: record record_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_pkey PRIMARY KEY (email, cname, disease_code);


--
-- Name: specialize specialize_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_pkey PRIMARY KEY (id, email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);


--
-- Name: discover discover_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


--
-- Name: discover discover_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code);


--
-- Name: disease disease_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id);


--
-- Name: doctor doctor_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_email_fkey FOREIGN KEY (email) REFERENCES public.users(email) ON DELETE CASCADE;


--
-- Name: patientdisease patientdisease_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patientdisease
    ADD CONSTRAINT patientdisease_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code);


--
-- Name: patientdisease patientdisease_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patientdisease
    ADD CONSTRAINT patientdisease_email_fkey FOREIGN KEY (email) REFERENCES public.users(email) ON DELETE CASCADE;


--
-- Name: patients patients_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_email_fkey FOREIGN KEY (email) REFERENCES public.users(email) ON DELETE CASCADE;


--
-- Name: publicservant publicservant_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_email_fkey FOREIGN KEY (email) REFERENCES public.users(email) ON DELETE CASCADE;


--
-- Name: record record_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


--
-- Name: record record_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code);


--
-- Name: record record_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_email_fkey FOREIGN KEY (email) REFERENCES public.publicservant(email) ON DELETE CASCADE;


--
-- Name: specialize specialize_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_email_fkey FOREIGN KEY (email) REFERENCES public.doctor(email) ON DELETE CASCADE;


--
-- Name: specialize specialize_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id);


--
-- Name: users users_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


--
-- PostgreSQL database dump complete
--

