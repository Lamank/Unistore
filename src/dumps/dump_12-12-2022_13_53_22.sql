--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE unistore;




--
-- Drop roles
--

DROP ROLE unistore;


--
-- Roles
--

CREATE ROLE unistore;
ALTER ROLE unistore WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Bn9f5UFJPJo7Knj5gAm68A==$dTKj64Rq42Bzoa09DySC8sr+2mrpuNsYV7ZZE73aKXQ=:+kVOr9jNY7IB8re7oWQRgjRVCPpI0cs0AoOvZEDB/Dc=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: unistore
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO unistore;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: unistore
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: unistore
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: unistore
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: unistore
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO unistore;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: unistore
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "unistore" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

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

--
-- Name: unistore; Type: DATABASE; Schema: -; Owner: unistore
--

CREATE DATABASE unistore WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE unistore OWNER TO unistore;

\connect unistore

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO unistore;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO unistore;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO unistore;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO unistore;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO unistore;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO unistore;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: blog_blog; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.blog_blog (
    id bigint NOT NULL,
    title character varying(150) NOT NULL,
    description text NOT NULL,
    slug character varying(250),
    created_at timestamp with time zone,
    description_az text,
    description_en text,
    title_az character varying(150),
    title_en character varying(150),
    main_image character varying(100)
);


ALTER TABLE public.blog_blog OWNER TO unistore;

--
-- Name: blog_blog_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.blog_blog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blog_id_seq OWNER TO unistore;

--
-- Name: blog_blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.blog_blog_id_seq OWNED BY public.blog_blog.id;


