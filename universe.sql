--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.1)

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
    name character varying(30) NOT NULL,
    millions_of_years_old integer,
    major_axis_diameter_ly integer,
    minor_axis_diameter_ly integer
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
-- Name: galaxy_type_and_desc; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type_and_desc (
    galaxy_id integer NOT NULL,
    galaxy_type character varying(20) NOT NULL,
    galaxy_desc text,
    name character varying(30) NOT NULL,
    galaxy_type_and_desc_id integer NOT NULL
);


ALTER TABLE public.galaxy_type_and_desc OWNER TO freecodecamp;

--
-- Name: galaxy_type_and_desc_galaxy_type_and_desc_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_and_desc_galaxy_type_and_desc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_and_desc_galaxy_type_and_desc_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_and_desc_galaxy_type_and_desc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_and_desc_galaxy_type_and_desc_id_seq OWNED BY public.galaxy_type_and_desc.galaxy_type_and_desc_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    has_atmosphere boolean
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean
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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    millions_of_years_old integer,
    absolute_magnitude numeric(3,1)
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
-- Name: galaxy_type_and_desc galaxy_type_and_desc_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type_and_desc ALTER COLUMN galaxy_type_and_desc_id SET DEFAULT nextval('public.galaxy_type_and_desc_galaxy_type_and_desc_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 175000, 100000);
INSERT INTO public.galaxy VALUES (2, 'Fried Egg Galaxy', NULL, 22766, NULL);
INSERT INTO public.galaxy VALUES (3, 'Eye of Sauron', NULL, 124000, 37540);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy', 13510, 170000, 100000);
INSERT INTO public.galaxy VALUES (5, 'Needle Galaxy', 13240, 140000, NULL);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 1101, 14000, 7000);


--
-- Data for Name: galaxy_type_and_desc; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type_and_desc VALUES (1, 'spiral', 'The Milky Way is the galaxy that includes the Solar System, with the name describing the appearance from Earth: a hazy band of light seen in the night sky formed from stars', 'Milky Way', 1);
INSERT INTO public.galaxy_type_and_desc VALUES (2, 'spiral', 'NGC 7742 also known as Fried Egg Galaxy is a face-on unbarred spiral galaxy in the constellation Pegasus.', 'NGC 7742', 2);
INSERT INTO public.galaxy_type_and_desc VALUES (3, 'spiral', 'NGC 4151 is an intermediate spiral Seyfert galaxy with weak inner ring structure located 15.8 megaparsecs from Earth in the constellation Canes Venatici. The galaxy was first mentioned by William Herschel on March 17, 1787 - it was one 
of the six Seyfert galaxies described in the paper which defined the term.', 'NGC 4151', 3);
INSERT INTO public.galaxy_type_and_desc VALUES (4, 'spiral', 'The Pinwheel Galaxy is a face-on, unbarred, and counterclockwise spiral galaxy located 21 million light-years from Earth in the constellation Ursa Major.', 'Pinwheel Galaxy', 4);
INSERT INTO public.galaxy_type_and_desc VALUES (5, 'spiral', 'NGC 4565 is an edge-on spiral galaxy about 30 to 50 million light-years away in the constellation Coma Berenices. It lies close to the North Galactic Pole and has a visual magnitude of approximately 10. It is known as the Needle Galaxy for its narrow profile.', 'NGC 4565', 5);
INSERT INTO public.galaxy_type_and_desc VALUES (6, 'dwarf-irregular', 'The Large Magellanic Cloud is a dwarf galaxy and satellite galaxy of the Milky Way. At a distance of around 50 kiloparsecs, the LMC is the second- or third-closest galaxy to the Milky Way, after the Sagittarius Dwarf Spheroidal and the possible dwarf irregular galaxy called the Canis Major Overdensity.', 'Large Magellanic Cloud', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', true, false);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', false, false);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', false, false);
INSERT INTO public.moon VALUES (4, 5, 'Io', NULL, true);
INSERT INTO public.moon VALUES (5, 5, 'Europa', NULL, true);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', true, true);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', true, true);
INSERT INTO public.moon VALUES (8, 6, 'Mimas', false, false);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', false, true);
INSERT INTO public.moon VALUES (10, 6, 'Tethys', true, false);
INSERT INTO public.moon VALUES (11, 6, 'Dione', true, true);
INSERT INTO public.moon VALUES (12, 6, 'Rhea', NULL, true);
INSERT INTO public.moon VALUES (13, 6, 'Titan', NULL, true);
INSERT INTO public.moon VALUES (14, 6, 'Hyperion', false, NULL);
INSERT INTO public.moon VALUES (15, 6, 'Iapetus', false, false);
INSERT INTO public.moon VALUES (16, 7, 'Miranda', true, false);
INSERT INTO public.moon VALUES (17, 7, 'Ariel', true, false);
INSERT INTO public.moon VALUES (18, 7, 'Umbriel', true, false);
INSERT INTO public.moon VALUES (19, 7, 'Titania', true, true);
INSERT INTO public.moon VALUES (20, 7, 'Oberon', true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', false, true);
INSERT INTO public.planet VALUES (2, 1, 'Venus', false, true);
INSERT INTO public.planet VALUES (3, 1, 'Earth', true, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', NULL, true);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', false, false);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', false, false);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', false, true);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', false, false);
INSERT INTO public.planet VALUES (9, 2, 'Proxima Centauri c', false, NULL);
INSERT INTO public.planet VALUES (10, 2, 'Alpha Centauri Bb', false, NULL);
INSERT INTO public.planet VALUES (11, 2, 'Luyten b', false, NULL);
INSERT INTO public.planet VALUES (12, 1, 'Pluto', false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 4603, 4.8);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 4853, 15.6);
INSERT INTO public.star VALUES (3, 1, 'Omega Centauri', 11530, -10.4);
INSERT INTO public.star VALUES (4, 1, 'Sigma Draconis', NULL, 4.7);
INSERT INTO public.star VALUES (5, 1, 'Delta Draconis', 1700, 3.1);
INSERT INTO public.star VALUES (6, 1, 'Beta Draconis', 65, 2.8);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_and_desc_galaxy_type_and_desc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_and_desc_galaxy_type_and_desc_id_seq', 6, true);


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
-- Name: galaxy_type_and_desc galaxy_type_and_desc_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type_and_desc
    ADD CONSTRAINT galaxy_type_and_desc_name_key UNIQUE (name);


--
-- Name: galaxy_type_and_desc galaxy_type_and_desc_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type_and_desc
    ADD CONSTRAINT galaxy_type_and_desc_pkey PRIMARY KEY (galaxy_type_and_desc_id);


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
-- Name: galaxy_type_and_desc galaxy_type_and_desc_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type_and_desc
    ADD CONSTRAINT galaxy_type_and_desc_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

