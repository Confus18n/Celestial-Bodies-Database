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
    name character varying(40) NOT NULL,
    galaxy_type text NOT NULL,
    age_in_billion_years numeric(4,1),
    num_stars_in_billions integer,
    has_life boolean
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
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    moon_id integer,
    launch_year integer,
    agency character varying(100),
    success boolean
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: missions_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.missions_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.missions_mission_id_seq OWNER TO freecodecamp;

--
-- Name: missions_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.missions_mission_id_seq OWNED BY public.mission.mission_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text NOT NULL,
    size integer,
    gravity numeric,
    has_water boolean,
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
    name character varying(40) NOT NULL,
    type text NOT NULL,
    has_life boolean,
    distance_from_earth numeric(10,1),
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
    name character varying(40) NOT NULL,
    type text NOT NULL,
    mass integer,
    distance_in_years numeric(10,1),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: mission mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission ALTER COLUMN mission_id SET DEFAULT nextval('public.missions_mission_id_seq'::regclass);


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13.6, 300, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10.0, 1000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12.0, 40, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic', 'Irregular', 13.0, 30, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Lenticular', 13.0, 800, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Spiral', 10.0, 100, false);


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission VALUES (1, 'Apollo 11', 1, 1, 1969, 'NASA', true);
INSERT INTO public.mission VALUES (2, 'Mars Pathfinder', 2, NULL, 1996, 'NASA', true);
INSERT INTO public.mission VALUES (3, 'Kepler Observer', 3, 4, 2015, 'NASA', true);
INSERT INTO public.mission VALUES (4, 'Proxima Surveyor', 4, 5, 2022, 'ESA', true);
INSERT INTO public.mission VALUES (5, 'TRAPPIST Mission', 5, 6, 2023, 'ESA', true);
INSERT INTO public.mission VALUES (6, 'Sirius Probe', 6, 7, 2010, 'Roscosmos', false);
INSERT INTO public.mission VALUES (7, 'Rigel Explorer', 7, 8, 2018, 'NASA', true);
INSERT INTO public.mission VALUES (8, 'Andromeda Venture', 9, 10, 2021, 'SpaceX', true);
INSERT INTO public.mission VALUES (9, 'Europa Clipper', 18, 14, 2024, 'NASA', true);
INSERT INTO public.mission VALUES (10, 'Titan Recon', 19, 17, 2025, 'NASA', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Rocky', 3475, 1.6, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Rocky', 22, 0.0, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Rocky', 12, 0.0, false, 2);
INSERT INTO public.moon VALUES (4, 'Kepler-M1', 'Unknown', 1000, 0.9, false, 3);
INSERT INTO public.moon VALUES (5, 'Proxima-M1', 'Unknown', 800, 0.7, false, 4);
INSERT INTO public.moon VALUES (6, 'TRAPPIST-M1', 'Rocky', 600, 0.6, true, 5);
INSERT INTO public.moon VALUES (7, 'Sirius-M1', 'Icy', 1500, 1.1, false, 6);
INSERT INTO public.moon VALUES (8, 'Rigel-M1', 'Gas', 3000, 1.4, false, 7);
INSERT INTO public.moon VALUES (9, 'Rigel-M2', 'Rocky', 2000, 1.2, false, 8);
INSERT INTO public.moon VALUES (10, 'Andromeda-M1', 'Icy', 1800, 1.3, false, 9);
INSERT INTO public.moon VALUES (11, 'Andromeda-M2', 'Rocky', 1600, 1.0, false, 10);
INSERT INTO public.moon VALUES (12, 'R136a1-M1', 'Icy', 2500, 1.8, false, 11);
INSERT INTO public.moon VALUES (13, 'R136a1-M2', 'Gas', 2700, 2.0, false, 12);
INSERT INTO public.moon VALUES (14, 'Europa', 'Icy', 3121, 1.3, true, 18);
INSERT INTO public.moon VALUES (15, 'Ganymede', 'Rocky', 5268, 1.4, true, 18);
INSERT INTO public.moon VALUES (16, 'Callisto', 'Icy', 4820, 1.2, true, 18);
INSERT INTO public.moon VALUES (17, 'Titan', 'Icy', 5150, 1.4, true, 19);
INSERT INTO public.moon VALUES (18, 'Enceladus', 'Icy', 504, 0.1, true, 19);
INSERT INTO public.moon VALUES (19, 'Triton', 'Icy', 2706, 0.8, true, 21);
INSERT INTO public.moon VALUES (20, 'Oberon', 'Rocky', 1523, 0.4, false, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', true, 0.0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', false, 0.0, 1);
INSERT INTO public.planet VALUES (3, 'Kepler-452b', 'Super-Earth', false, 1400.0, 1);
INSERT INTO public.planet VALUES (4, 'Proxima b', 'Terrestrial', false, 4.2, 3);
INSERT INTO public.planet VALUES (5, 'TRAPPIST-1d', 'Terrestrial', false, 40.0, 3);
INSERT INTO public.planet VALUES (6, 'Sirius Ab', 'Gas Giant', false, 8.6, 2);
INSERT INTO public.planet VALUES (7, 'Rigel I', 'Gas Giant', false, 860.0, 4);
INSERT INTO public.planet VALUES (8, 'Rigel II', 'Ice Giant', false, 860.0, 4);
INSERT INTO public.planet VALUES (9, 'Andromeda X-1', 'Super-Earth', false, 97.0, 5);
INSERT INTO public.planet VALUES (10, 'Andromeda Y-2', 'Gas Giant', false, 97.5, 5);
INSERT INTO public.planet VALUES (11, 'R136a1-Prime', 'Gas Giant', false, 163000.0, 6);
INSERT INTO public.planet VALUES (12, 'R136a1-Terra', 'Terrestrial', false, 163000.0, 6);
INSERT INTO public.planet VALUES (16, 'Mercury', 'Terrestrial', false, 0.0, 1);
INSERT INTO public.planet VALUES (17, 'Venus', 'Terrestrial', false, 0.0, 1);
INSERT INTO public.planet VALUES (18, 'Jupiter', 'Gas Giant', false, 0.0, 1);
INSERT INTO public.planet VALUES (19, 'Saturn', 'Gas Giant', false, 0.0, 1);
INSERT INTO public.planet VALUES (20, 'Uranus', 'Ice Giant', false, 0.0, 1);
INSERT INTO public.planet VALUES (21, 'Neptune', 'Ice Giant', false, 0.0, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G', 1, 0.0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A', 2, 8.6, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'M', 0, 4.2, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'B', 18, 860.0, 1);
INSERT INTO public.star VALUES (5, 'Alpha Andromedae', 'B', 4, 97.0, 2);
INSERT INTO public.star VALUES (6, 'R136a1', 'Wolf-Rayet', 315, 163000.0, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: missions_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.missions_mission_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: mission mission_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_name_unique UNIQUE (name);


--
-- Name: mission missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT missions_pkey PRIMARY KEY (mission_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


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
-- Name: star stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_name_key UNIQUE (name);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: mission missions_target_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT missions_target_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id) ON DELETE SET NULL;


--
-- Name: mission missions_target_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT missions_target_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

