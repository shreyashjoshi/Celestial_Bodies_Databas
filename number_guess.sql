--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(100),
    score integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (13, 'user_1655402112392', 753);
INSERT INTO public.users VALUES (14, 'user_1655402112392', 625);
INSERT INTO public.users VALUES (15, 'user_1655402112391', 128);
INSERT INTO public.users VALUES (16, 'user_1655402112391', 818);
INSERT INTO public.users VALUES (17, 'user_1655402112392', 532);
INSERT INTO public.users VALUES (18, 'user_1655402112392', 287);
INSERT INTO public.users VALUES (19, 'user_1655402112392', 708);
INSERT INTO public.users VALUES (20, 'user_1655402615380', 449);
INSERT INTO public.users VALUES (21, 'user_1655402615380', 589);
INSERT INTO public.users VALUES (22, 'user_1655402615379', 281);
INSERT INTO public.users VALUES (23, 'user_1655402615379', 995);
INSERT INTO public.users VALUES (24, 'user_1655402615380', 639);
INSERT INTO public.users VALUES (25, 'user_1655402615380', 628);
INSERT INTO public.users VALUES (26, 'user_1655402615380', 769);
INSERT INTO public.users VALUES (27, 'user_1655402802758', 567);
INSERT INTO public.users VALUES (28, 'user_1655402802758', 114);
INSERT INTO public.users VALUES (29, 'user_1655402802757', 675);
INSERT INTO public.users VALUES (30, 'user_1655402802757', 878);
INSERT INTO public.users VALUES (31, 'user_1655402802758', 829);
INSERT INTO public.users VALUES (32, 'user_1655402802758', 24);
INSERT INTO public.users VALUES (33, 'user_1655402802758', 483);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 33, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

