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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    round character varying(20) NOT NULL,
    year integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (65, 'Final', 2018, 163, 164, 4, 2);
INSERT INTO public.games VALUES (66, 'Third Place', 2018, 165, 166, 2, 0);
INSERT INTO public.games VALUES (67, 'Semi-Final', 2018, 164, 166, 2, 1);
INSERT INTO public.games VALUES (68, 'Semi-Final', 2018, 163, 165, 1, 0);
INSERT INTO public.games VALUES (69, 'Quarter-Final', 2018, 164, 167, 3, 2);
INSERT INTO public.games VALUES (70, 'Quarter-Final', 2018, 166, 168, 2, 0);
INSERT INTO public.games VALUES (71, 'Quarter-Final', 2018, 165, 169, 2, 1);
INSERT INTO public.games VALUES (72, 'Quarter-Final', 2018, 163, 170, 2, 0);
INSERT INTO public.games VALUES (73, 'Eighth-Final', 2018, 166, 171, 2, 1);
INSERT INTO public.games VALUES (74, 'Eighth-Final', 2018, 168, 172, 1, 0);
INSERT INTO public.games VALUES (75, 'Eighth-Final', 2018, 165, 173, 3, 2);
INSERT INTO public.games VALUES (76, 'Eighth-Final', 2018, 169, 174, 2, 0);
INSERT INTO public.games VALUES (77, 'Eighth-Final', 2018, 164, 175, 2, 1);
INSERT INTO public.games VALUES (78, 'Eighth-Final', 2018, 167, 176, 2, 1);
INSERT INTO public.games VALUES (79, 'Eighth-Final', 2018, 170, 177, 2, 1);
INSERT INTO public.games VALUES (80, 'Eighth-Final', 2018, 163, 178, 4, 3);
INSERT INTO public.games VALUES (81, 'Final', 2014, 179, 178, 1, 0);
INSERT INTO public.games VALUES (82, 'Third Place', 2014, 180, 169, 3, 0);
INSERT INTO public.games VALUES (83, 'Semi-Final', 2014, 178, 180, 1, 0);
INSERT INTO public.games VALUES (84, 'Semi-Final', 2014, 179, 169, 7, 1);
INSERT INTO public.games VALUES (85, 'Quarter-Final', 2014, 180, 181, 1, 0);
INSERT INTO public.games VALUES (86, 'Quarter-Final', 2014, 178, 165, 1, 0);
INSERT INTO public.games VALUES (87, 'Quarter-Final', 2014, 169, 171, 2, 1);
INSERT INTO public.games VALUES (88, 'Quarter-Final', 2014, 179, 163, 1, 0);
INSERT INTO public.games VALUES (89, 'Eighth-Final', 2014, 169, 182, 2, 1);
INSERT INTO public.games VALUES (90, 'Eighth-Final', 2014, 171, 170, 2, 0);
INSERT INTO public.games VALUES (91, 'Eighth-Final', 2014, 163, 183, 2, 0);
INSERT INTO public.games VALUES (92, 'Eighth-Final', 2014, 179, 184, 2, 1);
INSERT INTO public.games VALUES (93, 'Eighth-Final', 2014, 180, 174, 2, 1);
INSERT INTO public.games VALUES (94, 'Eighth-Final', 2014, 181, 185, 2, 1);
INSERT INTO public.games VALUES (95, 'Eighth-Final', 2014, 178, 172, 1, 0);
INSERT INTO public.games VALUES (96, 'Eighth-Final', 2014, 165, 186, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (163, 'France');
INSERT INTO public.teams VALUES (164, 'Croatia');
INSERT INTO public.teams VALUES (165, 'Belgium');
INSERT INTO public.teams VALUES (166, 'England');
INSERT INTO public.teams VALUES (167, 'Russia');
INSERT INTO public.teams VALUES (168, 'Sweden');
INSERT INTO public.teams VALUES (169, 'Brazil');
INSERT INTO public.teams VALUES (170, 'Uruguay');
INSERT INTO public.teams VALUES (171, 'Colombia');
INSERT INTO public.teams VALUES (172, 'Switzerland');
INSERT INTO public.teams VALUES (173, 'Japan');
INSERT INTO public.teams VALUES (174, 'Mexico');
INSERT INTO public.teams VALUES (175, 'Denmark');
INSERT INTO public.teams VALUES (176, 'Spain');
INSERT INTO public.teams VALUES (177, 'Portugal');
INSERT INTO public.teams VALUES (178, 'Argentina');
INSERT INTO public.teams VALUES (179, 'Germany');
INSERT INTO public.teams VALUES (180, 'Netherlands');
INSERT INTO public.teams VALUES (181, 'Costa Rica');
INSERT INTO public.teams VALUES (182, 'Chile');
INSERT INTO public.teams VALUES (183, 'Nigeria');
INSERT INTO public.teams VALUES (184, 'Algeria');
INSERT INTO public.teams VALUES (185, 'Greece');
INSERT INTO public.teams VALUES (186, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 96, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 186, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

