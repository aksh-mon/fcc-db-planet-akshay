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
    name character varying(100) NOT NULL,
    description text,
    is_active boolean NOT NULL,
    has_black_hole boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    is_geologically_active boolean NOT NULL,
    orbit_duration integer NOT NULL,
    has_water boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    distance_from_star integer NOT NULL,
    has_life boolean NOT NULL,
    planet_type text
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_common boolean NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric,
    is_visible boolean NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', true, true);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Face-on spiral galaxy', true, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unusual shape', false, false);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 'Collision formed', true, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical with jet', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, false, 27, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 0, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 1, false);
INSERT INTO public.moon VALUES (4, 'Europa', 4, true, 3, true);
INSERT INTO public.moon VALUES (5, 'Io', 4, true, 2, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, false, 7, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, false, 17, true);
INSERT INTO public.moon VALUES (8, 'Titan', 5, false, 16, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, true, 1, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 5, false, 1, false);
INSERT INTO public.moon VALUES (11, 'Tethys', 5, false, 2, false);
INSERT INTO public.moon VALUES (12, 'Dione', 5, false, 3, false);
INSERT INTO public.moon VALUES (13, 'Rhea', 5, false, 5, false);
INSERT INTO public.moon VALUES (14, 'Iapetus', 5, false, 79, false);
INSERT INTO public.moon VALUES (15, 'Hyperion', 5, false, 21, false);
INSERT INTO public.moon VALUES (16, 'Miranda', 4, false, 1, false);
INSERT INTO public.moon VALUES (17, 'Ariel', 4, false, 3, false);
INSERT INTO public.moon VALUES (18, 'Umbriel', 4, false, 4, false);
INSERT INTO public.moon VALUES (19, 'Triton', 4, false, 6, false);
INSERT INTO public.moon VALUES (20, 'Charon', 4, false, 6, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, true, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2, false, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Venus', 1, 1, false, 'Terrestrial');
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 5, false, 'Gas Giant');
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 9, false, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Kepler-22b', 2, 600, false, 'Super Earth');
INSERT INTO public.planet VALUES (7, 'Kepler-442b', 3, 1200, false, 'Rocky');
INSERT INTO public.planet VALUES (8, 'Kepler-186f', 3, 500, false, 'Earth-like');
INSERT INTO public.planet VALUES (9, 'Gliese 581g', 4, 20, false, 'Super Earth');
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 5, 150, false, 'Hot Jupiter');
INSERT INTO public.planet VALUES (11, 'TOI-700 d', 6, 101, false, 'Earth-like');
INSERT INTO public.planet VALUES (12, 'Trappist-1e', 6, 40, false, 'Earth-like');


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Gas Giant', 'Large planet made mostly of gases like hydrogen and helium', true);
INSERT INTO public.planet_types VALUES (2, 'Terrestrial', 'Rocky planets like Earth and Mars', true);
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', 'Planets composed mostly of substances like water, ammonia, and methane', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, true, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2.1, true, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 2, 20.0, false, true);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 21.0, true, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 2.5, true, true);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 0.12, false, true);


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
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
