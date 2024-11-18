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
-- Name: asteroid_belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid_belt (
    asteroid_belt_id integer NOT NULL,
    name character varying(60),
    location text NOT NULL,
    number_of_asteroids integer NOT NULL,
    average_diameter_km integer NOT NULL
);


ALTER TABLE public.asteroid_belt OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_belt_asteroid_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_belt_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_belt_asteroid_belt_id_seq OWNED BY public.asteroid_belt.asteroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60),
    p_distance integer NOT NULL,
    diameter_in_km integer NOT NULL,
    mass numeric,
    type text,
    has_nebula boolean
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
    name character varying(60),
    diameter_km integer NOT NULL,
    size integer NOT NULL,
    mass_kg numeric,
    composition text,
    has_rings boolean,
    planet_id integer
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
    name character varying(60),
    rotation_period_in_years integer NOT NULL,
    size integer NOT NULL,
    radius numeric,
    color text,
    is_habitable boolean,
    star_id integer
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
    name character varying(60),
    distance_in_km integer NOT NULL,
    age_in_years integer NOT NULL,
    mass numeric,
    type text,
    is_visible boolean,
    galaxy_id integer NOT NULL
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
-- Name: asteroid_belt asteroid_belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt ALTER COLUMN asteroid_belt_id SET DEFAULT nextval('public.asteroid_belt_asteroid_belt_id_seq'::regclass);


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
-- Data for Name: asteroid_belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid_belt VALUES (1, 'Main Asteroid Belt', 'Between Mars and Jupiter', 1000000, 100);
INSERT INTO public.asteroid_belt VALUES (2, 'Kuiper Belt', 'Beyond Neptune', 200000, 200);
INSERT INTO public.asteroid_belt VALUES (3, 'Asteroid Belt of 1 Ceres', 'Between Mars and Jupiter', 250, 250);
INSERT INTO public.asteroid_belt VALUES (4, 'The Scattered Disc', 'Beyond the Kuiper Belt', 50000, 300);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2537000, 220000, 1.23, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 0, 150000, 1.00, 'Spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, 60000, 0.95, 'Spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 2800000, 150000, 1.15, 'Spiral', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 5000000, 50000, 1.30, 'Elliptical', false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 5300000, 120000, 2.00, 'Elliptical', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, 1, 73500000000000000000000, 'Rocky', false, 1);
INSERT INTO public.moon VALUES (2, 'Io', 3643, 2, 89300000000000000000000, 'Sulfuric, Rocky', true, 2);
INSERT INTO public.moon VALUES (3, 'Europa', 3121, 3, 48000000000000000000000, 'Icy, Rocky', false, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268, 4, 148000000000000000000000, 'Icy, Rocky', false, 2);
INSERT INTO public.moon VALUES (5, 'Callisto', 4800, 5, 108000000000000000000000, 'Icy, Rocky', false, 2);
INSERT INTO public.moon VALUES (6, 'Titan', 5150, 6, 135000000000000000000000, 'Icy, Rocky', true, 3);
INSERT INTO public.moon VALUES (7, 'Rhea', 1528, 7, 2310000000000000000000, 'Icy, Rocky', true, 3);
INSERT INTO public.moon VALUES (8, 'Iapetus', 1469, 8, 1800000000000000000000, 'Icy, Rocky', true, 3);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504, 9, 108000000000000000000, 'Icy, Rocky', false, 3);
INSERT INTO public.moon VALUES (10, 'Mimas', 396, 10, 37500000000000000000, 'Icy, Rocky', false, 3);
INSERT INTO public.moon VALUES (11, 'Titania', 1578, 11, 3500000000000000000000, 'Icy, Rocky', false, 4);
INSERT INTO public.moon VALUES (12, 'Oberon', 1523, 12, 3000000000000000000000, 'Icy, Rocky', false, 4);
INSERT INTO public.moon VALUES (13, 'Miranda', 471, 13, 60000000000000000000, 'Icy, Rocky', false, 4);
INSERT INTO public.moon VALUES (14, 'Ariel', 1158, 14, 1350000000000000000000, 'Icy, Rocky', false, 4);
INSERT INTO public.moon VALUES (15, 'Umbriel', 1170, 15, 1200000000000000000000, 'Icy, Rocky', false, 4);
INSERT INTO public.moon VALUES (16, 'Triton', 2706, 16, 21400000000000000000000, 'Icy, Rocky', true, 5);
INSERT INTO public.moon VALUES (17, 'Nereid', 340, 17, 22400000000000000000, 'Icy, Rocky', false, 5);
INSERT INTO public.moon VALUES (18, 'Charon', 1212, 18, 1520000000000000000000, 'Icy, Rocky', false, 6);
INSERT INTO public.moon VALUES (19, 'Haumea', 800, 19, 130000000000000000000, 'Icy, Rocky', false, 6);
INSERT INTO public.moon VALUES (20, 'Makemake', 500, 20, 10000000000000000000, 'Icy, Rocky', false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 1, 2439.7, 'gray', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 2, 6051.8, 'yellow', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 3, 6371.0, 'blue', true, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 4, 3389.5, 'red', false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 12, 5, 69911.0, 'orange', false, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 29, 6, 58232.0, 'yellow', false, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 84, 7, 25362.0, 'blue', false, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 165, 8, 24622.0, 'blue', false, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 248, 9, 1188.3, 'white', false, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 290, 10, 26000.0, 'green', true, 6);
INSERT INTO public.planet VALUES (11, 'Proxima b', 11, 11, 11000.0, 'light green', true, 6);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 13, 12, 12100.0, 'brown', true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 8000000, 2000000, 2.15, 'Main Sequence', true, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 41000000, 5000000, 1.10, 'Main Sequence', true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 643000000, 80000000, 18.00, 'Red Supergiant', true, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 860000000, 12000000, 21.00, 'Blue Supergiant', true, 2);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 40000000, 4500000, 0.12, 'Red Dwarf', true, 1);
INSERT INTO public.star VALUES (6, 'Antares', 550000000, 100000000, 12.00, 'Red Supergiant', false, 3);


--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_belt_id_seq', 4, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid_belt asteroid_belt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_name_key UNIQUE (name);


--
-- Name: asteroid_belt asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_belt_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_m; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_m UNIQUE (name);


--
-- Name: planet unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (name);


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

