--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 90);
INSERT INTO public.games VALUES (2, 2, 843);
INSERT INTO public.games VALUES (3, 1, 729);
INSERT INTO public.games VALUES (4, 1, 399);
INSERT INTO public.games VALUES (5, 1, 789);
INSERT INTO public.games VALUES (6, 3, 986);
INSERT INTO public.games VALUES (7, 4, 332);
INSERT INTO public.games VALUES (8, 3, 438);
INSERT INTO public.games VALUES (9, 3, 559);
INSERT INTO public.games VALUES (10, 3, 862);
INSERT INTO public.games VALUES (11, 6, 143);
INSERT INTO public.games VALUES (12, 7, 211);
INSERT INTO public.games VALUES (13, 7, 229);
INSERT INTO public.games VALUES (14, 6, 917);
INSERT INTO public.games VALUES (15, 6, 35);
INSERT INTO public.games VALUES (16, 6, 660);
INSERT INTO public.games VALUES (17, 8, 610);
INSERT INTO public.games VALUES (18, 8, 551);
INSERT INTO public.games VALUES (19, 9, 563);
INSERT INTO public.games VALUES (20, 9, 585);
INSERT INTO public.games VALUES (21, 8, 400);
INSERT INTO public.games VALUES (22, 8, 181);
INSERT INTO public.games VALUES (23, 8, 340);
INSERT INTO public.games VALUES (24, 10, 486);
INSERT INTO public.games VALUES (25, 10, 587);
INSERT INTO public.games VALUES (26, 11, 797);
INSERT INTO public.games VALUES (27, 11, 327);
INSERT INTO public.games VALUES (28, 10, 16);
INSERT INTO public.games VALUES (29, 10, 245);
INSERT INTO public.games VALUES (30, 10, 193);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1746390771372');
INSERT INTO public.users VALUES (2, 'user_1746390771371');
INSERT INTO public.users VALUES (3, 'user_1746390792217');
INSERT INTO public.users VALUES (4, 'user_1746390792216');
INSERT INTO public.users VALUES (5, 'otame');
INSERT INTO public.users VALUES (6, 'user_1746390873450');
INSERT INTO public.users VALUES (7, 'user_1746390873449');
INSERT INTO public.users VALUES (8, 'user_1746390938710');
INSERT INTO public.users VALUES (9, 'user_1746390938709');
INSERT INTO public.users VALUES (10, 'user_1746390988864');
INSERT INTO public.users VALUES (11, 'user_1746390988863');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 30, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 11, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