--
-- Name: blog_blog_tags; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.blog_blog_tags (
    id bigint NOT NULL,
    blog_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.blog_blog_tags OWNER TO unistore;

--
-- Name: blog_blog_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.blog_blog_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blog_tags_id_seq OWNER TO unistore;

--
-- Name: blog_blog_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.blog_blog_tags_id_seq OWNED BY public.blog_blog_tags.id;


--
-- Name: blog_comment; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.blog_comment (
    id bigint NOT NULL,
    author_id bigint NOT NULL,
    email character varying(128) NOT NULL,
    comment text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at date NOT NULL,
    blog_id bigint,
    parent_id bigint
);


ALTER TABLE public.blog_comment OWNER TO unistore;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.blog_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_comment_id_seq OWNER TO unistore;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.blog_comment_id_seq OWNED BY public.blog_comment.id;


--
-- Name: blog_media; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.blog_media (
    id bigint NOT NULL,
    media character varying(100) NOT NULL,
    blog_id bigint
);


ALTER TABLE public.blog_media OWNER TO unistore;

--
-- Name: blog_media_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.blog_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_media_id_seq OWNER TO unistore;

--
-- Name: blog_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.blog_media_id_seq OWNED BY public.blog_media.id;


--
-- Name: blog_tag; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.blog_tag (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    name_az character varying(50),
    name_en character varying(50)
);


ALTER TABLE public.blog_tag OWNER TO unistore;

--
-- Name: blog_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.blog_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_tag_id_seq OWNER TO unistore;

--
-- Name: blog_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.blog_tag_id_seq OWNED BY public.blog_tag.id;


--
-- Name: core_contact; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.core_contact (
    id bigint NOT NULL,
    mail character varying(128) NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.core_contact OWNER TO unistore;

--
-- Name: core_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.core_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_contact_id_seq OWNER TO unistore;

--
-- Name: core_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.core_contact_id_seq OWNED BY public.core_contact.id;


--
-- Name: core_subscriber; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.core_subscriber (
    id bigint NOT NULL,
    email character varying(100) NOT NULL,
    added_at timestamp with time zone NOT NULL
);


ALTER TABLE public.core_subscriber OWNER TO unistore;

--
-- Name: core_subscriber_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.core_subscriber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_subscriber_id_seq OWNER TO unistore;

--
-- Name: core_subscriber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.core_subscriber_id_seq OWNED BY public.core_subscriber.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO unistore;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO unistore;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO unistore;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_clockedschedule_id_seq OWNER TO unistore;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO unistore;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_crontabschedule_id_seq OWNER TO unistore;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO unistore;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_intervalschedule_id_seq OWNER TO unistore;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO unistore;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_periodictask_id_seq OWNER TO unistore;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO unistore;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO unistore;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_solarschedule_id_seq OWNER TO unistore;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO unistore;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO unistore;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO unistore;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO unistore;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO unistore;

--
-- Name: product_brand; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.product_brand (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    logo_id bigint
);


ALTER TABLE public.product_brand OWNER TO unistore;

--
-- Name: product_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.product_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_brand_id_seq OWNER TO unistore;

--
-- Name: product_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.product_brand_id_seq OWNED BY public.product_brand.id;


--
-- Name: product_campaign; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.product_campaign (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    name_az character varying(100),
    name_en character varying(100),
    description text NOT NULL,
    description_az text,
    description_en text,
    percent integer,
    is_active boolean NOT NULL,
    usage_limit integer NOT NULL,
    activated_at timestamp with time zone,
    image character varying(100),
    created_at timestamp with time zone NOT NULL,
    extra_image character varying(100)
);


ALTER TABLE public.product_campaign OWNER TO unistore;

--
-- Name: product_campaign_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.product_campaign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_campaign_id_seq OWNER TO unistore;

--
-- Name: product_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.product_campaign_id_seq OWNED BY public.product_campaign.id;


--
-- Name: product_category; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.product_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    name_az character varying(100),
    name_en character varying(100)
);


ALTER TABLE public.product_category OWNER TO unistore;

--
-- Name: product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_category_id_seq OWNER TO unistore;

--
-- Name: product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.product_category_id_seq OWNED BY public.product_category.id;


--
-- Name: product_display; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.product_display (
    id bigint NOT NULL,
    screen character varying(200),
    resolution character varying(200),
    color_settings character varying(255),
    touch character varying(150)
);


ALTER TABLE public.product_display OWNER TO unistore;

--
-- Name: product_display_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.product_display_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_display_id_seq OWNER TO unistore;

--
-- Name: product_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.product_display_id_seq OWNED BY public.product_display.id;


--
-- Name: product_logo; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.product_logo (
    id bigint NOT NULL,
    logo character varying(100)
);


ALTER TABLE public.product_logo OWNER TO unistore;

--
-- Name: product_logo_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.product_logo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_logo_id_seq OWNER TO unistore;

--
-- Name: product_logo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.product_logo_id_seq OWNED BY public.product_logo.id;


--
-- Name: product_media; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.product_media (
    id bigint NOT NULL,
    media character varying(100) NOT NULL,
    product_id bigint
);


ALTER TABLE public.product_media OWNER TO unistore;

--
-- Name: product_media_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.product_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_media_id_seq OWNER TO unistore;

--
-- Name: product_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.product_media_id_seq OWNED BY public.product_media.id;


--
-- Name: product_product; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.product_product (
    id bigint NOT NULL,
    title character varying(150) NOT NULL,
    description text NOT NULL,
    price double precision NOT NULL,
    slug character varying(250),
    quantity integer,
    added_at date NOT NULL,
    operating_system character varying(150),
    processor text,
    processor_tech text,
    graphics text,
    memory character varying(100),
    hard_drive text,
    power_supply character varying(100),
    battery character varying(100),
    brand_id bigint NOT NULL,
    category_id bigint NOT NULL,
    display_id bigint,
    screen_size_id bigint,
    wireless_id bigint,
    main_image character varying(100),
    description_az text,
    description_en text,
    title_az character varying(150),
    title_en character varying(150),
    campaign_id bigint,
    discounted_price double precision,
    CONSTRAINT product_product_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.product_product OWNER TO unistore;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO unistore;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product_product.id;


--
-- Name: product_product_tags; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.product_product_tags (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.product_product_tags OWNER TO unistore;

--
-- Name: product_product_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.product_product_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_tags_id_seq OWNER TO unistore;

--
-- Name: product_product_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.product_product_tags_id_seq OWNED BY public.product_product_tags.id;


--
-- Name: product_productreview; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.product_productreview (
    id bigint NOT NULL,
    comment text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    author_id bigint NOT NULL,
    parent_id bigint,
    product_id bigint NOT NULL
);


ALTER TABLE public.product_productreview OWNER TO unistore;

--
-- Name: product_productreview_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.product_productreview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productreview_id_seq OWNER TO unistore;

--
-- Name: product_productreview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.product_productreview_id_seq OWNED BY public.product_productreview.id;


--
-- Name: product_screen; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.product_screen (
    id bigint NOT NULL,
    size character varying(5) NOT NULL
);


ALTER TABLE public.product_screen OWNER TO unistore;

--
-- Name: product_screen_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.product_screen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_screen_id_seq OWNER TO unistore;

--
-- Name: product_screen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.product_screen_id_seq OWNED BY public.product_screen.id;


--
-- Name: product_tag; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.product_tag (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    name_az character varying(50),
    name_en character varying(50)
);


ALTER TABLE public.product_tag OWNER TO unistore;

--
-- Name: product_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.product_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_tag_id_seq OWNER TO unistore;

--
-- Name: product_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.product_tag_id_seq OWNED BY public.product_tag.id;


--
-- Name: product_wireless; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.product_wireless (
    id bigint NOT NULL,
    wifi character varying(255),
    bluetooth character varying(150)
);


ALTER TABLE public.product_wireless OWNER TO unistore;

--
-- Name: product_wireless_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.product_wireless_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_wireless_id_seq OWNER TO unistore;

--
-- Name: product_wireless_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.product_wireless_id_seq OWNED BY public.product_wireless.id;


--
-- Name: users_cart; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.users_cart (
    id bigint NOT NULL,
    total double precision,
    created_at date NOT NULL,
    modified_at date NOT NULL,
    owner_id bigint NOT NULL,
    is_complete boolean NOT NULL
);


ALTER TABLE public.users_cart OWNER TO unistore;

--
-- Name: users_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.users_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_cart_id_seq OWNER TO unistore;

--
-- Name: users_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.users_cart_id_seq OWNED BY public.users_cart.id;


--
-- Name: users_cartitem; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.users_cartitem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    added_at date NOT NULL,
    modified_at date NOT NULL,
    cart_id bigint NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT users_cartitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.users_cartitem OWNER TO unistore;

--
-- Name: users_cartitem_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.users_cartitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_cartitem_id_seq OWNER TO unistore;

--
-- Name: users_cartitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.users_cartitem_id_seq OWNED BY public.users_cartitem.id;


--
-- Name: users_order; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.users_order (
    id bigint NOT NULL,
    status character varying(13) NOT NULL,
    phone character varying(255) NOT NULL,
    total double precision NOT NULL,
    products_quantity integer NOT NULL,
    city character varying(255) NOT NULL,
    street character varying(200) NOT NULL,
    building integer NOT NULL,
    zip integer NOT NULL,
    payment character varying(255) NOT NULL,
    promo_code character varying(10),
    complete boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    receiver character varying(255),
    CONSTRAINT users_order_products_quantity_check CHECK ((products_quantity >= 0))
);


ALTER TABLE public.users_order OWNER TO unistore;

--
-- Name: users_order_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.users_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_order_id_seq OWNER TO unistore;

--
-- Name: users_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.users_order_id_seq OWNED BY public.users_order.id;


--
-- Name: users_orderitem; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.users_orderitem (
    id bigint NOT NULL,
    created_at date NOT NULL,
    modified_at date NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT users_orderitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.users_orderitem OWNER TO unistore;

--
-- Name: users_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.users_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_orderitem_id_seq OWNER TO unistore;

--
-- Name: users_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.users_orderitem_id_seq OWNED BY public.users_orderitem.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(128) NOT NULL
);


ALTER TABLE public.users_user OWNER TO unistore;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO unistore;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO unistore;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO unistore;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO unistore;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO unistore;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: users_wishlist; Type: TABLE; Schema: public; Owner: unistore
--

CREATE TABLE public.users_wishlist (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.users_wishlist OWNER TO unistore;

--
-- Name: users_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: unistore
--

CREATE SEQUENCE public.users_wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_wishlist_id_seq OWNER TO unistore;

--
-- Name: users_wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unistore
--

ALTER SEQUENCE public.users_wishlist_id_seq OWNED BY public.users_wishlist.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: blog_blog id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_blog ALTER COLUMN id SET DEFAULT nextval('public.blog_blog_id_seq'::regclass);


--
-- Name: blog_blog_tags id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_blog_tags ALTER COLUMN id SET DEFAULT nextval('public.blog_blog_tags_id_seq'::regclass);


--
-- Name: blog_comment id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_comment ALTER COLUMN id SET DEFAULT nextval('public.blog_comment_id_seq'::regclass);


--
-- Name: blog_media id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_media ALTER COLUMN id SET DEFAULT nextval('public.blog_media_id_seq'::regclass);


--
-- Name: blog_tag id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_tag ALTER COLUMN id SET DEFAULT nextval('public.blog_tag_id_seq'::regclass);


--
-- Name: core_contact id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.core_contact ALTER COLUMN id SET DEFAULT nextval('public.core_contact_id_seq'::regclass);


--
-- Name: core_subscriber id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.core_subscriber ALTER COLUMN id SET DEFAULT nextval('public.core_subscriber_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_clockedschedule id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: product_brand id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_brand ALTER COLUMN id SET DEFAULT nextval('public.product_brand_id_seq'::regclass);


--
-- Name: product_campaign id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_campaign ALTER COLUMN id SET DEFAULT nextval('public.product_campaign_id_seq'::regclass);


--
-- Name: product_category id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_category ALTER COLUMN id SET DEFAULT nextval('public.product_category_id_seq'::regclass);


--
-- Name: product_display id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_display ALTER COLUMN id SET DEFAULT nextval('public.product_display_id_seq'::regclass);


--
-- Name: product_logo id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_logo ALTER COLUMN id SET DEFAULT nextval('public.product_logo_id_seq'::regclass);


--
-- Name: product_media id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_media ALTER COLUMN id SET DEFAULT nextval('public.product_media_id_seq'::regclass);


--
-- Name: product_product id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product ALTER COLUMN id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: product_product_tags id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product_tags ALTER COLUMN id SET DEFAULT nextval('public.product_product_tags_id_seq'::regclass);


--
-- Name: product_productreview id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_productreview ALTER COLUMN id SET DEFAULT nextval('public.product_productreview_id_seq'::regclass);


--
-- Name: product_screen id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_screen ALTER COLUMN id SET DEFAULT nextval('public.product_screen_id_seq'::regclass);


--
-- Name: product_tag id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_tag ALTER COLUMN id SET DEFAULT nextval('public.product_tag_id_seq'::regclass);


--
-- Name: product_wireless id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_wireless ALTER COLUMN id SET DEFAULT nextval('public.product_wireless_id_seq'::regclass);


--
-- Name: users_cart id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_cart ALTER COLUMN id SET DEFAULT nextval('public.users_cart_id_seq'::regclass);


--
-- Name: users_cartitem id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_cartitem ALTER COLUMN id SET DEFAULT nextval('public.users_cartitem_id_seq'::regclass);


--
-- Name: users_order id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_order ALTER COLUMN id SET DEFAULT nextval('public.users_order_id_seq'::regclass);


--
-- Name: users_orderitem id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_orderitem ALTER COLUMN id SET DEFAULT nextval('public.users_orderitem_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Name: users_wishlist id; Type: DEFAULT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_wishlist ALTER COLUMN id SET DEFAULT nextval('public.users_wishlist_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add brand	6	add_brand
22	Can change brand	6	change_brand
23	Can delete brand	6	delete_brand
24	Can view brand	6	view_brand
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add display	8	add_display
30	Can change display	8	change_display
31	Can delete display	8	delete_display
32	Can view display	8	view_display
33	Can add logo	9	add_logo
34	Can change logo	9	change_logo
35	Can delete logo	9	delete_logo
36	Can view logo	9	view_logo
37	Can add media	10	add_media
38	Can change media	10	change_media
39	Can delete media	10	delete_media
40	Can view media	10	view_media
41	Can add product	11	add_product
42	Can change product	11	change_product
43	Can delete product	11	delete_product
44	Can view product	11	view_product
45	Can add product review	12	add_productreview
46	Can change product review	12	change_productreview
47	Can delete product review	12	delete_productreview
48	Can view product review	12	view_productreview
49	Can add screen	13	add_screen
50	Can change screen	13	change_screen
51	Can delete screen	13	delete_screen
52	Can view screen	13	view_screen
53	Can add wireless	14	add_wireless
54	Can change wireless	14	change_wireless
55	Can delete wireless	14	delete_wireless
56	Can view wireless	14	view_wireless
57	Can add tag	15	add_tag
58	Can change tag	15	change_tag
59	Can delete tag	15	delete_tag
60	Can view tag	15	view_tag
61	Can add campaign	16	add_campaign
62	Can change campaign	16	change_campaign
63	Can delete campaign	16	delete_campaign
64	Can view campaign	16	view_campaign
65	Can add User	17	add_user
66	Can change User	17	change_user
67	Can delete User	17	delete_user
68	Can view User	17	view_user
69	Can add cart	18	add_cart
70	Can change cart	18	change_cart
71	Can delete cart	18	delete_cart
72	Can view cart	18	view_cart
73	Can add order	19	add_order
74	Can change order	19	change_order
75	Can delete order	19	delete_order
76	Can view order	19	view_order
77	Can add wishlist	20	add_wishlist
78	Can change wishlist	20	change_wishlist
79	Can delete wishlist	20	delete_wishlist
80	Can view wishlist	20	view_wishlist
81	Can add order item	21	add_orderitem
82	Can change order item	21	change_orderitem
83	Can delete order item	21	delete_orderitem
84	Can view order item	21	view_orderitem
85	Can add cart item	22	add_cartitem
86	Can change cart item	22	change_cartitem
87	Can delete cart item	22	delete_cartitem
88	Can view cart item	22	view_cartitem
89	Can add blog	23	add_blog
90	Can change blog	23	change_blog
91	Can delete blog	23	delete_blog
92	Can view blog	23	view_blog
93	Can add tag	24	add_tag
94	Can change tag	24	change_tag
95	Can delete tag	24	delete_tag
96	Can view tag	24	view_tag
97	Can add media	25	add_media
98	Can change media	25	change_media
99	Can delete media	25	delete_media
100	Can view media	25	view_media
101	Can add comment	26	add_comment
102	Can change comment	26	change_comment
103	Can delete comment	26	delete_comment
104	Can view comment	26	view_comment
105	Can add contact	27	add_contact
106	Can change contact	27	change_contact
107	Can delete contact	27	delete_contact
108	Can view contact	27	view_contact
109	Can add subscriber	28	add_subscriber
110	Can change subscriber	28	change_subscriber
111	Can delete subscriber	28	delete_subscriber
112	Can view subscriber	28	view_subscriber
113	Can add crontab	29	add_crontabschedule
114	Can change crontab	29	change_crontabschedule
115	Can delete crontab	29	delete_crontabschedule
116	Can view crontab	29	view_crontabschedule
117	Can add interval	30	add_intervalschedule
118	Can change interval	30	change_intervalschedule
119	Can delete interval	30	delete_intervalschedule
120	Can view interval	30	view_intervalschedule
121	Can add periodic task	31	add_periodictask
122	Can change periodic task	31	change_periodictask
123	Can delete periodic task	31	delete_periodictask
124	Can view periodic task	31	view_periodictask
125	Can add periodic tasks	32	add_periodictasks
126	Can change periodic tasks	32	change_periodictasks
127	Can delete periodic tasks	32	delete_periodictasks
128	Can view periodic tasks	32	view_periodictasks
129	Can add solar event	33	add_solarschedule
130	Can change solar event	33	change_solarschedule
131	Can delete solar event	33	delete_solarschedule
132	Can view solar event	33	view_solarschedule
133	Can add clocked	34	add_clockedschedule
134	Can change clocked	34	change_clockedschedule
135	Can delete clocked	34	delete_clockedschedule
136	Can view clocked	34	view_clockedschedule
\.


--
-- Data for Name: blog_blog; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.blog_blog (id, title, description, slug, created_at, description_az, description_en, title_az, title_en, main_image) FROM stdin;
2	Black Friday is really really good time to buy a Mac	With Black Friday coming up, there are already some fantastic deals on MacBook Airs and Pros, and more are likely on the way. And you shouldn’t hesitate to buy one.\r\n\r\nWith the recent news that Apple won’t release any more new Macs until next year, maybe you decided to put off that Mac purchase. While you can absolutely wait until next year to get a better Mac, we think Black Friday is the perfect opportunity to invest in a new Mac. If you’re not sure if you should buy now or wait until later, here are a few reasons why you should go ahead and make the investment.\r\n\r\nIf your tendency is to wait, you’re going to be waiting for a good amount of time. The speculation is that Apple won’t release new Macs until March 2023–probably the end of that month. That’s a long four months from now (three months if your new Mac purchase is a December holiday gift). That time could be spent reaping the benefits of a new Mac–the improved speed, the better graphics, the new designs.	black-friday-is-really-really-good-time-to-buy-a-mac	2022-11-22 13:43:48.003273+00	Qara Cümə yaxınlaşdıqca, MacBook Airs və Pros-da artıq bəzi fantastik sövdələşmələr var və çox güman ki, yoldadır. Və birini almaqdan çəkinməməlisiniz.\r\n\r\nApple-ın gələn ilə qədər daha yeni Mac-ləri buraxmayacağına dair son xəbərlərlə, bəlkə siz Mac alışını təxirə salmağa qərar verdiniz. Daha yaxşı bir Mac əldə etmək üçün gələn ilə qədər gözləyə bilsəniz də, Qara Cümə gününün yeni Mac-a investisiya etmək üçün mükəmməl fürsət olduğunu düşünürük. İndi almağınızdan əmin deyilsinizsə və ya sonraya qədər gözlədiyinizə əmin deyilsinizsə, burada davam edib investisiya etməyiniz üçün bir neçə səbəb var.\r\n\r\nƏgər sizin meyliniz gözləməkdirsə, yaxşı bir müddət gözləyəcəksiniz. Fərziyyə budur ki, Apple yeni Mac-ları 2023-cü ilin martına qədər - yəqin ki, həmin ayın sonuna qədər buraxmayacaq. Bu, artıq dörd aydır (yeni Mac alışınız dekabr bayramı hədiyyəsidirsə, üç ay). Bu vaxt yeni Mac-in faydalarını əldə etməyə sərf edilə bilər – təkmilləşdirilmiş sürət, daha yaxşı qrafika, yeni dizayn.	With Black Friday coming up, there are already some fantastic deals on MacBook Airs and Pros, and more are likely on the way. And you shouldn’t hesitate to buy one.\r\n\r\nWith the recent news that Apple won’t release any more new Macs until next year, maybe you decided to put off that Mac purchase. While you can absolutely wait until next year to get a better Mac, we think Black Friday is the perfect opportunity to invest in a new Mac. If you’re not sure if you should buy now or wait until later, here are a few reasons why you should go ahead and make the investment.\r\n\r\nIf your tendency is to wait, you’re going to be waiting for a good amount of time. The speculation is that Apple won’t release new Macs until March 2023–probably the end of that month. That’s a long four months from now (three months if your new Mac purchase is a December holiday gift). That time could be spent reaping the benefits of a new Mac–the improved speed, the better graphics, the new designs.	Qara Cümə Mac almaq üçün həqiqətən yaxşı vaxtdır	Black Friday is really really good time to buy a Mac	uploads/2022/11/22/mac-pro_z5kmwRp.webp
1	Razer software update transforms Blade 14 ports to USB4	If you’ve bought a 2022 edition of the Razer Blade 14, you’re in for an unexpected bonus: a firmware upgrade that will transform the laptop’s USB-C ports into full-fledged USB4 ports, upping their throughput significantly.\r\n\r\nRazer said that the unexpected upgrade was already supported by the laptop’s existing hardware, but that the upgrade was being made available via AMD’s new support for the USB4 standard.\r\n\r\nIf you visit (and buy) a Razer Blade 14 on Razer’s site, the Razer Blade 14, the laptop is currently advertised as having a “2 x USB 3.2 Gen 2 Type-C with Power Delivery and Display Port 1.4” ports, which would normally deliver 10Gbps on each port. Now, thanks to the upgrade, each port will be capable of 40Gbps, via USB4. That’s enough to connect a Thunderbolt dock (that supports USB4) or a dedicated USB4 peripheral like a fast SSD or multiple 4K displays. Before the upgrade, connecting those external devices wasn’t possible.\r\n\r\nImproving a laptop port’s capabilities via a software upgrade should be impossible. But a spokesman for Razer said that, “the existing hardware already resident in the Blade 14 is capable of supporting USB4, but the feature was not initially present due to software limitations. Those limitations have been resolved, hence a firmware update is all that is required to leverage the full USB4 standard.”	razer-software-update-transforms-blade-14-ports-to-usb4-quadrupling-speeds	2022-11-22 13:36:01.15491+00	Əgər siz Razer Blade 14-ün 2022-ci il buraxılışını almısınızsa, gözlənilməz bir bonus gözləyirsiniz: noutbukun USB-C portlarını tam hüquqlu USB4 portlarına çevirərək onların ötürmə qabiliyyətini əhəmiyyətli dərəcədə artıracaq proqram təminatının təkmilləşdirilməsi.\r\n\r\nRazer, gözlənilməz təkmilləşdirmənin artıq noutbukun mövcud avadanlıqları tərəfindən dəstəkləndiyini, lakin yeniləmənin AMD-nin USB4 standartı üçün yeni dəstəyi vasitəsilə mümkün olduğunu söylədi.\r\n\r\nƏgər siz Razer saytında Razer Blade 14-ə, Razer Blade 14-ə baş çəksəniz (və satın alsanız), noutbuk hazırda “2 x USB 3.2 Gen 2 Type-C, Güc Çatdırılması və Display Port 1.4” portlarına malik olduğu elan edilir. normal olaraq hər portda 10Gbps çatdırır. İndi təkmilləşdirmə sayəsində hər bir port USB4 vasitəsilə 40Gbps sürətə malik olacaq. Bu, Thunderbolt dokunu (USB4-ü dəstəkləyən) və ya sürətli SSD və ya çoxsaylı 4K displey kimi xüsusi USB4 periferik qurğunu qoşmaq üçün kifayətdir. Təkmilləşdirmədən əvvəl bu xarici cihazları birləşdirmək mümkün deyildi.\r\n\r\nLaptop portunun imkanlarını proqram təminatının təkmilləşdirilməsi ilə təkmilləşdirmək qeyri-mümkün olmalıdır. Lakin Razer sözçüsü dedi ki, “Artıq Blade 14-də mövcud olan avadanlıq USB4-ü dəstəkləyə bilir, lakin proqram məhdudiyyətləri səbəbindən bu xüsusiyyət əvvəlcə mövcud deyildi. Bu məhdudiyyətlər həll edildi, buna görə də tam USB4 standartından istifadə etmək üçün proqram təminatının yenilənməsi tələb olunur.”	If you’ve bought a 2022 edition of the Razer Blade 14, you’re in for an unexpected bonus: a firmware upgrade that will transform the laptop’s USB-C ports into full-fledged USB4 ports, upping their throughput significantly.\r\n\r\nRazer said that the unexpected upgrade was already supported by the laptop’s existing hardware, but that the upgrade was being made available via AMD’s new support for the USB4 standard.\r\n\r\nIf you visit (and buy) a Razer Blade 14 on Razer’s site, the Razer Blade 14, the laptop is currently advertised as having a “2 x USB 3.2 Gen 2 Type-C with Power Delivery and Display Port 1.4” ports, which would normally deliver 10Gbps on each port. Now, thanks to the upgrade, each port will be capable of 40Gbps, via USB4. That’s enough to connect a Thunderbolt dock (that supports USB4) or a dedicated USB4 peripheral like a fast SSD or multiple 4K displays. Before the upgrade, connecting those external devices wasn’t possible.\r\n\r\nImproving a laptop port’s capabilities via a software upgrade should be impossible. But a spokesman for Razer said that, “the existing hardware already resident in the Blade 14 is capable of supporting USB4, but the feature was not initially present due to software limitations. Those limitations have been resolved, hence a firmware update is all that is required to leverage the full USB4 standard.”	Razer yeniləməsi Blade 14 portlarını USB4-ə çevirir	Razer software update transforms Blade 14 ports to USB4	uploads/2022/11/22/razer_8LFTxho.jpg
\.


--
-- Data for Name: blog_blog_tags; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.blog_blog_tags (id, blog_id, tag_id) FROM stdin;
1	1	1
2	2	2
\.


--
-- Data for Name: blog_comment; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.blog_comment (id, author_id, email, comment, created_at, modified_at, blog_id, parent_id) FROM stdin;
2	1	admin@gmail.com	jhbgvfcgd	2022-11-24 12:59:22.391233+00	2022-11-24	2	\N
3	1	admin@gmail.com	hbgtfg	2022-11-24 12:59:27.929891+00	2022-11-24	2	\N
\.


--
-- Data for Name: blog_media; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.blog_media (id, media, blog_id) FROM stdin;
1	uploads/2022/11/22/Razer_Blade_14_AMD_CPU-1.jpg	1
4	uploads/2022/11/22/m2-macbook-air-hero_g2L65cE.webp	2
2	uploads/2022/11/22/razer.jpg	1
\.


--
-- Data for Name: blog_tag; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.blog_tag (id, name, name_az, name_en) FROM stdin;
1	newest	ən yeni	newest
2	popular	məhşur	popular
\.


--
-- Data for Name: core_contact; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.core_contact (id, mail, message) FROM stdin;
1	lamankalbiyeva@gmail.com	c c dcdcc
2	dfdfdf@gmmm.bom	c c dcdcc
3	dfdfdf@gmmm.bom	c c dcdcc
4	lamankalbiyeva@gmail.com	vghvvh
5	lamankalbiyeva@gmail.com	dcvdcv
6	lamankalbiyeva@gmail.com	ededed
7	lamankalbiyeva@gmail.com	wsxdsxs
8	lamankalbiyeva@gmail.com	nhbjgyt
9	dfdfdf@gmmm.bom	hbgyhtv
10	dfdfdf@gmmm.bom	fcdrvfdrf
11	lamankalbiyeva@gmail.com	cdfdrc
12	lamankalbiyeva@gmail.com	dcddfcd
13	dfdfdf@gmmm.bom	nhgby
14	lamankalbiyeva@gmail.com	fvcfdvfd
15	lamankalbiyeva@gmail.com	jkhgfdg
\.


--
-- Data for Name: core_subscriber; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.core_subscriber (id, email, added_at) FROM stdin;
3	l.kelbiyeva@gmail.com	2022-11-24 08:44:17.243671+00
4	admn.unistore@gmail.com	2022-11-24 08:45:24.19729+00
5	asdfghjk@gmail.com	2022-11-24 08:50:19.313947+00
6	lamankalbiyeva@gmail.com	2022-12-12 09:36:40.543269+00
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-11-19 13:39:32.136881+00	1	laptop	1	[{"added": {}}]	7	1
2	2022-11-19 13:39:48.90613+00	1	/img/uploads/%Y/%m/%d/brands/Apple_logo_black.svg_3HiJZBM_eYoYnCZ_9cwS9jc_Fk0omSD_pEuKJz8.png	1	[{"added": {}}]	9	1
3	2022-11-19 13:39:49.62409+00	1	apple	1	[{"added": {}}]	6	1
4	2022-11-19 13:39:57.093088+00	1	14	1	[{"added": {}}]	13	1
5	2022-11-19 13:40:04.569653+00	1	newest	1	[{"added": {}}]	15	1
6	2022-11-19 13:40:22.243187+00	1	Macbook pro	1	[{"added": {}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/19/1.jpg"}}]	11	1
7	2022-11-19 13:54:57.481104+00	4	admin@gmail.com	3		19	1
8	2022-11-19 13:54:57.488252+00	3	admin@gmail.com	3		19	1
9	2022-11-19 13:54:57.49207+00	2	admin@gmail.com	3		19	1
10	2022-11-19 13:54:57.495825+00	1	admin@gmail.com	3		19	1
11	2022-11-19 14:35:37.772313+00	1	Black Friday	1	[{"added": {}}]	16	1
12	2022-11-19 14:43:50.604013+00	1	Black Friday	3		16	1
13	2022-11-19 17:24:27.523449+00	2	Black Friday	1	[{"added": {}}]	16	1
14	2022-11-19 17:26:21.166875+00	3	Lenovo Sale	1	[{"added": {}}]	16	1
15	2022-11-19 17:27:47.98453+00	4	discount on accessories	1	[{"added": {}}]	16	1
16	2022-11-19 17:28:03.419427+00	4	discount on accessories	2	[{"changed": {"fields": ["Image"]}}]	16	1
17	2022-11-19 17:28:06.919486+00	3	Lenovo Sale	2	[]	16	1
18	2022-11-19 17:32:55.007344+00	2	/img/uploads/%Y/%m/%d/brands/lenovo_SiBc0OH.png	1	[{"added": {}}]	9	1
19	2022-11-19 17:32:55.996312+00	2	Lenovo	1	[{"added": {}}]	6	1
20	2022-11-19 17:34:01.419294+00	2	15.6	1	[{"added": {}}]	13	1
21	2022-11-19 17:34:13.060895+00	2	sale	1	[{"added": {}}]	15	1
22	2022-11-19 17:34:24.040085+00	3	popular	1	[{"added": {}}]	15	1
23	2022-11-19 17:34:39.253198+00	2	Lenovo Yoga	1	[{"added": {}}]	11	1
24	2022-11-19 17:37:08.4201+00	3	13.3	1	[{"added": {}}]	13	1
25	2022-11-19 17:38:30.539258+00	3	Lenovo ThinkPad	1	[{"added": {}}]	11	1
26	2022-11-19 17:42:27.654293+00	2	hybrid	1	[{"added": {}}]	7	1
27	2022-11-19 17:43:20.149874+00	3	/img/uploads/%Y/%m/%d/brands/Dell_Logo.svg_LgrGCNU.png	1	[{"added": {}}]	9	1
28	2022-11-19 17:43:21.036114+00	3	dell	1	[{"added": {}}]	6	1
29	2022-11-19 17:44:05.878442+00	4	Dell Inspiron	1	[{"added": {}}]	11	1
30	2022-11-19 17:49:28.952888+00	3	headset	1	[{"added": {}}]	7	1
31	2022-11-19 17:50:46.062678+00	4	/img/uploads/%Y/%m/%d/brands/hyperx_dQWr15M.png	1	[{"added": {}}]	9	1
32	2022-11-19 17:50:46.937856+00	4	HyperX	1	[{"added": {}}]	6	1
33	2022-11-19 17:51:04.42461+00	4	12	1	[{"added": {}}]	13	1
34	2022-11-19 17:51:25.270374+00	5	Headset HyperX	1	[{"added": {}}]	11	1
35	2022-11-19 17:53:20.508758+00	5	Headset HyperX	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
36	2022-11-19 19:35:56.445986+00	2	Black Friday	2	[{"changed": {"fields": ["Image"]}}]	16	1
37	2022-11-19 19:39:57.649557+00	2	Black Friday	2	[{"changed": {"fields": ["Image"]}}]	16	1
38	2022-11-19 19:42:42.664684+00	2	Black Friday	2	[{"changed": {"fields": ["Image"]}}]	16	1
39	2022-11-19 20:05:39.478726+00	3	Lenovo Sale	2	[{"changed": {"fields": ["Image"]}}]	16	1
40	2022-11-19 20:07:11.122537+00	2	Black Friday	2	[{"changed": {"fields": ["Image"]}}]	16	1
41	2022-11-19 20:07:27.708969+00	2	Black Friday	2	[{"changed": {"fields": ["Image"]}}]	16	1
42	2022-11-19 20:07:44.908186+00	2	Black Friday	2	[{"changed": {"fields": ["Image"]}}]	16	1
43	2022-11-19 20:12:19.67957+00	4	discount on accessories	2	[{"changed": {"fields": ["Image"]}}]	16	1
44	2022-11-19 20:21:41.490305+00	2	Black Friday	2	[{"changed": {"fields": ["Image"]}}]	16	1
45	2022-11-19 20:31:43.863565+00	3	Lenovo Sale	2	[{"changed": {"fields": ["Image"]}}]	16	1
46	2022-11-20 06:48:16.552936+00	5	/img/uploads/%Y/%m/%d/brands/asus_P6HephJ.jpeg	1	[{"added": {}}]	9	1
47	2022-11-20 06:48:17.667805+00	5	asus	1	[{"added": {}}]	6	1
48	2022-11-20 06:48:42.200889+00	4	newest	1	[{"added": {}}]	15	1
49	2022-11-20 06:49:32.823064+00	6	Asus transformer	1	[{"added": {}}]	11	1
50	2022-11-20 06:51:11.280313+00	4	desktop	1	[{"added": {}}]	7	1
51	2022-11-20 06:51:18.568137+00	5	27	1	[{"added": {}}]	13	1
52	2022-11-20 06:51:36.798238+00	5	popular	1	[{"added": {}}]	15	1
53	2022-11-20 06:51:45.270626+00	7	Apple Imac Retina 27	1	[{"added": {}}]	11	1
54	2022-11-20 06:54:26.378889+00	6	/img/uploads/%Y/%m/%d/brands/microsoft_Jx16s6M.webp	1	[{"added": {}}]	9	1
55	2022-11-20 06:54:28.658194+00	6	microsoft	1	[{"added": {}}]	6	1
56	2022-11-20 06:55:05.465436+00	6	28	1	[{"added": {}}]	13	1
57	2022-11-20 06:55:41.710305+00	6	bestseller	1	[{"added": {}}]	15	1
58	2022-11-20 06:55:48.996222+00	8	Microsoft Surface Studio	1	[{"added": {}}]	11	1
59	2022-11-20 07:00:23.147926+00	3	headphone	2	[{"changed": {"fields": ["Name [en]"]}}]	7	1
60	2022-11-20 07:02:04.161243+00	9	Apple AirPods Max	1	[{"added": {}}]	11	1
61	2022-11-20 07:02:37.62306+00	9	Apple AirPods Max	2	[{"changed": {"fields": ["Main image"]}}]	11	1
62	2022-11-20 07:04:02.311104+00	1	Macbook pro	2	[{"changed": {"fields": ["Tags"]}}]	11	1
63	2022-11-20 07:04:09.207151+00	2	Lenovo Yoga	2	[{"changed": {"fields": ["Tags"]}}]	11	1
64	2022-11-20 07:04:15.126988+00	3	Lenovo ThinkPad	2	[{"changed": {"fields": ["Tags"]}}]	11	1
65	2022-11-20 07:04:20.703126+00	5	Headset HyperX	2	[{"changed": {"fields": ["Tags"]}}]	11	1
66	2022-11-20 07:04:25.355714+00	5	Headset HyperX	2	[]	11	1
67	2022-11-20 07:04:43.445513+00	3		3		15	1
68	2022-11-20 07:04:43.449382+00	2		3		15	1
69	2022-11-20 07:04:43.451219+00	1		3		15	1
70	2022-11-20 07:05:38.300407+00	4	Dell Inspiron	2	[{"changed": {"fields": ["Tags"]}}]	11	1
71	2022-11-20 07:05:42.964723+00	3	Lenovo ThinkPad	2	[]	11	1
72	2022-11-20 07:09:42.332773+00	7	13.6	1	[{"added": {}}]	13	1
73	2022-11-20 07:10:14.604764+00	10	Macbook Air M2	1	[{"added": {}}]	11	1
74	2022-11-20 07:12:03.28912+00	7	/img/uploads/%Y/%m/%d/brands/hp_CZ7UzcW_9MC6dar_5oaZw3r_ZJiAyHN.png	1	[{"added": {}}]	9	1
75	2022-11-20 07:12:04.523026+00	7	HP	1	[{"added": {}}]	6	1
76	2022-11-20 07:12:39.928561+00	11	HP Spectre	1	[{"added": {}}]	11	1
77	2022-11-20 07:14:39.426174+00	12	Lenova Ideacenter	1	[{"added": {}}]	11	1
78	2022-11-20 07:15:18.316503+00	1	Macbook pro M1 Pro	2	[{"changed": {"fields": ["Title [az]", "Title [en]"]}}]	11	1
79	2022-11-20 07:17:58.386919+00	13	HD 350BT	1	[{"added": {}}]	11	1
80	2022-11-20 07:19:23.968606+00	8	/img/uploads/%Y/%m/%d/brands/beats-logo_IMW2GZg.png	1	[{"added": {}}]	9	1
81	2022-11-20 07:19:24.703626+00	8	beat	1	[{"added": {}}]	6	1
82	2022-11-20 07:20:05.875303+00	14	Beats Solo3 Wireless	1	[{"added": {}}]	11	1
83	2022-11-20 07:20:48.043146+00	14	Beats Solo3 Wireless	2	[{"changed": {"fields": ["Main image"]}}]	11	1
84	2022-11-20 07:27:41.064131+00	8	24	1	[{"added": {}}]	13	1
85	2022-11-20 07:27:49.34176+00	15	Apple Imac Purple	1	[{"added": {}}]	11	1
86	2022-11-20 07:29:42.928214+00	9	22	1	[{"added": {}}]	13	1
87	2022-11-20 07:29:54.433008+00	16	HP All-In-One	1	[{"added": {}}]	11	1
88	2022-11-20 07:31:49.101565+00	13	HD 350BT	2	[{"changed": {"fields": ["Main image"]}}]	11	1
89	2022-11-20 07:32:27.367232+00	13	HD 350BT	2	[{"changed": {"fields": ["Main image"]}}]	11	1
90	2022-11-22 13:02:40.806576+00	2	Black Friday	2	[{"changed": {"fields": ["Extra image"]}}]	16	1
91	2022-11-22 13:35:18.085868+00	1	newest	1	[{"added": {}}]	24	1
92	2022-11-22 13:36:01.169296+00	1	Razer software update transforms Blade 14 ports to USB4, quadrupling speeds	1	[{"added": {}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/Razer-Blade-14.webp"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/Razer-Blade-14_nHMuSOW.webp"}}]	23	1
93	2022-11-22 13:43:00.396346+00	2	popular	1	[{"added": {}}]	24	1
94	2022-11-22 13:43:48.022377+00	2	Black Friday is really really good time to buy a Mac	1	[{"added": {}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/m2-macbook-air-hero.webp"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/second_image.jpeg"}}]	23	1
95	2022-11-22 13:47:36.898119+00	1	Razer software update transforms Blade 14 ports to USB4, quadrupling speeds	2	[{"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/Razer_Blade_14_AMD_CPU-1.jpg", "fields": ["Media", "Is main"]}}, {"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/Razer_Blade_14__2021__Gaming___3.jpg", "fields": ["Media", "Is main"]}}]	23	1
96	2022-11-22 13:48:59.459504+00	1	Razer software update transforms Blade 14 ports to USB4, quadrupling speeds	2	[{"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/Razer_Blade_14_AMD_CPU-1.jpg", "fields": ["Is main"]}}, {"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/Razer_Blade_14__2021__Gaming___3.jpg", "fields": ["Is main"]}}]	23	1
97	2022-11-22 13:49:13.393564+00	1	Razer software update transforms Blade 14 ports to USB4, quadrupling speeds	2	[{"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/Razer_Blade_14_AMD_CPU-1.jpg", "fields": ["Is main"]}}, {"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/Razer_Blade_14__2021__Gaming___3.jpg", "fields": ["Is main"]}}]	23	1
98	2022-11-22 13:49:25.366606+00	2	Black Friday is really really good time to buy a Mac	2	[{"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/m2-macbook-air-hero.webp", "fields": ["Is main"]}}, {"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/second_image.jpeg", "fields": ["Is main"]}}]	23	1
99	2022-11-22 13:51:38.337092+00	2	Black Friday is really really good time to buy a Mac	2	[{"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/mac-pro.webp", "fields": ["Media", "Is main"]}}, {"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/second_image.jpeg", "fields": ["Is main"]}}]	23	1
100	2022-11-22 13:53:13.191818+00	2	Black Friday is really really good time to buy a Mac	2	[{"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/m2-macbook-air-hero_g2L65cE.webp", "fields": ["Media"]}}]	23	1
101	2022-11-22 16:38:22.844951+00	1	Razer software update transforms Blade 14 ports to USB4, quadrupling speeds	2	[{"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/razer.jpg", "fields": ["Media"]}}]	23	1
102	2022-11-22 19:14:10.569882+00	2	Black Friday is really really good time to buy a Mac	2	[{"changed": {"fields": ["Main image"]}}]	23	1
103	2022-11-22 19:14:29.992024+00	1	Razer software update transforms Blade 14 ports to USB4, quadrupling speeds	2	[{"changed": {"fields": ["Main image"]}}]	23	1
104	2022-11-22 19:17:26.680837+00	2	Black Friday is really really good time to buy a Mac	2	[{"deleted": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/22/mac-pro.webp"}}]	23	1
105	2022-11-22 19:46:16.914939+00	1	admin@gmail.com	3		26	1
106	2022-11-22 19:53:02.041244+00	14	Beats Solo3 Wireless	2	[{"changed": {"fields": ["Screen size"]}}]	11	1
107	2022-11-22 19:53:16.053561+00	13	HD 350BT	2	[{"changed": {"fields": ["Screen size", "Operating system"]}}]	11	1
108	2022-11-22 19:53:29.710312+00	9	Apple AirPods Max	2	[{"changed": {"fields": ["Screen size"]}}]	11	1
109	2022-11-22 19:53:39.823946+00	5	Headset HyperX	2	[{"changed": {"fields": ["Screen size"]}}]	11	1
110	2022-11-22 20:21:17.327531+00	8	Microsoft Surface	2	[{"changed": {"fields": ["Title [az]", "Title [en]"]}}]	11	1
111	2022-11-22 20:22:06.382657+00	1	Razer software update transforms Blade 14 ports to USB4	2	[{"changed": {"fields": ["Title [az]", "Title [en]"]}}]	23	1
112	2022-11-22 20:22:36.657973+00	1	Razer software update transforms Blade 14 ports to USB4	2	[{"changed": {"fields": ["Title [az]"]}}]	23	1
113	2022-11-23 14:25:39.63814+00	16	HP All-In-One	2	[{"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/23/chrome-book-asus.jpg"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/23/lenovo-thinkpad.webp"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/23/asus-transformer.jpg"}}]	11	1
114	2022-11-23 14:26:28.50705+00	15	Apple Imac Purple	2	[{"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/23/macbook-air-midnight.webp"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/23/imac-24-purple.jpeg"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/23/chrome-book-14.jpg"}}]	11	1
115	2022-11-24 08:36:23.528712+00	2	admn.unistore@gmail.com	3		28	1
116	2022-11-24 08:36:23.532739+00	1	lamankalbiyeva@gmail.com	3		28	1
117	2022-11-24 11:13:52.260582+00	10	Macbook Air M2	2	[{"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/24/Apple-MacBook-Air-13_png.webp"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/24/Apple-MacBook-Air-13-5-1_png.webp"}}]	11	1
118	2022-11-24 11:27:23.788591+00	9	Apple AirPods Max	2	[{"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/24/apple_airpodsmax.webp"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/24/Apple_AirPods_Max-6.jpg"}}]	11	1
119	2022-11-24 11:28:04.619644+00	9	Apple AirPods Max	2	[{"changed": {"fields": ["Price"]}}]	11	1
120	2022-11-24 11:29:03.54383+00	8	Microsoft Surface	2	[{"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/24/1.jpg"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/24/2.jpg"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/24/3.jpg"}}]	11	1
121	2022-11-24 11:34:39.651815+00	14	Beats Solo3 Wireless	2	[{"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/24/beat_solo3.jpeg"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/24/solo3-pdp-p06.jpg.large.2x.jpg"}}]	11	1
122	2022-11-24 15:20:22.876261+00	2	Black Friday	2	[{"changed": {"fields": ["Extra image"]}}]	16	1
123	2022-11-24 15:23:02.383192+00	2	Black Friday	2	[{"changed": {"fields": ["Extra image"]}}]	16	1
124	2022-11-25 06:25:12.661461+00	2	Black Friday	2	[{"changed": {"fields": ["Extra image"]}}]	16	1
125	2022-11-25 06:36:03.07581+00	2	Black Friday	2	[{"changed": {"fields": ["Extra image"]}}]	16	1
126	2022-11-25 06:48:27.641886+00	2	Black Friday	2	[{"changed": {"fields": ["Extra image"]}}]	16	1
127	2022-11-25 06:48:46.915923+00	2	Black Friday	2	[{"changed": {"fields": ["Extra image"]}}]	16	1
128	2022-11-25 06:50:00.976033+00	2	Black Friday	2	[{"changed": {"fields": ["Extra image"]}}]	16	1
129	2022-11-25 06:51:02.055759+00	2	Black Friday	2	[{"changed": {"fields": ["Extra image"]}}]	16	1
130	2022-11-25 06:59:15.017881+00	16	HP All-In-One	2	[]	11	1
131	2022-11-25 06:59:19.701221+00	15	Apple Imac Purple	2	[]	11	1
132	2022-11-25 06:59:26.411557+00	14	Beats Solo3 Wireless	2	[]	11	1
133	2022-11-25 06:59:33.782603+00	12	Lenova Ideacenter	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
134	2022-11-25 06:59:55.004884+00	10	Macbook Air M2	2	[]	11	1
135	2022-11-25 07:00:00.963636+00	7	Apple Imac Retina 27	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
136	2022-11-25 07:00:05.459558+00	7	Apple Imac Retina 27	2	[]	11	1
137	2022-11-25 07:00:11.249136+00	3	Lenovo ThinkPad	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
138	2022-11-25 07:00:37.051349+00	1	Macbook pro M1 Pro	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
139	2022-11-25 07:15:34.105167+00	2	Black Friday	2	[{"changed": {"fields": ["Percent"]}}]	16	1
140	2022-11-25 07:30:57.708216+00	6	Asus transformer	2	[{"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/25/asus-transformer.jpg"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/25/chrome-book-14.jpg"}}, {"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/25/ipad-air.jpg"}}]	11	1
141	2022-11-25 07:32:08.586124+00	9	Apple AirPods Max	2	[{"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/25/Apple_AirPods_Max-6.jpg"}}, {"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/25/airPods.jpeg", "fields": ["Media"]}}, {"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/25/apple_airpodsmax.webp", "fields": ["Media"]}}]	11	1
142	2022-11-25 07:33:01.514365+00	14	Beats Solo3 Wireless	2	[{"added": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/25/solo3-pdp-p06.jpg.large.2x.jpg"}}, {"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/25/solo3-wireless.jpeg", "fields": ["Media"]}}, {"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/25/beat_solo3.jpeg", "fields": ["Media"]}}]	11	1
143	2022-11-25 07:34:01.861366+00	14	Beats Solo3 Wireless	2	[{"changed": {"name": "media", "object": "/img/uploads/%Y/%m/%d/uploads/2022/11/25/beat_solo3_g8XHRNO.jpeg", "fields": ["Media"]}}]	11	1
144	2022-11-25 08:07:09.356415+00	6	Asus transformer	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
145	2022-11-25 08:09:10.453544+00	1	admin@gmail.com	1	[{"added": {}}]	18	1
146	2022-11-25 08:09:33.903791+00	1	admin@gmail.com	1	[{"added": {}}]	22	1
147	2022-11-25 08:09:56.077677+00	2	admin@gmail.com	1	[{"added": {}}]	22	1
148	2022-11-25 17:41:35.945071+00	1	admin@gmail.com	2	[{"changed": {"fields": ["Quantity"]}}]	22	1
149	2022-12-07 06:10:40.430138+00	16	HP All-In-One	2	[]	11	1
150	2022-12-07 06:10:51.560562+00	15	Apple Imac Purple	2	[]	11	1
151	2022-12-07 06:10:55.449288+00	14	Beats Solo3 Wireless	2	[]	11	1
152	2022-12-07 06:10:59.297358+00	13	HD 350BT	2	[]	11	1
153	2022-12-07 06:11:03.334881+00	12	Lenova Ideacenter	2	[]	11	1
154	2022-12-07 06:11:06.981122+00	12	Lenova Ideacenter	2	[]	11	1
155	2022-12-07 06:11:10.787492+00	11	HP Spectre	2	[]	11	1
156	2022-12-07 06:11:15.038063+00	10	Macbook Air M2	2	[]	11	1
157	2022-12-07 06:11:19.358273+00	9	Apple AirPods Max	2	[]	11	1
158	2022-12-07 06:11:30.685934+00	8	Microsoft Surface	2	[]	11	1
159	2022-12-07 06:11:34.951018+00	7	Apple Imac Retina 27	2	[]	11	1
160	2022-12-07 06:11:39.025185+00	6	Asus transformer	2	[]	11	1
161	2022-12-07 06:11:44.414632+00	5	Headset HyperX	2	[]	11	1
162	2022-12-07 06:11:49.592709+00	4	Dell Inspiron	2	[]	11	1
163	2022-12-07 06:11:54.519362+00	3	Lenovo ThinkPad	2	[]	11	1
164	2022-12-07 06:11:58.597728+00	2	Lenovo Yoga	2	[]	11	1
165	2022-12-07 06:12:02.365878+00	1	Macbook pro M1 Pro	2	[]	11	1
166	2022-12-07 06:17:51.932371+00	2	lamankalbiyeva@gmail.com	3		17	1
167	2022-12-07 06:21:17.068167+00	4	lamankalbiyeva@gmail.com	3		22	1
168	2022-12-07 06:21:17.075328+00	3	lamankalbiyeva@gmail.com	3		22	1
169	2022-12-07 06:22:16.719499+00	5	lamankalbiyeva@gmail.com	2	[{"changed": {"fields": ["Quantity"]}}]	22	1
170	2022-12-07 10:52:46.456448+00	10	admin@gmail.com	3		19	1
171	2022-12-07 10:52:46.463823+00	9	admin@gmail.com	3		19	1
172	2022-12-07 10:52:46.467633+00	8	admin@gmail.com	3		19	1
173	2022-12-07 10:52:46.471762+00	7	admin@gmail.com	3		19	1
174	2022-12-07 10:52:46.475377+00	6	admin@gmail.com	3		19	1
175	2022-12-07 10:52:46.478746+00	5	admin@gmail.com	3		19	1
176	2022-12-08 08:27:08.639619+00	18	lamankalbiyeva@gmail.com	3		21	1
177	2022-12-08 08:27:08.646074+00	17	lamankalbiyeva@gmail.com	3		21	1
178	2022-12-08 08:27:08.649334+00	16	lamankalbiyeva@gmail.com	3		21	1
179	2022-12-08 08:27:08.651858+00	15	lamankalbiyeva@gmail.com	3		21	1
180	2022-12-08 08:27:08.654004+00	14	admin@gmail.com	3		21	1
181	2022-12-08 08:27:08.656339+00	13	admin@gmail.com	3		21	1
182	2022-12-10 14:53:46.414413+00	5	New Year	1	[{"added": {}}]	16	1
183	2022-12-10 14:53:57.857456+00	15	Apple Imac Purple	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
184	2022-12-10 14:54:09.114513+00	10	Macbook Air M2	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
185	2022-12-10 14:54:27.027606+00	2	Black Friday	2	[{"changed": {"fields": ["Is active"]}}]	16	1
186	2022-12-10 14:56:06.07848+00	5	New Year Sales	2	[{"changed": {"fields": ["Image", "Name [az]", "Name [en]", "Description [az]"]}}]	16	1
187	2022-12-10 15:02:18.607286+00	28	lamankalbiyeva@gmail.com	2	[{"changed": {"fields": ["Quantity"]}}]	22	1
188	2022-12-10 15:02:31.501445+00	5	New Year Sales	2	[{"changed": {"fields": ["Image"]}}]	16	1
189	2022-12-10 15:14:02.917938+00	5	New Year Sales	2	[{"changed": {"fields": ["Extra image"]}}]	16	1
190	2022-12-10 15:16:41.060811+00	5	New Year Sales	2	[{"changed": {"fields": ["Extra image"]}}]	16	1
191	2022-12-10 15:18:23.526132+00	5	New Year Sales	2	[{"changed": {"fields": ["Extra image"]}}]	16	1
192	2022-12-10 15:22:20.168695+00	1	Macbook pro M1 Pro	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
193	2022-12-10 15:22:36.010547+00	2	Lenovo Yoga	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
194	2022-12-10 15:22:43.705427+00	3	Lenovo ThinkPad	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
195	2022-12-10 15:22:51.409989+00	4	Dell Inspiron	2	[]	11	1
196	2022-12-10 15:22:59.953813+00	5	Headset HyperX	2	[]	11	1
197	2022-12-10 15:23:07.803028+00	7	Apple Imac Retina 27	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
198	2022-12-10 15:23:14.46794+00	16	HP All-In-One	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
199	2022-12-10 15:35:39.634478+00	4	discount on accessories	2	[{"changed": {"fields": ["Image"]}}]	16	1
200	2022-12-10 15:37:09.37241+00	4	discount on accessories	2	[{"changed": {"fields": ["Image"]}}]	16	1
201	2022-12-10 15:42:09.265956+00	4	Dell Inspiron	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
202	2022-12-10 15:42:25.558907+00	12	Lenova Ideacenter	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
203	2022-12-10 15:42:41.514105+00	12	Lenova Ideacenter	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
204	2022-12-10 15:42:54.866425+00	11	HP Spectre	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
205	2022-12-10 15:43:05.003691+00	9	Apple AirPods Max	2	[{"changed": {"fields": ["Campaign"]}}]	11	1
206	2022-12-11 18:49:45.157161+00	11	HP Spectre	2	[]	11	1
207	2022-12-11 18:52:17.447053+00	11	HP Spectre	2	[{"changed": {"fields": ["Price"]}}]	11	1
208	2022-12-11 18:52:35.894639+00	12	Lenova Ideacenter	2	[]	11	1
209	2022-12-11 18:52:48.463088+00	2	Lenovo Yoga	2	[]	11	1
210	2022-12-11 18:53:01.898362+00	4	Dell Inspiron	2	[]	11	1
211	2022-12-11 19:44:08.906196+00	15	lamankalbiyeva@gmail.com	3		19	1
212	2022-12-11 19:47:47.712411+00	16	lamankalbiyeva@gmail.com	3		19	1
213	2022-12-11 19:54:07.901372+00	23	lamankalbiyeva@gmail.com	3		19	1
214	2022-12-11 19:54:07.908684+00	22	lamankalbiyeva@gmail.com	3		19	1
215	2022-12-11 19:54:07.913284+00	21	lamankalbiyeva@gmail.com	3		19	1
216	2022-12-11 19:54:07.91641+00	20	lamankalbiyeva@gmail.com	3		19	1
217	2022-12-11 19:54:07.919185+00	19	lamankalbiyeva@gmail.com	3		19	1
218	2022-12-11 19:54:07.921976+00	18	lamankalbiyeva@gmail.com	3		19	1
219	2022-12-11 19:54:07.924559+00	17	lamankalbiyeva@gmail.com	3		19	1
220	2022-12-11 19:55:09.104733+00	2	lamankalbiyeva@gmail.com	2	[{"changed": {"fields": ["Total", "Is complete"]}}]	18	1
221	2022-12-11 20:28:33.195751+00	43	lamankalbiyeva@gmail.com	3		22	1
222	2022-12-11 20:28:33.201912+00	42	lamankalbiyeva@gmail.com	3		22	1
223	2022-12-11 20:28:33.204922+00	41	lamankalbiyeva@gmail.com	3		22	1
224	2022-12-11 20:28:33.20723+00	40	lamankalbiyeva@gmail.com	3		22	1
225	2022-12-11 20:28:33.209716+00	39	lamankalbiyeva@gmail.com	3		22	1
226	2022-12-11 20:31:57.810768+00	49	lamankalbiyeva@gmail.com	3		22	1
227	2022-12-11 20:31:57.818362+00	48	lamankalbiyeva@gmail.com	3		22	1
228	2022-12-11 20:31:57.821439+00	46	lamankalbiyeva@gmail.com	3		22	1
229	2022-12-11 20:31:57.824453+00	45	lamankalbiyeva@gmail.com	3		22	1
230	2022-12-11 20:36:30.791566+00	51	lamankalbiyeva@gmail.com	3		22	1
231	2022-12-11 20:53:22.250631+00	24	lamankalbiyeva@gmail.com	3		19	1
232	2022-12-12 07:31:11.482061+00	27	lamankalbiyeva@gmail.com	3		19	1
233	2022-12-12 07:31:11.485727+00	26	lamankalbiyeva@gmail.com	3		19	1
234	2022-12-12 07:31:11.487718+00	25	lamankalbiyeva@gmail.com	3		19	1
235	2022-12-12 07:40:34.693318+00	29	lamankalbiyeva@gmail.com	3		19	1
236	2022-12-12 07:40:34.699749+00	28	lamankalbiyeva@gmail.com	3		19	1
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	product	brand
7	product	category
8	product	display
9	product	logo
10	product	media
11	product	product
12	product	productreview
13	product	screen
14	product	wireless
15	product	tag
16	product	campaign
17	users	user
18	users	cart
19	users	order
20	users	wishlist
21	users	orderitem
22	users	cartitem
23	blog	blog
24	blog	tag
25	blog	media
26	blog	comment
27	core	contact
28	core	subscriber
29	django_celery_beat	crontabschedule
30	django_celery_beat	intervalschedule
31	django_celery_beat	periodictask
32	django_celery_beat	periodictasks
33	django_celery_beat	solarschedule
34	django_celery_beat	clockedschedule
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	product	0001_initial	2022-11-19 12:32:12.43476+00
2	contenttypes	0001_initial	2022-11-19 12:32:12.446508+00
3	contenttypes	0002_remove_content_type_name	2022-11-19 12:32:12.460053+00
4	auth	0001_initial	2022-11-19 12:32:12.505393+00
5	auth	0002_alter_permission_name_max_length	2022-11-19 12:32:12.511874+00
6	auth	0003_alter_user_email_max_length	2022-11-19 12:32:12.518782+00
7	auth	0004_alter_user_username_opts	2022-11-19 12:32:12.525704+00
8	auth	0005_alter_user_last_login_null	2022-11-19 12:32:12.533364+00
9	auth	0006_require_contenttypes_0002	2022-11-19 12:32:12.537739+00
10	auth	0007_alter_validators_add_error_messages	2022-11-19 12:32:12.544507+00
11	auth	0008_alter_user_username_max_length	2022-11-19 12:32:12.551358+00
12	auth	0009_alter_user_last_name_max_length	2022-11-19 12:32:12.558246+00
13	auth	0010_alter_group_name_max_length	2022-11-19 12:32:12.56734+00
14	auth	0011_update_proxy_permissions	2022-11-19 12:32:12.577995+00
15	auth	0012_alter_user_first_name_max_length	2022-11-19 12:32:12.584451+00
16	users	0001_initial	2022-11-19 12:32:12.710622+00
17	admin	0001_initial	2022-11-19 12:32:12.736152+00
18	admin	0002_logentry_remove_auto_add	2022-11-19 12:32:12.744518+00
19	admin	0003_logentry_add_action_flag_choices	2022-11-19 12:32:12.754305+00
20	blog	0001_initial	2022-11-19 12:32:12.815624+00
21	blog	0002_alter_comment_author	2022-11-19 12:32:12.841058+00
22	blog	0003_blog_description_az_blog_description_en_and_more	2022-11-19 12:32:12.861356+00
23	blog	0004_alter_blog_created_at	2022-11-19 12:32:12.878054+00
24	blog	0005_alter_comment_created_at	2022-11-19 12:32:12.898595+00
25	core	0001_initial	2022-11-19 12:32:12.920473+00
26	core	0002_alter_contact_mail	2022-11-19 12:32:12.936052+00
27	core	0003_alter_subscriber_added_at	2022-11-19 12:32:12.945674+00
28	django_celery_beat	0001_initial	2022-11-19 12:32:12.985465+00
29	django_celery_beat	0002_auto_20161118_0346	2022-11-19 12:32:13.003111+00
30	django_celery_beat	0003_auto_20161209_0049	2022-11-19 12:32:13.013755+00
31	django_celery_beat	0004_auto_20170221_0000	2022-11-19 12:32:13.021625+00
32	django_celery_beat	0005_add_solarschedule_events_choices	2022-11-19 12:32:13.028603+00
33	django_celery_beat	0006_auto_20180322_0932	2022-11-19 12:32:13.052094+00
34	django_celery_beat	0007_auto_20180521_0826	2022-11-19 12:32:13.065728+00
35	django_celery_beat	0008_auto_20180914_1922	2022-11-19 12:32:13.082419+00
36	django_celery_beat	0006_auto_20180210_1226	2022-11-19 12:32:13.093771+00
37	django_celery_beat	0006_periodictask_priority	2022-11-19 12:32:13.102398+00
38	django_celery_beat	0009_periodictask_headers	2022-11-19 12:32:13.112491+00
39	django_celery_beat	0010_auto_20190429_0326	2022-11-19 12:32:13.212527+00
40	django_celery_beat	0011_auto_20190508_0153	2022-11-19 12:32:13.231924+00
41	django_celery_beat	0012_periodictask_expire_seconds	2022-11-19 12:32:13.240097+00
42	django_celery_beat	0013_auto_20200609_0727	2022-11-19 12:32:13.249167+00
43	django_celery_beat	0014_remove_clockedschedule_enabled	2022-11-19 12:32:13.257472+00
44	django_celery_beat	0015_edit_solarschedule_events_choices	2022-11-19 12:32:13.264278+00
45	django_celery_beat	0016_alter_crontabschedule_timezone	2022-11-19 12:32:13.271989+00
46	product	0002_initial	2022-11-19 12:32:13.415646+00
47	product	0003_alter_category_name_alter_category_name_az_and_more	2022-11-19 12:32:13.426941+00
48	product	0004_alter_productreview_created_at	2022-11-19 12:32:13.448562+00
49	product	0005_alter_screen_size	2022-11-19 12:32:13.460362+00
50	product	0006_delete_subscription	2022-11-19 12:32:13.468562+00
51	product	0007_product_main_image	2022-11-19 12:32:13.482303+00
52	product	0008_alter_product_main_image	2022-11-19 12:32:13.497919+00
53	product	0009_alter_product_main_image	2022-11-19 12:32:13.514036+00
54	product	0010_remove_product_main_image	2022-11-19 12:32:13.526252+00
55	product	0011_tag_product_tags	2022-11-19 12:32:13.562058+00
56	product	0012_alter_product_tags	2022-11-19 12:32:13.586321+00
57	product	0013_alter_screen_size	2022-11-19 12:32:13.595463+00
58	product	0014_remove_media_is_main_product_main_image	2022-11-19 12:32:13.615565+00
59	product	0015_product_description_az_product_description_en_and_more	2022-11-19 12:32:13.682966+00
60	product	0016_campaign_product_campaign	2022-11-19 12:32:13.711887+00
61	product	0017_campaign_image	2022-11-19 12:32:13.720191+00
62	product	0018_campaign_created_at_alter_campaign_activated_at	2022-11-19 12:32:13.738499+00
63	product	0019_alter_campaign_created_at	2022-11-19 12:32:13.747121+00
64	product	0020_remove_product_discount_alter_campaign_created_at_and_more	2022-11-19 12:32:13.779294+00
65	sessions	0001_initial	2022-11-19 12:32:13.795738+00
66	users	0002_alter_user_email	2022-11-19 12:32:13.810913+00
67	users	0003_remove_cart_quantity_remove_orderitem_quantity_and_more	2022-11-19 12:32:13.839308+00
68	users	0004_alter_order_created_at_alter_order_modified_at	2022-11-19 13:55:25.554172+00
69	product	0021_alter_campaign_percent	2022-11-19 17:12:32.526207+00
70	product	0022_campaign_extra_image	2022-11-19 19:57:41.335122+00
71	blog	0006_tag_name_az_tag_name_en	2022-11-20 05:59:49.675596+00
72	product	0023_tag_name_az_tag_name_en	2022-11-20 05:59:49.690118+00
73	blog	0007_blog_main_image	2022-11-22 19:02:10.151723+00
74	blog	0008_remove_media_is_main	2022-11-22 19:11:03.054857+00
75	product	0024_alter_product_operating_system_and_more	2022-11-22 19:52:42.862747+00
76	core	0004_rename_mail_subscriber_email	2022-11-24 08:37:44.660853+00
77	product	0025_product_discounted_price	2022-12-07 06:09:29.136207+00
78	users	0005_alter_order_promo_code	2022-12-07 06:09:29.153711+00
79	users	0006_orderitem_quantity_alter_order_status	2022-12-07 10:53:23.256654+00
80	users	0007_alter_cart_owner_alter_cartitem_cart	2022-12-08 08:08:49.861284+00
81	users	0008_cart_is_complete	2022-12-08 08:12:37.232212+00
82	users	0009_remove_order_email	2022-12-08 17:29:53.880986+00
83	users	0010_order_receiver	2022-12-08 17:57:34.802093+00
84	users	0011_alter_order_payment	2022-12-11 19:27:16.341203+00
85	users	0012_remove_order_country_alter_order_city_and_more	2022-12-12 07:18:10.210915+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
68zbe2zsw6a9lzf62mh3s0g7q2xcjtzt	.eJxVi0sKwzAMRO_idQmW5E_cZaHnMLIscOhnUTer0LsngSzS3bx5M4vJPH9bnrt-8lTN1YC5nLvC8tD3Lnbsw8F9uL94et4O-3dp3Nu2Tz6qigDZUgnFoy0E1iNs0UVnNWAaHfrCEDgkEl8pOeuQYIwUxfxWZYEw8Q:1owOkZ:4VpTaSmvACByfAX8fH40026o73vn6iGDvk1-kUvtaXk	2022-12-03 14:23:19.009205+00
ghikyfgfn3uqjz8wr5omav0cmex405ge	.eJxVi0sKwzAMRO_idQmW5E_cZaHnMLIscOhnUTer0LsngSzS3bx5M4vJPH9bnrt-8lTN1YC5nLvC8tD3Lnbsw8F9uL94et4O-3dp3Nu2Tz6qigDZUgnFoy0E1iNs0UVnNWAaHfrCEDgkEl8pOeuQYIwUxfxWZYEw8Q:1oxSue:uWtNzlxrVOrXrVEf3MWb478XLDCikeimxt_P19wVOLk	2022-12-06 13:02:08.209688+00
tpsjuc2255a6rujxcz85tpflmpift2kw	.eJxVi0sKwzAMRO_idQmW5E_cZaHnMLIscOhnUTer0LsngSzS3bx5M4vJPH9bnrt-8lTN1YC5nLvC8tD3Lnbsw8F9uL94et4O-3dp3Nu2Tz6qigDZUgnFoy0E1iNs0UVnNWAaHfrCEDgkEl8pOeuQYIwUxfxWZYEw8Q:1oxWHX:3PUcrWKRuJHMYl4HXM0VPQfeBF8PVD6zoqvggqxBcaE	2022-12-06 16:37:59.312274+00
zy6c6aajzzubrmc06igw2h4qfl6zvkoo	.eJxVi0sKwzAMRO_idQmW5E_cZaHnMLIscOhnUTer0LsngSzS3bx5M4vJPH9bnrt-8lTN1YC5nLvC8tD3Lnbsw8F9uL94et4O-3dp3Nu2Tz6qigDZUgnFoy0E1iNs0UVnNWAaHfrCEDgkEl8pOeuQYIwUxfxWZYEw8Q:1oyaBs:dY67yamP-xkvVNiimE6qVSivxTMSoDd2iqe9ypyV078	2022-12-09 15:00:32.160217+00
tpmz9s6uljpth376t1ut707j7ob1p48h	.eJxVi0sKwzAMRO_idQmW5E_cZaHnMLIscOhnUTer0LsngSzS3bx5M4vJPH9bnrt-8lTN1YC5nLvC8tD3Lnbsw8F9uL94et4O-3dp3Nu2Tz6qigDZUgnFoy0E1iNs0UVnNWAaHfrCEDgkEl8pOeuQYIwUxfxWZYEw8Q:1p2ndT:z0L2Xp9d9T6irHScKCak6fQdXYLcjWLXjn58xGogNXg	2022-12-21 06:10:27.568884+00
czdt5jz38xbqanqgiqhxbxh9frb9c6ao	.eJxVizsOwyAQBe9CHVkYGxZSRso50GNhhZVPEewq8t1tSy6Sct7M-6qIZa5xaeUTp6yualCX3y2BH-V9iANbd3Lr7i9Mz9tp_y4Vre59dskFgs-514mNtiIepfSaABG2A4sLPmXoQAZkSQtsGQ3RuDOzWje5GzN8:1p2nl7:ALHJrTQRXScL-hgJfULaIa9yCxxd88DEPceYgUKjezo	2022-12-21 06:18:21.320229+00
rv54xm6km22za9r5lm111oktttvpmtin	.eJxVi0sOwjAMBe-SNaoS17ESlkicI3JqW6n4LAhdIe4Olbpol_Nm3scVXt6tLF1fZRZ3dqM77bfK002fq1ixDxv34frg-X7Z7OHSuLd_LxUyJR8CJA9ZdPQZJk0xpyCWKoVobCpMRoaoWIMhVGSNpEge3PcHglAykQ:1p3MkU:m8zRWaNEVk-qPfdvi2nWI7Yf8OS6ZjqecIdanFBsMU4	2022-12-22 19:40:02.701676+00
yxnmjzb2fmumjbto91iajq3c8t49a7pk	.eJxVi0sKwzAMRO_idQmW5E_cZaHnMLIscOhnUTer0LsngSzS3bx5M4vJPH9bnrt-8lTN1YC5nLvC8tD3Lnbsw8F9uL94et4O-3dp3Nu2Tz6qigDZUgnFoy0E1iNs0UVnNWAaHfrCEDgkEl8pOeuQYIwUxfxWZYEw8Q:1p3xOG:1IIzqaLzU7dVRcRTy5n0rgHA84Td0UYwbg7ss4MTscc	2022-12-24 10:47:32.972243+00
9ppbrm6d5js3cy9lo8iqoepfb5wj9tbu	.eJxVi0sKwzAMRO_idQmW5E_cZaHnMLIscOhnUTer0LsngSzS3bx5M4vJPH9bnrt-8lTN1YC5nLvC8tD3Lnbsw8F9uL94et4O-3dp3Nu2Tz6qigDZUgnFoy0E1iNs0UVnNWAaHfrCEDgkEl8pOeuQYIwUxfxWZYEw8Q:1p4ROE:9IO3x-N67fAxbv91vehM6TtIt_-ZgtXkCm_585FVjMk	2022-12-25 18:49:30.76952+00
pe7aizbbon9a5ls7ycro68g1g8uocqfn	.eJxVi0sKwzAMRO_idQmW5E_cZaHnMLIscOhnUTer0LsngSzS3bx5M4vJPH9bnrt-8lTN1YC5nLvC8tD3Lnbsw8F9uL94et4O-3dp3Nu2Tz6qigDZUgnFoy0E1iNs0UVnNWAaHfrCEDgkEl8pOeuQYIwUxfxWZYEw8Q:1p4dH7:mCvaj6BnkrjIRCHOjctyg-IDT1NTo-KW6k1fJxT2geE	2022-12-26 07:30:57.212623+00
a2f2u5xraqzijpqc0qo5f4ymy0ggeuab	.eJxVi0sOwjAMBe-SNapqOzUOSyTOEdmJpVR8FoSuKu4OlbqA5byZt4asy6vlpfszzzWcQgyH3820XP2xiQ37sHMfLnedb-fd_l2a9vbtRQyrJqlU4pQMcMSpMEA8EnMFFyR1dGAwTixKVqgoGoxG4pjC-wNzQDHr:1p4fOg:Rm7JKfXU9khj3UTjRCwnXfl6YRQUEAAV0gbXsLUR--Y	2022-12-26 09:46:54.846673+00
\.


--
-- Data for Name: product_brand; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.product_brand (id, name, logo_id) FROM stdin;
1	apple	1
2	Lenovo	2
3	dell	3
4	HyperX	4
5	asus	5
6	microsoft	6
7	HP	7
8	beat	8
\.


--
-- Data for Name: product_campaign; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.product_campaign (id, name, name_az, name_en, description, description_az, description_en, percent, is_active, usage_limit, activated_at, image, created_at, extra_image) FROM stdin;
3	Lenovo Sale	Lenovo Endirimi	Lenovo Sale	Discount on Lenovo products	Lenovo məhsullarına endirim	Discount on Lenovo products	30	t	5	\N	uploads/2022/11/20/lenova3.jpeg	2022-11-19 20:31:43.858701+00	
2	Black Friday	Qara Cümə	Black Friday	discount on selected products	şeçilən məhsullara endirim	discount on selected products	50	f	5	\N	uploads/2022/11/20/black_S4axYmI.jpeg	2022-12-10 14:54:27.023513+00	uploads/2022/11/25/black6_jKRNoWy.png
5	New Year Sales	Yeni il endirimləri	New Year Sales	New Year sales	Yeni il endirimlərinə tələsin	New Year sales	55	t	5	\N	uploads/2022/12/10/new_year1.jpeg	2022-12-10 15:18:23.521738+00	uploads/2022/12/10/ny_label1_PqW9ahN.png
4	discount on accessories	aksesuarlara endirim	discount on accessories	Discount on selected accessories	Seçilmiş aksesuarlara endirim	Discount on selected accessories	10	t	5	\N	uploads/2022/12/10/sales.jpeg	2022-12-10 15:37:09.360487+00	
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.product_category (id, name, name_az, name_en) FROM stdin;
1	laptop	laptop	laptop
2	hybrid	hybrid	hybrid
4	desktop	masa üstü	desktop
3	headphone	qulaqlıq	headphone
\.


--
-- Data for Name: product_display; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.product_display (id, screen, resolution, color_settings, touch) FROM stdin;
\.


--
-- Data for Name: product_logo; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.product_logo (id, logo) FROM stdin;
1	brands/Apple_logo_black.svg_3HiJZBM_eYoYnCZ_9cwS9jc_Fk0omSD_pEuKJz8.png
2	brands/lenovo_SiBc0OH.png
3	brands/Dell_Logo.svg_LgrGCNU.png
4	brands/hyperx_dQWr15M.png
5	brands/asus_P6HephJ.jpeg
6	brands/microsoft_Jx16s6M.webp
7	brands/hp_CZ7UzcW_9MC6dar_5oaZw3r_ZJiAyHN.png
8	brands/beats-logo_IMW2GZg.png
\.


--
-- Data for Name: product_media; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.product_media (id, media, product_id) FROM stdin;
1	uploads/2022/11/19/1.jpg	1
2	uploads/2022/11/23/chrome-book-asus.jpg	16
3	uploads/2022/11/23/lenovo-thinkpad.webp	16
4	uploads/2022/11/23/asus-transformer.jpg	16
5	uploads/2022/11/23/macbook-air-midnight.webp	15
6	uploads/2022/11/23/imac-24-purple.jpeg	15
7	uploads/2022/11/23/chrome-book-14.jpg	15
8	uploads/2022/11/24/Apple-MacBook-Air-13_png.webp	10
9	uploads/2022/11/24/Apple-MacBook-Air-13-5-1_png.webp	10
12	uploads/2022/11/24/1.jpg	8
13	uploads/2022/11/24/2.jpg	8
14	uploads/2022/11/24/3.jpg	8
17	uploads/2022/11/25/asus-transformer.jpg	6
18	uploads/2022/11/25/chrome-book-14.jpg	6
19	uploads/2022/11/25/ipad-air.jpg	6
10	uploads/2022/11/25/airPods.jpeg	9
11	uploads/2022/11/25/apple_airpodsmax.webp	9
20	uploads/2022/11/25/Apple_AirPods_Max-6.jpg	9
16	uploads/2022/11/25/beat_solo3.jpeg	14
21	uploads/2022/11/25/solo3-pdp-p06.jpg.large.2x.jpg	14
15	uploads/2022/11/25/beat_solo3_g8XHRNO.jpeg	14
\.


--
-- Data for Name: product_product; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.product_product (id, title, description, price, slug, quantity, added_at, operating_system, processor, processor_tech, graphics, memory, hard_drive, power_supply, battery, brand_id, category_id, display_id, screen_size_id, wireless_id, main_image, description_az, description_en, title_az, title_en, campaign_id, discounted_price) FROM stdin;
14	Beats Solo3 Wireless	Beats Solo3 Wireless	199.95	beats-solo3-wireless	12	2022-11-20	macOS				\N		\N	\N	8	3	\N	\N	\N	uploads/2022/11/20/solo3-wireless.jpeg	Beats Solo3 Wireless	Beats Solo3 Wireless	Beats Solo3 Wireless	Beats Solo3 Wireless	4	179.95
13	HD 350BT	HD 350BT	88.95	hd-350bt	\N	2022-11-20	\N				\N		\N	\N	4	3	\N	\N	\N	uploads/2022/11/20/HD350bt.jpg	HD 350BT	HD 350BT	HD 350BT	HD 350BT	4	80.06
8	Microsoft Surface	Microsoft Surface Studio	4799.99	microsoft-surface-studio	10	2022-11-20	Windows				\N		\N	\N	6	4	\N	6	\N	uploads/2022/11/20/microsoft-surface-studio.jpg	Microsoft Surface Studio	Microsoft Surface Studio	Microsoft Surface	Microsoft Surface	\N	0
6	Asus transformer	Asus transformer	1599.99	asus-transformer	12	2022-11-20	freeDos				\N		\N	\N	5	2	\N	3	\N	uploads/2022/11/20/asus-transformer.jpg	Asus transformer	Asus transformer	Asus transformer	Asus transformer	\N	0
15	Apple Imac Purple	Apple Imac Purple	6599.99	apple-imac-purple	2	2022-11-20	macOS				\N		\N	\N	1	4	\N	8	\N	uploads/2022/11/20/imac-24-purple.jpeg	Apple Imac Purple	Apple Imac Purple	Apple Imac Purple	Apple Imac Purple	5	2970
10	Macbook Air M2	Macbook Air M2	3399.99	macbook-air-m2	\N	2022-11-20	macOS				\N		\N	\N	1	1	\N	7	\N	uploads/2022/11/20/macbook-air-midnight.webp	Macbook Air M2	Macbook Air M2	Macbook Air M2	Macbook Air M2	5	1530
1	Macbook pro M1 Pro	Macbook pro	4859.99	macbook-pro	12	2022-11-19	macOS				\N		\N	\N	1	1	\N	1	\N	uploads/2022/11/19/MacBook_Pro_16_3.jpg	Macbook pro	Macbook pro	Macbook pro M1 Pro	Macbook pro M1 Pro	5	2187
3	Lenovo ThinkPad	Yoga transforms from laptop to tent mode, to stand mode, to tablet mode and back again. With smooth, stable rotation, 360° hinge quickly adapts to how you work, play, and relax.	2599	lenovo-thinkpad	\N	2022-11-19	freeDos				\N		\N	\N	2	1	\N	3	\N	uploads/2022/11/19/lenovo-thinkpad.webp	Yoqa noutbukdan çadır rejiminə, dayanma rejiminə, planşet rejiminə və yenidən geri çevrilir. Hamar, sabit fırlanma ilə 360° menteşə işlədiyiniz, oynadığınız və istirahət etdiyinizə tez uyğunlaşır.	Yoga transforms from laptop to tent mode, to stand mode, to tablet mode and back again. With smooth, stable rotation, 360° hinge quickly adapts to how you work, play, and relax.	Lenovo ThinkPad	Lenovo ThinkPad	5	1169.55
5	Headset HyperX	Headset HyperX Cloud Alpha Wireless / 4P5D4AA	389.99	headset-hyperx	\N	2022-11-19	freeDos				\N		\N	\N	4	3	\N	\N	\N	uploads/2022/11/19/headset.webp	Qulaqlıq HyperX Cloud Alpha Wireless / 4P5D4AA	Headset HyperX Cloud Alpha Wireless / 4P5D4AA	Qulaqlıq HyperX	Headset HyperX	4	350.99
7	Apple Imac Retina 27	Apple Imac Retina 27	6599.99	apple-imac-retina-27	2	2022-11-20	macOS				\N		\N	\N	1	4	\N	5	\N	uploads/2022/11/20/apple-imac-27-retina.jpg	Apple Imac Retina 27	Apple Imac Retina 27	Apple Imac Retina 27	Apple Imac Retina 27	5	2970
16	HP All-In-One	HP All-In-One	3569.99	hp-all-in-one	12	2022-11-20	freeDos				\N		\N	\N	7	4	\N	9	\N	uploads/2022/11/20/Hp-desktop-22.webp	HP All-In-One	HP All-In-One	HP All-In-One	HP All-In-One	5	1606.5
9	Apple AirPods Max	Apple AirPods Max	1549.99	apple-airpods-max	15	2022-11-20	macOS				\N		\N	\N	1	3	\N	\N	\N	uploads/2022/11/20/airPods.jpeg	Apple AirPods Max	Apple AirPods Max	Apple AirPods Max	Apple AirPods Max	4	1394.99
11	HP Spectre	HP Spectre	2189.99	hp-spectre	\N	2022-11-20	Windows				\N		\N	\N	7	2	\N	3	\N	uploads/2022/11/20/hp-spectre-x360.jpg	HP Spectre	HP Spectre	HP Spectre	HP Spectre	\N	0
12	Lenova Ideacenter	Lenova Ideacenter	2599.99	lenova-ideacenter	20	2022-11-20	Windows				\N		\N	\N	2	2	\N	2	\N	uploads/2022/11/20/lenovo-ideacenter.jpg	Lenova Ideacenter	Lenova Ideacenter	Lenova Ideacenter	Lenova Ideacenter	\N	0
2	Lenovo Yoga	Yoga transforms from laptop to tent mode, to stand mode, to tablet mode and back again. With smooth, stable rotation, 360° hinge quickly adapts to how you work, play, and relax.	3989.99	lenovo-yoga	15	2022-11-19	Windows				\N		\N	\N	2	1	\N	2	\N	uploads/2022/11/19/lenovo-yoga.jpg	Yoqa noutbukdan çadır rejiminə, dayanma rejiminə, planşet rejiminə və yenidən geri çevrilir. Hamar, sabit fırlanma ilə 360° menteşə işlədiyiniz, oynadığınız və istirahət etdiyinizə tez uyğunlaşır.	Yoga transforms from laptop to tent mode, to stand mode, to tablet mode and back again. With smooth, stable rotation, 360° hinge quickly adapts to how you work, play, and relax.	Lenovo Yoga	Lenovo Yoga	\N	0
4	Dell Inspiron	Dell Inspiron	2599.99	dell-inspiron	\N	2022-11-19	Windows				\N		\N	\N	3	2	\N	2	\N	uploads/2022/11/19/dell-inspiron-2in1.jpg	Dell Inspiron	Dell Inspiron	Dell Inspiron	Dell Inspiron	\N	0
\.


--
-- Data for Name: product_product_tags; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.product_product_tags (id, product_id, tag_id) FROM stdin;
6	6	4
7	7	5
9	8	6
10	9	5
11	1	4
12	2	5
13	3	6
14	5	4
15	4	5
16	10	4
17	11	5
18	12	5
19	13	5
20	14	6
21	15	5
22	16	6
\.


--
-- Data for Name: product_productreview; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.product_productreview (id, comment, created_at, author_id, parent_id, product_id) FROM stdin;
1	Good product	2022-11-22 20:14:55.043955+00	1	\N	1
2	The best product	2022-11-22 20:15:13.932634+00	1	1	1
3	Wonderful	2022-11-22 20:15:52.565644+00	1	\N	15
4	Perfect	2022-11-22 20:16:00.42795+00	1	\N	15
5	Best	2022-11-22 20:16:28.282991+00	1	\N	12
6	Amazing	2022-11-22 20:16:34.060879+00	1	\N	12
7	Excellent	2022-11-22 20:16:49.496145+00	1	\N	12
8	best	2022-11-22 20:17:07.359596+00	1	\N	14
9	super	2022-11-22 20:17:13.976659+00	1	\N	14
10	successfull	2022-11-22 20:17:58.856991+00	1	\N	1
11	Good	2022-11-22 20:18:39.106662+00	1	\N	9
12	Fine	2022-11-22 20:18:46.769208+00	1	\N	9
13	perfect	2022-11-22 20:19:04.064072+00	1	\N	9
14	okay	2022-11-22 20:19:25.763047+00	1	\N	14
15	super	2022-11-22 20:19:44.965262+00	1	\N	1
16	bestseller	2022-11-22 20:20:00.582362+00	1	\N	1
17	amazing	2022-11-22 20:20:16.196624+00	1	\N	7
18	perfect	2022-11-22 20:20:21.753822+00	1	\N	7
19	successfull	2022-11-22 20:20:29.094591+00	1	18	7
20	excellent	2022-11-22 20:20:36.772932+00	1	18	7
21	good	2022-11-22 20:27:54.762125+00	1	8	14
22	good	2022-11-24 10:56:08.456986+00	1	\N	10
\.


--
-- Data for Name: product_screen; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.product_screen (id, size) FROM stdin;
1	14
2	15.6
3	13.3
4	12
5	27
6	28
7	13.6
8	24
9	22
\.


--
-- Data for Name: product_tag; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.product_tag (id, name, name_az, name_en) FROM stdin;
4	newest	ən yeni	newest
5	popular	məhşur	popular
6	bestseller	ən çox satılan	bestseller
\.


--
-- Data for Name: product_wireless; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.product_wireless (id, wifi, bluetooth) FROM stdin;
\.


--
-- Data for Name: users_cart; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.users_cart (id, total, created_at, modified_at, owner_id, is_complete) FROM stdin;
1	120	2022-11-25	2022-11-25	1	f
2	12	2022-12-07	2022-12-11	3	f
3	\N	2022-12-12	2022-12-12	4	f
\.


--
-- Data for Name: users_cartitem; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.users_cartitem (id, quantity, added_at, modified_at, cart_id, product_id) FROM stdin;
2	1	2022-11-25	2022-11-25	1	1
\.


--
-- Data for Name: users_order; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.users_order (id, status, phone, total, products_quantity, city, street, building, zip, payment, promo_code, complete, created_at, modified_at, user_id, receiver) FROM stdin;
30	on_processing	0(534) 920 59 96	10739.97	1	Baku	cdcdcd	12	21	2		f	2022-12-12 07:41:02.566181+00	2022-12-12 07:41:02.570842+00	3	Laman Kalbiyeva
31	on_processing	0(534) 920 59 96	7769.97	1	12	2	2	12	2		f	2022-12-12 07:41:59.459981+00	2022-12-12 07:41:59.462879+00	3	Laman Kalbiyeva
32	on_processing	0(534) 920 59 96	7769.99	1	Baku	cdcdcd	2	2	2		f	2022-12-12 07:43:07.633527+00	2022-12-12 07:43:07.639154+00	3	Laman Kalbiyeva
33	on_processing	0(534) 920 59 96	7769.99	1	Baku	cdcdcd	2	2	2		f	2022-12-12 07:43:17.412269+00	2022-12-12 07:43:17.415287+00	3	Laman Kalbiyeva
34	on_processing	0(534) 920 59 96	9369.98	1	Baku	cdcdcd	12	12	2		f	2022-12-12 07:47:28.38632+00	2022-12-12 07:47:28.389052+00	3	Laman Kalbiyeva
35	on_processing	0(534) 920 59 96	9369.98	1	Baku	cdcdcd	12	12	2		f	2022-12-12 07:51:02.195893+00	2022-12-12 07:51:02.19833+00	3	Laman Kalbiyeva
36	on_processing	0(534) 920 59 96	24909.96	1	Baku	cdcdcd	21	1	2		f	2022-12-12 07:51:30.676283+00	2022-12-12 07:51:30.678858+00	3	Laman Kalbiyeva
37	on_processing	0(534) 920 59 96	18279.98	1	ds	sdds	21	2	2		f	2022-12-12 07:52:30.633648+00	2022-12-12 07:52:30.636966+00	3	Laman Kalbiyeva
38	on_processing	0(534) 920 59 96	8979.97	1	fedds	scfs	12	21	2		f	2022-12-12 07:53:50.254884+00	2022-12-12 07:53:50.25813+00	3	Laman Kalbiyeva
39	on_processing	0(534) 920 59 96	18209.97	1	Baku	Ahmet	166	494	2		f	2022-12-12 09:49:53.859796+00	2022-12-12 09:49:53.8653+00	4	Laman Kalbiyeva
\.


--
-- Data for Name: users_orderitem; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.users_orderitem (id, created_at, modified_at, order_id, product_id, quantity) FROM stdin;
44	2022-12-12	2022-12-12	30	6	3
45	2022-12-12	2022-12-12	30	7	2
46	2022-12-12	2022-12-12	31	7	1
47	2022-12-12	2022-12-12	31	6	3
48	2022-12-12	2022-12-12	32	8	1
49	2022-12-12	2022-12-12	32	7	1
50	2022-12-12	2022-12-12	34	6	1
51	2022-12-12	2022-12-12	34	7	1
52	2022-12-12	2022-12-12	34	8	1
53	2022-12-12	2022-12-12	36	6	1
54	2022-12-12	2022-12-12	36	8	3
55	2022-12-12	2022-12-12	36	7	3
56	2022-12-12	2022-12-12	37	6	1
57	2022-12-12	2022-12-12	37	8	1
58	2022-12-12	2022-12-12	37	7	4
59	2022-12-12	2022-12-12	38	6	1
60	2022-12-12	2022-12-12	38	10	3
61	2022-12-12	2022-12-12	38	9	2
62	2022-12-12	2022-12-12	39	10	1
63	2022-12-12	2022-12-12	39	6	3
64	2022-12-12	2022-12-12	39	7	4
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email) FROM stdin;
3	pbkdf2_sha256$320000$Ajqtm5Y192tEcwYZtpXnHK$y2RQ3k77YFxhO9jW9ytKbT59gWDm0QTBbpVJ6kMmco0=	2022-12-10 15:43:46.112796+00	f	lamank	Laman	Kalbiyeva	f	t	2022-12-07 06:18:07.071616+00	lamankalbiyeva@gmail.com
1	pbkdf2_sha256$320000$ChHzRvpWzkhb29ViWCNBTc$vOR+apDi0TKRrox0U9kAdyCcqB8kPncJqw58qPTPxYo=	2022-12-12 09:33:41.236066+00	t	admin			t	t	2022-11-19 12:33:04.147946+00	admin@gmail.com
4	pbkdf2_sha256$320000$rsZGHKb7OouLN5TmFDbbtH$dELiKW1gX3kw32VTNXjHKItHY8jnrPLLwOuF/rrIBMo=	2022-12-12 09:46:54.843707+00	f	lamankk	Laman	Kalbiyeva	f	t	2022-12-12 09:46:28.610759+00	admn.unistore@gmail.com
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: users_wishlist; Type: TABLE DATA; Schema: public; Owner: unistore
--

COPY public.users_wishlist (id, product_id, user_id) FROM stdin;
1	4	3
7	8	3
9	1	3
10	14	3
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 136, true);


--
-- Name: blog_blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.blog_blog_id_seq', 2, true);


--
-- Name: blog_blog_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.blog_blog_tags_id_seq', 2, true);


--
-- Name: blog_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.blog_comment_id_seq', 3, true);


--
-- Name: blog_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.blog_media_id_seq', 4, true);


--
-- Name: blog_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.blog_tag_id_seq', 2, true);


--
-- Name: core_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.core_contact_id_seq', 15, true);


--
-- Name: core_subscriber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.core_subscriber_id_seq', 6, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 236, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, false);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 34, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 85, true);


--
-- Name: product_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.product_brand_id_seq', 8, true);


--
-- Name: product_campaign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.product_campaign_id_seq', 5, true);


--
-- Name: product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.product_category_id_seq', 4, true);


--
-- Name: product_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.product_display_id_seq', 1, false);


--
-- Name: product_logo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.product_logo_id_seq', 8, true);


--
-- Name: product_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.product_media_id_seq', 21, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.product_product_id_seq', 16, true);


--
-- Name: product_product_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.product_product_tags_id_seq', 22, true);


--
-- Name: product_productreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.product_productreview_id_seq', 22, true);


--
-- Name: product_screen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.product_screen_id_seq', 9, true);


--
-- Name: product_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.product_tag_id_seq', 6, true);


--
-- Name: product_wireless_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.product_wireless_id_seq', 1, false);


--
-- Name: users_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.users_cart_id_seq', 3, true);


--
-- Name: users_cartitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.users_cartitem_id_seq', 110, true);


--
-- Name: users_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.users_order_id_seq', 39, true);


--
-- Name: users_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.users_orderitem_id_seq', 64, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: users_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unistore
--

SELECT pg_catalog.setval('public.users_wishlist_id_seq', 10, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: blog_blog blog_blog_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_blog
    ADD CONSTRAINT blog_blog_pkey PRIMARY KEY (id);


--
-- Name: blog_blog_tags blog_blog_tags_blog_id_tag_id_211c6be5_uniq; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_blog_tags
    ADD CONSTRAINT blog_blog_tags_blog_id_tag_id_211c6be5_uniq UNIQUE (blog_id, tag_id);


--
-- Name: blog_blog_tags blog_blog_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_blog_tags
    ADD CONSTRAINT blog_blog_tags_pkey PRIMARY KEY (id);


--
-- Name: blog_comment blog_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_pkey PRIMARY KEY (id);


--
-- Name: blog_media blog_media_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_media
    ADD CONSTRAINT blog_media_pkey PRIMARY KEY (id);


--
-- Name: blog_tag blog_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_tag
    ADD CONSTRAINT blog_tag_pkey PRIMARY KEY (id);


--
-- Name: core_contact core_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.core_contact
    ADD CONSTRAINT core_contact_pkey PRIMARY KEY (id);


--
-- Name: core_subscriber core_subscriber_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.core_subscriber
    ADD CONSTRAINT core_subscriber_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: product_brand product_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_brand
    ADD CONSTRAINT product_brand_pkey PRIMARY KEY (id);


--
-- Name: product_campaign product_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_campaign
    ADD CONSTRAINT product_campaign_pkey PRIMARY KEY (id);


--
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- Name: product_display product_display_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_display
    ADD CONSTRAINT product_display_pkey PRIMARY KEY (id);


--
-- Name: product_logo product_logo_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_logo
    ADD CONSTRAINT product_logo_pkey PRIMARY KEY (id);


--
-- Name: product_media product_media_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_media
    ADD CONSTRAINT product_media_pkey PRIMARY KEY (id);


--
-- Name: product_product product_product_display_id_key; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_display_id_key UNIQUE (display_id);


--
-- Name: product_product product_product_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_pkey PRIMARY KEY (id);


--
-- Name: product_product_tags product_product_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product_tags
    ADD CONSTRAINT product_product_tags_pkey PRIMARY KEY (id);


--
-- Name: product_product_tags product_product_tags_product_id_tag_id_f9d19e54_uniq; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product_tags
    ADD CONSTRAINT product_product_tags_product_id_tag_id_f9d19e54_uniq UNIQUE (product_id, tag_id);


--
-- Name: product_product product_product_wireless_id_key; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_wireless_id_key UNIQUE (wireless_id);


--
-- Name: product_productreview product_productreview_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_productreview
    ADD CONSTRAINT product_productreview_pkey PRIMARY KEY (id);


--
-- Name: product_screen product_screen_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_screen
    ADD CONSTRAINT product_screen_pkey PRIMARY KEY (id);


--
-- Name: product_tag product_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT product_tag_pkey PRIMARY KEY (id);


--
-- Name: product_wireless product_wireless_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_wireless
    ADD CONSTRAINT product_wireless_pkey PRIMARY KEY (id);


--
-- Name: users_cart users_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_cart
    ADD CONSTRAINT users_cart_pkey PRIMARY KEY (id);


--
-- Name: users_cartitem users_cartitem_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_cartitem
    ADD CONSTRAINT users_cartitem_pkey PRIMARY KEY (id);


--
-- Name: users_order users_order_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_order
    ADD CONSTRAINT users_order_pkey PRIMARY KEY (id);


--
-- Name: users_orderitem users_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_orderitem
    ADD CONSTRAINT users_orderitem_pkey PRIMARY KEY (id);


--
-- Name: users_user users_user_email_243f6e77_uniq; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_243f6e77_uniq UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: users_wishlist users_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_wishlist
    ADD CONSTRAINT users_wishlist_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: blog_blog_slug_4812aa2c; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX blog_blog_slug_4812aa2c ON public.blog_blog USING btree (slug);


--
-- Name: blog_blog_slug_4812aa2c_like; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX blog_blog_slug_4812aa2c_like ON public.blog_blog USING btree (slug varchar_pattern_ops);


--
-- Name: blog_blog_tags_blog_id_e4cd5f6a; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX blog_blog_tags_blog_id_e4cd5f6a ON public.blog_blog_tags USING btree (blog_id);


--
-- Name: blog_blog_tags_tag_id_36a3abc6; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX blog_blog_tags_tag_id_36a3abc6 ON public.blog_blog_tags USING btree (tag_id);


--
-- Name: blog_comment_author_id_4f11e2e0; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX blog_comment_author_id_4f11e2e0 ON public.blog_comment USING btree (author_id);


--
-- Name: blog_comment_blog_id_c664fb0d; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX blog_comment_blog_id_c664fb0d ON public.blog_comment USING btree (blog_id);


--
-- Name: blog_comment_parent_id_f2a027bb; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX blog_comment_parent_id_f2a027bb ON public.blog_comment USING btree (parent_id);


--
-- Name: blog_media_blog_id_c16a112f; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX blog_media_blog_id_c16a112f ON public.blog_media USING btree (blog_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: product_brand_logo_id_429cc831; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_brand_logo_id_429cc831 ON public.product_brand USING btree (logo_id);


--
-- Name: product_media_product_id_da264f78; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_media_product_id_da264f78 ON public.product_media USING btree (product_id);


--
-- Name: product_product_brand_id_fcf1b3f3; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_product_brand_id_fcf1b3f3 ON public.product_product USING btree (brand_id);


--
-- Name: product_product_campaign_id_0cb5cffd; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_product_campaign_id_0cb5cffd ON public.product_product USING btree (campaign_id);


--
-- Name: product_product_category_id_0c725779; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_product_category_id_0c725779 ON public.product_product USING btree (category_id);


--
-- Name: product_product_screen_size_id_da134d38; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_product_screen_size_id_da134d38 ON public.product_product USING btree (screen_size_id);


--
-- Name: product_product_slug_76cde0ae; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_product_slug_76cde0ae ON public.product_product USING btree (slug);


--
-- Name: product_product_slug_76cde0ae_like; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_product_slug_76cde0ae_like ON public.product_product USING btree (slug varchar_pattern_ops);


--
-- Name: product_product_tags_product_id_a72c644e; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_product_tags_product_id_a72c644e ON public.product_product_tags USING btree (product_id);


--
-- Name: product_product_tags_tag_id_2e44bb40; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_product_tags_tag_id_2e44bb40 ON public.product_product_tags USING btree (tag_id);


--
-- Name: product_productreview_author_id_dd15ec7d; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_productreview_author_id_dd15ec7d ON public.product_productreview USING btree (author_id);


--
-- Name: product_productreview_parent_id_b3943c9b; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_productreview_parent_id_b3943c9b ON public.product_productreview USING btree (parent_id);


--
-- Name: product_productreview_product_id_f3a2ae11; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX product_productreview_product_id_f3a2ae11 ON public.product_productreview USING btree (product_id);


--
-- Name: users_cart_owner_id_1c44bb52; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_cart_owner_id_1c44bb52 ON public.users_cart USING btree (owner_id);


--
-- Name: users_cartitem_cart_id_45de6e61; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_cartitem_cart_id_45de6e61 ON public.users_cartitem USING btree (cart_id);


--
-- Name: users_cartitem_product_id_4edf6161; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_cartitem_product_id_4edf6161 ON public.users_cartitem USING btree (product_id);


--
-- Name: users_order_user_id_f6abf9f8; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_order_user_id_f6abf9f8 ON public.users_order USING btree (user_id);


--
-- Name: users_orderitem_order_id_c9e59aa1; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_orderitem_order_id_c9e59aa1 ON public.users_orderitem USING btree (order_id);


--
-- Name: users_orderitem_product_id_e135a350; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_orderitem_product_id_e135a350 ON public.users_orderitem USING btree (product_id);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: users_wishlist_product_id_dcf62154; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_wishlist_product_id_dcf62154 ON public.users_wishlist USING btree (product_id);


--
-- Name: users_wishlist_user_id_6507553e; Type: INDEX; Schema: public; Owner: unistore
--

CREATE INDEX users_wishlist_user_id_6507553e ON public.users_wishlist USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blog_tags blog_blog_tags_blog_id_e4cd5f6a_fk_blog_blog_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_blog_tags
    ADD CONSTRAINT blog_blog_tags_blog_id_e4cd5f6a_fk_blog_blog_id FOREIGN KEY (blog_id) REFERENCES public.blog_blog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blog_tags blog_blog_tags_tag_id_36a3abc6_fk_blog_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_blog_tags
    ADD CONSTRAINT blog_blog_tags_tag_id_36a3abc6_fk_blog_tag_id FOREIGN KEY (tag_id) REFERENCES public.blog_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_comment blog_comment_author_id_4f11e2e0_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_author_id_4f11e2e0_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_comment blog_comment_blog_id_c664fb0d_fk_blog_blog_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_blog_id_c664fb0d_fk_blog_blog_id FOREIGN KEY (blog_id) REFERENCES public.blog_blog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_comment blog_comment_parent_id_f2a027bb_fk_blog_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_parent_id_f2a027bb_fk_blog_comment_id FOREIGN KEY (parent_id) REFERENCES public.blog_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_media blog_media_blog_id_c16a112f_fk_blog_blog_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.blog_media
    ADD CONSTRAINT blog_media_blog_id_c16a112f_fk_blog_blog_id FOREIGN KEY (blog_id) REFERENCES public.blog_blog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_brand product_brand_logo_id_429cc831_fk_product_logo_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_brand
    ADD CONSTRAINT product_brand_logo_id_429cc831_fk_product_logo_id FOREIGN KEY (logo_id) REFERENCES public.product_logo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_media product_media_product_id_da264f78_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_media
    ADD CONSTRAINT product_media_product_id_da264f78_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_brand_id_fcf1b3f3_fk_product_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_brand_id_fcf1b3f3_fk_product_brand_id FOREIGN KEY (brand_id) REFERENCES public.product_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_campaign_id_0cb5cffd_fk_product_campaign_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_campaign_id_0cb5cffd_fk_product_campaign_id FOREIGN KEY (campaign_id) REFERENCES public.product_campaign(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_category_id_0c725779_fk_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_category_id_0c725779_fk_product_category_id FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_display_id_364e6a98_fk_product_display_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_display_id_364e6a98_fk_product_display_id FOREIGN KEY (display_id) REFERENCES public.product_display(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_screen_size_id_da134d38_fk_product_screen_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_screen_size_id_da134d38_fk_product_screen_id FOREIGN KEY (screen_size_id) REFERENCES public.product_screen(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product_tags product_product_tags_product_id_a72c644e_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product_tags
    ADD CONSTRAINT product_product_tags_product_id_a72c644e_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product_tags product_product_tags_tag_id_2e44bb40_fk_product_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product_tags
    ADD CONSTRAINT product_product_tags_tag_id_2e44bb40_fk_product_tag_id FOREIGN KEY (tag_id) REFERENCES public.product_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_wireless_id_b630ddaf_fk_product_wireless_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_wireless_id_b630ddaf_fk_product_wireless_id FOREIGN KEY (wireless_id) REFERENCES public.product_wireless(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_productreview product_productrevie_parent_id_b3943c9b_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_productreview
    ADD CONSTRAINT product_productrevie_parent_id_b3943c9b_fk_product_p FOREIGN KEY (parent_id) REFERENCES public.product_productreview(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_productreview product_productreview_author_id_dd15ec7d_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_productreview
    ADD CONSTRAINT product_productreview_author_id_dd15ec7d_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_productreview product_productreview_product_id_f3a2ae11_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.product_productreview
    ADD CONSTRAINT product_productreview_product_id_f3a2ae11_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_cart users_cart_owner_id_1c44bb52_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_cart
    ADD CONSTRAINT users_cart_owner_id_1c44bb52_fk_users_user_id FOREIGN KEY (owner_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_cartitem users_cartitem_cart_id_45de6e61_fk_users_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_cartitem
    ADD CONSTRAINT users_cartitem_cart_id_45de6e61_fk_users_cart_id FOREIGN KEY (cart_id) REFERENCES public.users_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_cartitem users_cartitem_product_id_4edf6161_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_cartitem
    ADD CONSTRAINT users_cartitem_product_id_4edf6161_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_order users_order_user_id_f6abf9f8_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_order
    ADD CONSTRAINT users_order_user_id_f6abf9f8_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_orderitem users_orderitem_order_id_c9e59aa1_fk_users_order_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_orderitem
    ADD CONSTRAINT users_orderitem_order_id_c9e59aa1_fk_users_order_id FOREIGN KEY (order_id) REFERENCES public.users_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_orderitem users_orderitem_product_id_e135a350_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_orderitem
    ADD CONSTRAINT users_orderitem_product_id_e135a350_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_wishlist users_wishlist_product_id_dcf62154_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_wishlist
    ADD CONSTRAINT users_wishlist_product_id_dcf62154_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_wishlist users_wishlist_user_id_6507553e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: unistore
--

ALTER TABLE ONLY public.users_wishlist
    ADD CONSTRAINT users_wishlist_user_id_6507553e_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

