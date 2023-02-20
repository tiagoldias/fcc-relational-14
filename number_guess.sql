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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    username character varying(30),
    guesses integer,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    username character varying(30) NOT NULL,
    games_played integer,
    best_game integer,
    user_id integer NOT NULL
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Name: number_guess_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_guess_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_guess_user_id_seq OWNER TO freecodecamp;

--
-- Name: number_guess_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_guess_user_id_seq OWNED BY public.number_guess.user_id;


--
-- Name: number_guess user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess ALTER COLUMN user_id SET DEFAULT nextval('public.number_guess_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES ('user_1676915361166', 799, 58);
INSERT INTO public.games VALUES ('user_1676915361166', 106, 58);
INSERT INTO public.games VALUES ('user_1676915361165', 458, 59);
INSERT INTO public.games VALUES ('user_1676915361165', 281, 59);
INSERT INTO public.games VALUES ('user_1676915361166', 940, 58);
INSERT INTO public.games VALUES ('user_1676915361166', 450, 58);
INSERT INTO public.games VALUES ('user_1676915361166', 888, 58);
INSERT INTO public.games VALUES ('user_1676915430448', 431, 60);
INSERT INTO public.games VALUES ('user_1676915430448', 791, 60);
INSERT INTO public.games VALUES ('user_1676915430447', 958, 61);
INSERT INTO public.games VALUES ('user_1676915430447', 335, 61);
INSERT INTO public.games VALUES ('user_1676915430448', 703, 60);
INSERT INTO public.games VALUES ('user_1676915430448', 128, 60);
INSERT INTO public.games VALUES ('user_1676915430448', 50, 60);
INSERT INTO public.games VALUES ('user_1676915625182', 281, 62);
INSERT INTO public.games VALUES ('user_1676915625182', 833, 62);
INSERT INTO public.games VALUES ('user_1676915625181', 130, 63);
INSERT INTO public.games VALUES ('user_1676915625181', 481, 63);
INSERT INTO public.games VALUES ('user_1676915625182', 802, 62);
INSERT INTO public.games VALUES ('user_1676915625182', 673, 62);
INSERT INTO public.games VALUES ('user_1676915625182', 712, 62);
INSERT INTO public.games VALUES ('user_1676915669954', 589, 64);
INSERT INTO public.games VALUES ('user_1676915669954', 649, 64);
INSERT INTO public.games VALUES ('user_1676915669953', 705, 65);
INSERT INTO public.games VALUES ('user_1676915669953', 570, 65);
INSERT INTO public.games VALUES ('user_1676915669954', 14, 64);
INSERT INTO public.games VALUES ('user_1676915669954', 368, 64);
INSERT INTO public.games VALUES ('user_1676915669954', 674, 64);
INSERT INTO public.games VALUES ('user_1676915744174', 714, 67);
INSERT INTO public.games VALUES ('user_1676915744174', 442, 67);
INSERT INTO public.games VALUES ('user_1676915744173', 930, 68);
INSERT INTO public.games VALUES ('user_1676915744173', 540, 68);
INSERT INTO public.games VALUES ('user_1676915744174', 845, 67);
INSERT INTO public.games VALUES ('user_1676915744174', 2, 67);
INSERT INTO public.games VALUES ('user_1676915744174', 302, 67);


--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES ('user_1676915361165', 2, 281, 59);
INSERT INTO public.number_guess VALUES ('user_1676915744173', 2, 540, 68);
INSERT INTO public.number_guess VALUES ('user_1676915361166', 5, 106, 58);
INSERT INTO public.number_guess VALUES ('user_1676915744174', 5, 2, 67);
INSERT INTO public.number_guess VALUES ('user_1676915430447', 2, 335, 61);
INSERT INTO public.number_guess VALUES ('user_1676915430448', 5, 50, 60);
INSERT INTO public.number_guess VALUES ('user_1676915625181', 2, 130, 63);
INSERT INTO public.number_guess VALUES ('user_1676915625182', 5, 281, 62);
INSERT INTO public.number_guess VALUES ('user_1676915669953', 2, 570, 65);
INSERT INTO public.number_guess VALUES ('user_1676915669954', 5, 14, 64);
INSERT INTO public.number_guess VALUES ('sa', NULL, NULL, 66);


--
-- Name: number_guess_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_guess_user_id_seq', 68, true);


--
-- Name: number_guess number_guess_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guess_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.number_guess(user_id);


--
-- PostgreSQL database dump complete
--

