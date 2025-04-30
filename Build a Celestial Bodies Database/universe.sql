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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    number_of_stars integer,
    galaxy_type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    distance_from_earth numeric,
    description text NOT NULL,
    is_spherical boolean,
    has_life boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    distance_from_earth numeric,
    has_life boolean,
    description text NOT NULL,
    is_spherical boolean,
    star_id integer,
    type_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type (
    type_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    column1 integer,
    column2 integer,
    average_temperature integer,
    orbital_period integer
);


ALTER TABLE public.type OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.type.type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    description text NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: type type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type ALTER COLUMN type_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral galaxy approximately 2.5 million light-years from Earth', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Our home galaxy, a barred spiral galaxy', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small spiral galaxy located in the constellation Triangulum', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A face-on spiral galaxy in the constellation Canes Venatici', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxy with a bright nucleus and a large central bulge', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant elliptical galaxy with a supermassive black hole at its center', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 0.3844, 'Earth''s only natural satellite', true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0.000000927, 'A small, irregularly shaped moon of Mars', true, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 0.000002278, 'The smaller and outermost moon of Mars', true, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 421.7, 'A volcanic moon of Jupiter, with hundreds of volcanoes', true, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 628.3, 'A moon of Jupiter with a subsurface ocean that may have life', true, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 1070.4, 'The largest moon in the solar system, also of Jupiter', true, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 1882.7, 'The second-largest moon of Jupiter', true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 1200, 'Saturn''s largest moon, with a thick atmosphere and lakes of methane', true, false);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 527.7, 'A major moon of Saturn, covered in ice', true, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 356.0, 'Saturn''s moon with a distinctive two-tone coloration', true, false);
INSERT INTO public.moon VALUES (11, 'Triton', 5, 354.8, 'Neptune''s largest moon, known for retrograde motion', true, false);
INSERT INTO public.moon VALUES (12, 'Nereid', 5, 0.0000219, 'A small and irregularly shaped moon of Neptune', true, false);
INSERT INTO public.moon VALUES (13, 'Charon', 6, 0.0000167, 'Pluto''s largest moon, tidally locked with Pluto', true, false);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 129, 'A moon of Uranus with extreme surface features', true, false);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 190.9, 'A moon of Uranus known for its icy surface and canyons', true, false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 266.6, 'A dark moon of Uranus with an icy surface', true, false);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 436.9, 'The largest moon of Uranus, with a mix of rock and ice', true, false);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 584.7, 'The second-largest moon of Uranus', true, false);
INSERT INTO public.moon VALUES (19, 'Enceladus', 4, 238.0, 'A small moon of Saturn with geysers spewing water and ice', true, false);
INSERT INTO public.moon VALUES (20, 'Mimas', 4, 185.0, 'A small, heavily cratered moon of Saturn, known for the ''Death Star'' appearance', true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 0, true, 'Our home planet, only known planet with life', true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 0.0000158, false, 'The red planet, potential for past life', true, 1, 1);
INSERT INTO public.planet VALUES (9, 'Andromeda Prime', 2500000, false, 'Large planet in the Andromeda galaxy', true, 5, 1);
INSERT INTO public.planet VALUES (10, 'Andromeda Secundus', 2500001, false, 'Possible terrestrial planet', true, 5, 1);
INSERT INTO public.planet VALUES (11, 'Triangulum Terra', 3000000, true, 'Life-supporting planet in Triangulum galaxy', true, 6, 1);
INSERT INTO public.planet VALUES (12, 'Triangulum Aqua', 3000001, true, 'Ocean planet, signs of microbial life', true, 6, 1);
INSERT INTO public.planet VALUES (3, 'Kepler-22b', 600, false, 'Exoplanet in the habitable zone of its star', true, 2, 2);
INSERT INTO public.planet VALUES (4, 'Proxima b', 4.24, false, 'Closest known exoplanet, orbits Proxima Centauri', true, 2, 2);
INSERT INTO public.planet VALUES (5, 'Betelgeuse I', 642.5, false, 'A gas giant orbiting the red supergiant Betelgeuse', true, 3, 3);
INSERT INTO public.planet VALUES (7, 'M87-A1', 53000000, false, 'Harsh planet near the black hole in M87', false, 4, 3);
INSERT INTO public.planet VALUES (8, 'M87-B2', 53000001, false, 'Icy planet with elliptical orbit in M87', true, 4, 3);
INSERT INTO public.planet VALUES (6, 'Betelgeuse II', 642.6, false, 'Rocky planet within the habitable zone', true, 3, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 2, 8.6, 242, 'Brightest star in the night sky, located in the Milky Way');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 4.24, 4500, 'Closest known star to the Sun, part of the Alpha Centauri system');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 2, 642.5, 10000, 'Red supergiant in the Orion constellation, Milky Way galaxy');
INSERT INTO public.star VALUES (4, 'Messier 87 Star A', 6, 53000000, 12000, 'Star orbiting the black hole at the center of Messier 87');
INSERT INTO public.star VALUES (5, 'Andromeda Star B', 1, 2500000, 9000, 'Star located in the Andromeda galaxy');
INSERT INTO public.star VALUES (6, 'Triangulum Star C', 3, 3000000, 7500, 'Star within the Triangulum galaxy');


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type VALUES (1, 'Rocky', 'Planets composed mostly of solid materials like rock and metal', NULL, NULL, NULL, NULL);
INSERT INTO public.type VALUES (2, 'Oceanic', 'Planets covered mostly by water, with potential for aquatic life', NULL, NULL, NULL, NULL);
INSERT INTO public.type VALUES (3, 'Gas Giant', 'Large planets composed mainly of hydrogen and helium', NULL, NULL, NULL, NULL);
INSERT INTO public.type VALUES (4, 'Icy', 'Planets covered mostly by ice and frozen substances', NULL, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (type_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: type unique_planet_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT unique_planet_type_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

