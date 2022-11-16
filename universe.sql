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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    age_in_million_years integer,
    distance_from_earth_in_ly integer,
    radius_in_km numeric,
    has_life boolean,
    is_spherical boolean,
    description text NOT NULL
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    distance_from_earth_in_ly integer,
    radius_in_km numeric,
    has_black_hole boolean,
    pictures_available boolean,
    description text NOT NULL
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
    name character varying(30) NOT NULL,
    planet_id integer,
    age_in_million_years integer,
    distance_from_earth_in_ly integer,
    radius_in_km numeric,
    is_spherical boolean,
    has_life boolean,
    description text NOT NULL
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
    name character varying(30) NOT NULL,
    star_id integer,
    age_in_million_years integer,
    distance_from_earth_in_ly integer,
    radius_in_km numeric,
    has_life boolean,
    is_spherical boolean,
    description text
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    distance_from_earth_in_ly integer,
    radius_in_km numeric,
    active_star boolean,
    description text,
    has_planets_around boolean NOT NULL,
    galaxy_id integer
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
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


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
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Pluto', 1, 200, 5000, 1500, false, false, 'Part of Milky way Galaxy');
INSERT INTO public.dwarf_planet VALUES (2, 'Plum', 2, 200, 5000, 1500, false, false, 'Part of random Galaxy');
INSERT INTO public.dwarf_planet VALUES (3, 'Pudding', 2, 200, 5000, 1500, false, false, 'Part of random1 Galaxy');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 200, 0, 99999999, false, true, 'has eight planets including earth');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 150, 5000, 90099999, false, true, 'closest galaxy to the  milky way galaxy');
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 80, 8000, 90077999, false, true, 'Appears to rotate backwards');
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 30, 1190, 92377999, false, true, 'has dark band of absorbing dust');
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 130, 2090, 923773459, false, true, 'similar shape of a cigar');
INSERT INTO public.galaxy VALUES (6, 'Circinus Galaxy', 130, 2090, 923773459, false, true, 'Appears similar to the constellation circinus');
INSERT INTO public.galaxy VALUES (7, 'Comet Galaxy', 250, 3070, 6783773459, false, true, 'Appears similar to a comet');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 40, 2, 2000, true, true, 'Earth Moon');
INSERT INTO public.moon VALUES (2, 'Moon1', 1, 40, 2, 2000, true, false, 'Random1 Moon');
INSERT INTO public.moon VALUES (3, 'Moon2', 2, 40, 2, 2000, true, false, 'Random2 Moon');
INSERT INTO public.moon VALUES (4, 'Moon4', 4, 40, 2, 2000, true, false, 'Random3 Moon');
INSERT INTO public.moon VALUES (5, 'Moon5', 5, 40, 2, 2000, true, false, 'Random4 Moon');
INSERT INTO public.moon VALUES (6, 'Moon6', 6, 40, 2, 2000, true, false, 'Random6 Moon');
INSERT INTO public.moon VALUES (7, 'Moon7', 7, 40, 2, 2000, true, false, 'Random7 Moon');
INSERT INTO public.moon VALUES (8, 'Moon8', 8, 40, 2, 2000, true, false, 'Random8 Moon');
INSERT INTO public.moon VALUES (9, 'Moon9', 9, 40, 2, 2000, true, false, 'Random9 Moon');
INSERT INTO public.moon VALUES (10, 'Moon11', 1, 40, 2, 2000, true, false, 'Random91 Moon');
INSERT INTO public.moon VALUES (11, 'Moon21', 2, 40, 2, 2000, true, false, 'Random92 Moon');
INSERT INTO public.moon VALUES (12, 'Moon31', 4, 40, 2, 2000, true, false, 'Random93 Moon');
INSERT INTO public.moon VALUES (13, 'Moon51', 5, 40, 2, 2000, true, false, 'Random94 Moon');
INSERT INTO public.moon VALUES (14, 'Moon61', 6, 40, 2, 2000, true, false, 'Random95 Moon');
INSERT INTO public.moon VALUES (15, 'Moon71', 7, 40, 2, 2000, true, false, 'Random97 Moon');
INSERT INTO public.moon VALUES (16, 'Moon711', 1, 40, 2, 2000, true, false, 'Random971 Moon');
INSERT INTO public.moon VALUES (17, 'Moon712', 2, 40, 2, 2000, true, false, 'Random972 Moon');
INSERT INTO public.moon VALUES (18, 'Moon713', 2, 40, 2, 2000, true, false, 'Random973 Moon');
INSERT INTO public.moon VALUES (19, 'Moon714', 4, 40, 2, 2000, true, false, 'Random974 Moon');
INSERT INTO public.moon VALUES (20, 'Moon715', 5, 40, 2, 2000, true, false, 'Random975 Moon');
INSERT INTO public.moon VALUES (21, 'Moon716', 6, 40, 2, 2000, true, false, 'Random976 Moon');
INSERT INTO public.moon VALUES (22, 'Moon717', 7, 40, 2, 2000, true, false, 'Random977 Moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 800, 300, 4000, false, true, 'First Planet');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 850, 350, 3000, false, true, 'Second Planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 950, 450, 2000, true, true, 'Third Planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 850, 470, 2300, true, true, 'Fourth Planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 890, 570, 2500, false, true, 'Fifth Planet');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 890, 570, 2500, false, true, 'Sixth Planet');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 890, 570, 2500, false, true, 'Seventh Planet');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 890, 570, 2500, false, true, 'Eighth Planet');
INSERT INTO public.planet VALUES (9, 'Alpha', 1, 890, 570, 2500, false, true, 'Random1 Planet');
INSERT INTO public.planet VALUES (10, 'Trio', 1, 890, 570, 2500, false, true, 'Random2 Planet');
INSERT INTO public.planet VALUES (11, 'Sixer', 1, 890, 570, 2500, false, true, 'Random3 Planet');
INSERT INTO public.planet VALUES (12, 'Wannabae', 1, 890, 570, 2500, false, true, 'Random4 Planet');
INSERT INTO public.planet VALUES (13, 'WannaKnow', 1, 890, 570, 2500, false, true, 'Random5 Planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5000, 100, 99999, true, 'Star for milky way galaxy', true, 1);
INSERT INTO public.star VALUES (2, 'Alpha', 5100, 110, 99899, true, 'Alpha sun', true, 2);
INSERT INTO public.star VALUES (3, 'Beta', 6100, 210, 99889, true, 'Beta sun', true, 3);
INSERT INTO public.star VALUES (4, 'Gaama', 6900, 230, 39889, true, 'Gaama sun', true, 4);
INSERT INTO public.star VALUES (5, 'Delta', 6950, 340, 39878, true, 'Delta sun', true, 5);
INSERT INTO public.star VALUES (6, 'Sigma', 9990, 999, 99978, true, 'Sigma sun', true, 6);


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: dwarf_planet dwarf_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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


