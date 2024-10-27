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
    name character varying(255) NOT NULL,
    galaxy_type character varying(255) NOT NULL,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    has_life boolean DEFAULT false
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
    name character varying(255) NOT NULL,
    planet_id integer,
    size integer NOT NULL,
    is_spherical boolean DEFAULT true
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
    name character varying(255) NOT NULL,
    planet_type character varying(255) NOT NULL,
    star_id integer,
    has_life boolean DEFAULT false,
    mass integer
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mission_purpose text,
    distance_from_planet integer,
    planet_id integer
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_type character varying(255) NOT NULL,
    galaxy_id integer,
    mass numeric,
    is_spherical boolean DEFAULT true
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 10000, false);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Spiral', 23000000, 9000, false);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Spiral', 3000000, 11000, false);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Lenticular', 10500000, 12000, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53000000, 13000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, true);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4820, true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5152, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1528, true);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 1470, true);
INSERT INTO public.moon VALUES (11, 'Ariel', 7, 1158, true);
INSERT INTO public.moon VALUES (12, 'Umbriel', 7, 1169, true);
INSERT INTO public.moon VALUES (13, 'Titania', 7, 1578, true);
INSERT INTO public.moon VALUES (14, 'Oberon', 7, 1523, true);
INSERT INTO public.moon VALUES (15, 'Triton', 8, 2706, true);
INSERT INTO public.moon VALUES (16, 'Nereid', 8, 340, true);
INSERT INTO public.moon VALUES (17, 'Charon', 8, 1212, true);
INSERT INTO public.moon VALUES (18, 'Proxima Centauri Moon', 9, 700, true);
INSERT INTO public.moon VALUES (19, 'Betelgeuse Moon 1', 11, 1800, true);
INSERT INTO public.moon VALUES (20, 'Betelgeuse Moon 2', 11, 2400, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 1, false, 330);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 1, false, 4867);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 1, true, 5972);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 1, false, 641);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 1, false, 1898);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 1, false, 568);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 1, false, 86);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 1, false, 102);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Terrestrial', 2, true, 1545);
INSERT INTO public.planet VALUES (10, 'Proxima c', 'Gas Giant', 2, false, 1970);
INSERT INTO public.planet VALUES (11, 'Sirius b', 'White Dwarf', 3, false, 2500);
INSERT INTO public.planet VALUES (12, 'Betelgeuse b', 'Gas Giant', 4, false, 5643);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Voyager 1', 'Exploration', 12000, 3);
INSERT INTO public.satellite VALUES (2, 'Voyager 2', 'Exploration', 16000, 3);
INSERT INTO public.satellite VALUES (3, 'Cassini', 'Saturn Study', 5000, 6);
INSERT INTO public.satellite VALUES (4, 'Hubble Space Telescope', 'Astronomy', 547, 5);
INSERT INTO public.satellite VALUES (5, 'Pioneer 10', 'Exploration', 12000, 1);
INSERT INTO public.satellite VALUES (6, 'New Horizons', 'Pluto Exploration', 4000, 9);
INSERT INTO public.satellite VALUES (7, 'Mars Reconnaissance Orbiter', 'Mars Study', 3000, 4);
INSERT INTO public.satellite VALUES (8, 'Kepler', 'Exoplanet Search', 850, 1);
INSERT INTO public.satellite VALUES (9, 'Lunar Reconnaissance Orbiter', 'Moon Study', 2000, 1);
INSERT INTO public.satellite VALUES (10, 'Juno', 'Jupiter Study', 35000, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 1, 1989000000000000000000000000000, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M-type', 2, 244600000000000000000000000000, true);
INSERT INTO public.star VALUES (3, 'Sirius', 'A-type', 1, 4018000000000000000000000000000, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'M-type', 1, 12070000000000000000000000000000, true);
INSERT INTO public.star VALUES (5, 'Rigel', 'B-type', 3, 21450000000000000000000000000000, true);
INSERT INTO public.star VALUES (6, 'Polaris', 'F-type', 1, 5400000000000000000000000000000, true);


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
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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

