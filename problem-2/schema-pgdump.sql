--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2
-- Dumped with pg_dump --create --no-owner --schema-only --table='marketplace_*' --format=p marketplace > database-pgdump.sql

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
-- Name: marketplace_buyer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.marketplace_buyer (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    catalog_id integer NOT NULL
);


--
-- Name: marketplace_buyer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.marketplace_buyer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: marketplace_buyer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.marketplace_buyer_id_seq OWNED BY public.marketplace_buyer.id;


--
-- Name: marketplace_catalog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.marketplace_catalog (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


--
-- Name: marketplace_catalog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.marketplace_catalog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: marketplace_catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.marketplace_catalog_id_seq OWNED BY public.marketplace_catalog.id;


--
-- Name: marketplace_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.marketplace_product (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    visibility character varying(30) NOT NULL,
    price numeric(10,2) NOT NULL,
    catalog_id integer
);


--
-- Name: marketplace_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.marketplace_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: marketplace_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.marketplace_product_id_seq OWNED BY public.marketplace_product.id;


--
-- Name: marketplace_buyer id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marketplace_buyer ALTER COLUMN id SET DEFAULT nextval('public.marketplace_buyer_id_seq'::regclass);


--
-- Name: marketplace_catalog id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marketplace_catalog ALTER COLUMN id SET DEFAULT nextval('public.marketplace_catalog_id_seq'::regclass);


--
-- Name: marketplace_product id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marketplace_product ALTER COLUMN id SET DEFAULT nextval('public.marketplace_product_id_seq'::regclass);


--
-- Name: marketplace_buyer marketplace_buyer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marketplace_buyer
    ADD CONSTRAINT marketplace_buyer_pkey PRIMARY KEY (id);


--
-- Name: marketplace_catalog marketplace_catalog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marketplace_catalog
    ADD CONSTRAINT marketplace_catalog_pkey PRIMARY KEY (id);


--
-- Name: marketplace_product marketplace_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marketplace_product
    ADD CONSTRAINT marketplace_product_pkey PRIMARY KEY (id);


--
-- Name: marketplace_buyer_catalog_id_dab292f7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX marketplace_buyer_catalog_id_dab292f7 ON public.marketplace_buyer USING btree (catalog_id);


--
-- Name: marketplace_product_catalog_id_c9e25627; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX marketplace_product_catalog_id_c9e25627 ON public.marketplace_product USING btree (catalog_id);


--
-- Name: marketplace_buyer marketplace_buyer_catalog_id_dab292f7_fk_marketplace_catalog_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marketplace_buyer
    ADD CONSTRAINT marketplace_buyer_catalog_id_dab292f7_fk_marketplace_catalog_id FOREIGN KEY (catalog_id) REFERENCES public.marketplace_catalog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketplace_product marketplace_product_catalog_id_c9e25627_fk_marketpla; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marketplace_product
    ADD CONSTRAINT marketplace_product_catalog_id_c9e25627_fk_marketpla FOREIGN KEY (catalog_id) REFERENCES public.marketplace_catalog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--
