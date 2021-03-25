--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: marketplace; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE marketplace WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


\connect marketplace

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
-- Name: buyer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.buyer (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    catalog_id integer NOT NULL
);


--
-- Name: buyer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.buyer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: buyer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.buyer_id_seq OWNED BY public.buyer.id;


--
-- Name: catalog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.catalog (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


--
-- Name: catalog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.catalog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.catalog_id_seq OWNED BY public.catalog.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    visibility character varying(30) NOT NULL,
    price numeric(10,2) NOT NULL
);


--
-- Name: product_catalog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_catalog (
    id integer NOT NULL,
    product_id integer NOT NULL,
    catalog_id integer NOT NULL
);


--
-- Name: product_catalog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_catalog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_catalog_id_seq OWNED BY public.product_catalog.id;


--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: buyer id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buyer ALTER COLUMN id SET DEFAULT nextval('public.buyer_id_seq'::regclass);


--
-- Name: catalog id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catalog ALTER COLUMN id SET DEFAULT nextval('public.catalog_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: product_catalog id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_catalog ALTER COLUMN id SET DEFAULT nextval('public.product_catalog_id_seq'::regclass);


--
-- Name: buyer buyer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT buyer_pkey PRIMARY KEY (id);


--
-- Name: catalog catalog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catalog
    ADD CONSTRAINT catalog_pkey PRIMARY KEY (id);


--
-- Name: product_catalog product_catalog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_catalog
    ADD CONSTRAINT product_catalog_pkey PRIMARY KEY (id);


--
-- Name: product_catalog product_catalog_product_id_catalog_id_ab66c96e_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_catalog
    ADD CONSTRAINT product_catalog_product_id_catalog_id_ab66c96e_uniq UNIQUE (product_id, catalog_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: buyer_catalog_id_85016274; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX buyer_catalog_id_85016274 ON public.buyer USING btree (catalog_id);


--
-- Name: product_catalog_catalog_id_033f0463; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX product_catalog_catalog_id_033f0463 ON public.product_catalog USING btree (catalog_id);


--
-- Name: product_catalog_product_id_1dbe703d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX product_catalog_product_id_1dbe703d ON public.product_catalog USING btree (product_id);


--
-- Name: buyer buyer_catalog_id_85016274_fk_catalog_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT buyer_catalog_id_85016274_fk_catalog_id FOREIGN KEY (catalog_id) REFERENCES public.catalog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_catalog product_catalog_catalog_id_033f0463_fk_catalog_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_catalog
    ADD CONSTRAINT product_catalog_catalog_id_033f0463_fk_catalog_id FOREIGN KEY (catalog_id) REFERENCES public.catalog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_catalog product_catalog_product_id_1dbe703d_fk_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_catalog
    ADD CONSTRAINT product_catalog_product_id_1dbe703d_fk_product_id FOREIGN KEY (product_id) REFERENCES public.product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

