--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: course; Type: TABLE; Schema: public; Owner: workflow
--

CREATE TABLE public.course (
    id integer NOT NULL,
    title character varying(128) DEFAULT NULL::character varying,
    instructor_id integer
);


ALTER TABLE public.course OWNER TO workflow;

--
-- Name: course_id_seq; Type: SEQUENCE; Schema: public; Owner: workflow
--

CREATE SEQUENCE public.course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_id_seq OWNER TO workflow;

--
-- Name: course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: workflow
--

ALTER SEQUENCE public.course_id_seq OWNED BY public.course.id;


--
-- Name: course_student; Type: TABLE; Schema: public; Owner: workflow
--

CREATE TABLE public.course_student (
    course_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.course_student OWNER TO workflow;

--
-- Name: instructor; Type: TABLE; Schema: public; Owner: workflow
--

CREATE TABLE public.instructor (
    id integer NOT NULL,
    first_name character varying(128) NOT NULL,
    last_name character varying(128) NOT NULL,
    email character varying(256) NOT NULL,
    instructor_detail_id integer NOT NULL
);


ALTER TABLE public.instructor OWNER TO workflow;

--
-- Name: instructor_detail; Type: TABLE; Schema: public; Owner: workflow
--

CREATE TABLE public.instructor_detail (
    id integer NOT NULL,
    youtube_channel character varying(128) NOT NULL,
    hobby character varying(128) NOT NULL
);


ALTER TABLE public.instructor_detail OWNER TO workflow;

--
-- Name: instructor_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: workflow
--

CREATE SEQUENCE public.instructor_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructor_detail_id_seq OWNER TO workflow;

--
-- Name: instructor_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: workflow
--

ALTER SEQUENCE public.instructor_detail_id_seq OWNED BY public.instructor_detail.id;


--
-- Name: instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: workflow
--

CREATE SEQUENCE public.instructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructor_id_seq OWNER TO workflow;

--
-- Name: instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: workflow
--

ALTER SEQUENCE public.instructor_id_seq OWNED BY public.instructor.id;


--
-- Name: review; Type: TABLE; Schema: public; Owner: workflow
--

CREATE TABLE public.review (
    id integer NOT NULL,
    comment character varying(256) DEFAULT NULL::character varying,
    course_id integer
);


ALTER TABLE public.review OWNER TO workflow;

--
-- Name: review_id_seq; Type: SEQUENCE; Schema: public; Owner: workflow
--

CREATE SEQUENCE public.review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_id_seq OWNER TO workflow;

--
-- Name: review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: workflow
--

ALTER SEQUENCE public.review_id_seq OWNED BY public.review.id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: workflow
--

CREATE TABLE public.student (
    id integer NOT NULL,
    first_name character varying(128) DEFAULT NULL::character varying,
    last_name character varying(128) DEFAULT NULL::character varying,
    email character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.student OWNER TO workflow;

--
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: workflow
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_seq OWNER TO workflow;

--
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: workflow
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- Name: course id; Type: DEFAULT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.course ALTER COLUMN id SET DEFAULT nextval('public.course_id_seq'::regclass);


--
-- Name: instructor id; Type: DEFAULT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.instructor ALTER COLUMN id SET DEFAULT nextval('public.instructor_id_seq'::regclass);


--
-- Name: instructor_detail id; Type: DEFAULT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.instructor_detail ALTER COLUMN id SET DEFAULT nextval('public.instructor_detail_id_seq'::regclass);


--
-- Name: review id; Type: DEFAULT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.review ALTER COLUMN id SET DEFAULT nextval('public.review_id_seq'::regclass);


--
-- Name: student id; Type: DEFAULT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: workflow
--

COPY public.course (id, title, instructor_id) FROM stdin;
1	Java Masterclass	1
3	Web Development using Flask Framework in Python	4
4	JSP & Servlets (Build a database app)	7
5	Spring and Hibernate Zero to Hero	7
\.


--
-- Data for Name: course_student; Type: TABLE DATA; Schema: public; Owner: workflow
--

COPY public.course_student (course_id, student_id) FROM stdin;
1	1
5	1
\.


--
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: workflow
--

COPY public.instructor (id, first_name, last_name, email, instructor_detail_id) FROM stdin;
4	Jose	Portilla	jose@outlook.com	2
7	Chad	Darby	chad@luv2code.com	4
1	Tim	Buchalka	buchalkat@outlook.com	1
\.


--
-- Data for Name: instructor_detail; Type: TABLE DATA; Schema: public; Owner: workflow
--

COPY public.instructor_detail (id, youtube_channel, hobby) FROM stdin;
1	https://youtu.be/tim	Collecting Cars
2	https://youtu.be/jose	Building Machine Learning Models
4	https://youtu.be/jose	Building Machine Learning Models
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: workflow
--

COPY public.review (id, comment, course_id) FROM stdin;
1	Great course, keep it up!	5
2	Cool course, Job well done!	5
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: workflow
--

COPY public.student (id, first_name, last_name, email) FROM stdin;
1	Ismail	Surya	ismail@newgensoft.com
\.


--
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: workflow
--

SELECT pg_catalog.setval('public.course_id_seq', 5, true);


--
-- Name: instructor_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: workflow
--

SELECT pg_catalog.setval('public.instructor_detail_id_seq', 5, true);


--
-- Name: instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: workflow
--

SELECT pg_catalog.setval('public.instructor_id_seq', 7, true);


--
-- Name: review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: workflow
--

SELECT pg_catalog.setval('public.review_id_seq', 2, true);


--
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: workflow
--

SELECT pg_catalog.setval('public.student_id_seq', 1, true);


--
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- Name: course_student course_student_pkey; Type: CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.course_student
    ADD CONSTRAINT course_student_pkey PRIMARY KEY (course_id, student_id);


--
-- Name: course course_title_key; Type: CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_title_key UNIQUE (title);


--
-- Name: instructor_detail instructor_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.instructor_detail
    ADD CONSTRAINT instructor_detail_pkey PRIMARY KEY (id);


--
-- Name: instructor instructor_instructor_detail_id_key; Type: CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_instructor_detail_id_key UNIQUE (instructor_detail_id);


--
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (id);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: course course_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructor(id);


--
-- Name: course_student course_student_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.course_student
    ADD CONSTRAINT course_student_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: course_student course_student_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.course_student
    ADD CONSTRAINT course_student_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: instructor instructor_instructor_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_instructor_detail_id_fkey FOREIGN KEY (instructor_detail_id) REFERENCES public.instructor_detail(id);


--
-- Name: review review_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: workflow
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- PostgreSQL database dump complete
--

