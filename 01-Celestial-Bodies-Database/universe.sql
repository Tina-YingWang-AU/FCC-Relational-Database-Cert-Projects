--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    speed_km_per_s numeric(10,2) NOT NULL,
    is_periodic boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_types character varying(50),
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth_in_thousand_km integer,
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    description text,
    planet_types character varying(50),
    is_spherical boolean,
    has_life boolean,
    star_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth_of_light_years numeric(12,1),
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Most famous periodic comet', 70.56, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'One of the brightest comets of the 20th century', 47.00, false);
INSERT INTO public.comet VALUES (3, 'Encke', 'Short-period comet with 3.3-year orbit', 69.00, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy containing the Solar System', 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy to the Milky Way', 'Spiral', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small spiral galaxy in the Local Group', 'Spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'A galaxy with a bright nucleus and large bulge', 'Elliptical', false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'A classic spiral galaxy interacting with a companion', 'Spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'A face-on spiral galaxy with well-defined arms', 'Spiral', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth’s natural satellite', false, true, 384, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Inner moon of Mars', false, false, 9, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Outer moon of Mars', false, false, 23, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanically active moon of Jupiter', false, true, 628300, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon with subsurface ocean', false, true, 628300, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the Solar System', false, true, 628300, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered moon of Jupiter', false, true, 628300, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn’s largest moon with thick atmosphere', false, true, 1275000, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Icy moon with water plumes', false, true, 1275000, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Moon with a crater resembling the Death Star', false, true, 1275000, 6);
INSERT INTO public.moon VALUES (11, 'Oberon', 'Large Uranian moon', false, true, 2900000, 7);
INSERT INTO public.moon VALUES (12, 'Titania', 'Brightest moon of Uranus', false, true, 2900000, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 'Dark Uranian moon', false, true, 2900000, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 'Icy moon with bright surface', false, true, 2900000, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Moon with extreme surface features', false, true, 2900000, 7);
INSERT INTO public.moon VALUES (16, 'Triton', 'Retrograde moon of Neptune', false, true, 4350000, 8);
INSERT INTO public.moon VALUES (17, 'Nereid', 'Highly eccentric orbit', false, false, 4350000, 8);
INSERT INTO public.moon VALUES (18, 'Proxima-b-Moon1', 'Exomoon candidate around Proxima b', false, true, 60000000, 9);
INSERT INTO public.moon VALUES (19, 'Kepler22b-Moon1', 'Possible exomoon around Kepler-22b', false, true, 120000000, 10);
INSERT INTO public.moon VALUES (20, 'Kepler452b-Moon1', 'Possible exomoon around Kepler-452b', false, true, 140000000, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet in the Solar System', 'Terrestrial', true, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hot planet with thick CO₂ atmosphere', 'Terrestrial', true, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Only known planet with life', 'Terrestrial', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red planet with thin atmosphere', 'Terrestrial', true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in the Solar System', 'Gas Giant', true, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant with prominent rings', 'Gas Giant', true, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant with tilted rotation', 'Ice Giant', true, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Farthest known major planet', 'Ice Giant', true, false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Exoplanet orbiting Alpha Centauri system', 'Exoplanet', true, false, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'Potentially habitable exoplanet', 'Super-Earth', true, false, 6);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 'Earth-like exoplanet in habitable zone', 'Super-Earth', true, false, 6);
INSERT INTO public.planet VALUES (12, 'Triangulum-1', 'A planet in the Triangulum Galaxy', 'Exoplanet', true, false, 7);
INSERT INTO public.planet VALUES (13, 'Sombrero-1', 'A planet in the Sombrero Galaxy', 'Exoplanet', true, false, 8);
INSERT INTO public.planet VALUES (14, 'Whirlpool-1', 'A planet in the Whirlpool Galaxy', 'Exoplanet', true, false, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System', 4600, 0.0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', 242, 8.6, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant in Orion, nearing end of life', 10, 642.5, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue supergiant, one of the brightest stars', 8, 860.0, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Closest star system to the Solar System', 5500, 4.4, 1);
INSERT INTO public.star VALUES (6, 'Andromeda Star A1', 'A massive star located in the Andromeda Galaxy', 3000, 2537000.0, 2);
INSERT INTO public.star VALUES (7, 'Triangulum Star T1', 'A bright star in the Triangulum Galaxy', 1500, 3000000.0, 3);
INSERT INTO public.star VALUES (8, 'Sombrero Star S1', 'A star located in the Sombrero Galaxy', 2000, 29000000.0, 4);
INSERT INTO public.star VALUES (9, 'Whirlpool Star W1', 'A luminous star in the Whirlpool Galaxy', 2500, 23000000.0, 5);
INSERT INTO public.star VALUES (10, 'Pinwheel Star P1', 'A young star in the Pinwheel Galaxy', 100, 21000000.0, 6);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

