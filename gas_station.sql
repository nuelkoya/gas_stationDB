PGDMP     :                	    {           Gas Station DB    15.4    15.3 7    U           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            V           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            W           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            X           1262    17095    Gas Station DB    DATABASE     �   CREATE DATABASE "Gas Station DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';
     DROP DATABASE "Gas Station DB";
                postgres    false            �            1255    17240    fn_sum_total()    FUNCTION     �   CREATE FUNCTION public.fn_sum_total() RETURNS money
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN SUM(sale.total)
	FROM sale;
END
$$;
 %   DROP FUNCTION public.fn_sum_total();
       public          postgres    false            �            1259    17116 	   air_water    TABLE     `   CREATE TABLE public.air_water (
    id integer NOT NULL,
    gas_station_id integer NOT NULL
);
    DROP TABLE public.air_water;
       public         heap    postgres    false            �            1259    17115    air_water_id_seq    SEQUENCE     �   CREATE SEQUENCE public.air_water_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.air_water_id_seq;
       public          postgres    false    219            Y           0    0    air_water_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.air_water_id_seq OWNED BY public.air_water.id;
          public          postgres    false    218            �            1259    17128    car_wash    TABLE     _   CREATE TABLE public.car_wash (
    id integer NOT NULL,
    gas_station_id integer NOT NULL
);
    DROP TABLE public.car_wash;
       public         heap    postgres    false            �            1259    17127    car_wash_id_seq    SEQUENCE     �   CREATE SEQUENCE public.car_wash_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.car_wash_id_seq;
       public          postgres    false    221            Z           0    0    car_wash_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.car_wash_id_seq OWNED BY public.car_wash.id;
          public          postgres    false    220            �            1259    17097    gas_station    TABLE     #  CREATE TABLE public.gas_station (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    street_number integer NOT NULL,
    street_name character varying(20) NOT NULL,
    city character varying(20) NOT NULL,
    state character(2) NOT NULL,
    zip_code integer NOT NULL
);
    DROP TABLE public.gas_station;
       public         heap    postgres    false            �            1259    17096    gas_station_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gas_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.gas_station_id_seq;
       public          postgres    false    215            [           0    0    gas_station_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.gas_station_id_seq OWNED BY public.gas_station.id;
          public          postgres    false    214            �            1259    17140    product    TABLE       CREATE TABLE public.product (
    id integer NOT NULL,
    gas_station_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(15) NOT NULL,
    description character varying(70) NOT NULL,
    price_cash money,
    price_card money
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    17139    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    223            \           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    222            �            1259    17104    pump_gas    TABLE     _   CREATE TABLE public.pump_gas (
    id integer NOT NULL,
    gas_station_id integer NOT NULL
);
    DROP TABLE public.pump_gas;
       public         heap    postgres    false            �            1259    17103    pump_gas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pump_gas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.pump_gas_id_seq;
       public          postgres    false    217            ]           0    0    pump_gas_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.pump_gas_id_seq OWNED BY public.pump_gas.id;
          public          postgres    false    216            �            1259    17188    sale    TABLE       CREATE TABLE public.sale (
    id integer NOT NULL,
    product_id integer,
    product_name character varying(20) NOT NULL,
    pump_gas_id integer,
    air_water_id integer,
    car_wash_id integer,
    date date NOT NULL,
    total money NOT NULL,
    payment_method character(4)
);
    DROP TABLE public.sale;
       public         heap    postgres    false            �            1259    17187    sale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.sale_id_seq;
       public          postgres    false    225            ^           0    0    sale_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.sale_id_seq OWNED BY public.sale.id;
          public          postgres    false    224            �           2604    17119    air_water id    DEFAULT     l   ALTER TABLE ONLY public.air_water ALTER COLUMN id SET DEFAULT nextval('public.air_water_id_seq'::regclass);
 ;   ALTER TABLE public.air_water ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    17131    car_wash id    DEFAULT     j   ALTER TABLE ONLY public.car_wash ALTER COLUMN id SET DEFAULT nextval('public.car_wash_id_seq'::regclass);
 :   ALTER TABLE public.car_wash ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    17100    gas_station id    DEFAULT     p   ALTER TABLE ONLY public.gas_station ALTER COLUMN id SET DEFAULT nextval('public.gas_station_id_seq'::regclass);
 =   ALTER TABLE public.gas_station ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    17143 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    17107    pump_gas id    DEFAULT     j   ALTER TABLE ONLY public.pump_gas ALTER COLUMN id SET DEFAULT nextval('public.pump_gas_id_seq'::regclass);
 :   ALTER TABLE public.pump_gas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    17191    sale id    DEFAULT     b   ALTER TABLE ONLY public.sale ALTER COLUMN id SET DEFAULT nextval('public.sale_id_seq'::regclass);
 6   ALTER TABLE public.sale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            L          0    17116 	   air_water 
   TABLE DATA           7   COPY public.air_water (id, gas_station_id) FROM stdin;
    public          postgres    false    219   �>       N          0    17128    car_wash 
   TABLE DATA           6   COPY public.car_wash (id, gas_station_id) FROM stdin;
    public          postgres    false    221   �>       H          0    17097    gas_station 
   TABLE DATA           b   COPY public.gas_station (id, name, street_number, street_name, city, state, zip_code) FROM stdin;
    public          postgres    false    215   �>       P          0    17140    product 
   TABLE DATA           f   COPY public.product (id, gas_station_id, name, type, description, price_cash, price_card) FROM stdin;
    public          postgres    false    223   ?       J          0    17104    pump_gas 
   TABLE DATA           6   COPY public.pump_gas (id, gas_station_id) FROM stdin;
    public          postgres    false    217   *@       R          0    17188    sale 
   TABLE DATA           �   COPY public.sale (id, product_id, product_name, pump_gas_id, air_water_id, car_wash_id, date, total, payment_method) FROM stdin;
    public          postgres    false    225   b@       _           0    0    air_water_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.air_water_id_seq', 1, false);
          public          postgres    false    218            `           0    0    car_wash_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.car_wash_id_seq', 1, false);
          public          postgres    false    220            a           0    0    gas_station_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.gas_station_id_seq', 1, false);
          public          postgres    false    214            b           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 1, false);
          public          postgres    false    222            c           0    0    pump_gas_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.pump_gas_id_seq', 1, false);
          public          postgres    false    216            d           0    0    sale_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sale_id_seq', 1, false);
          public          postgres    false    224            �           2606    17121    air_water air_water_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.air_water
    ADD CONSTRAINT air_water_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.air_water DROP CONSTRAINT air_water_pkey;
       public            postgres    false    219            �           2606    17133    car_wash car_wash_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.car_wash
    ADD CONSTRAINT car_wash_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.car_wash DROP CONSTRAINT car_wash_pkey;
       public            postgres    false    221            �           2606    17102    gas_station gas_station_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.gas_station
    ADD CONSTRAINT gas_station_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.gas_station DROP CONSTRAINT gas_station_pkey;
       public            postgres    false    215            �           2606    17145    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    223            �           2606    17109    pump_gas pump_gas_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.pump_gas
    ADD CONSTRAINT pump_gas_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.pump_gas DROP CONSTRAINT pump_gas_pkey;
       public            postgres    false    217            �           2606    17193    sale sale_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.sale DROP CONSTRAINT sale_pkey;
       public            postgres    false    225            �           2606    17122 '   air_water air_water_gas_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.air_water
    ADD CONSTRAINT air_water_gas_station_id_fkey FOREIGN KEY (gas_station_id) REFERENCES public.gas_station(id);
 Q   ALTER TABLE ONLY public.air_water DROP CONSTRAINT air_water_gas_station_id_fkey;
       public          postgres    false    215    3494    219            �           2606    17134 %   car_wash car_wash_gas_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car_wash
    ADD CONSTRAINT car_wash_gas_station_id_fkey FOREIGN KEY (gas_station_id) REFERENCES public.gas_station(id);
 O   ALTER TABLE ONLY public.car_wash DROP CONSTRAINT car_wash_gas_station_id_fkey;
       public          postgres    false    3494    215    221            �           2606    17146 #   product product_gas_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_gas_station_id_fkey FOREIGN KEY (gas_station_id) REFERENCES public.gas_station(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT product_gas_station_id_fkey;
       public          postgres    false    3494    215    223            �           2606    17110 %   pump_gas pump_gas_gas_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pump_gas
    ADD CONSTRAINT pump_gas_gas_station_id_fkey FOREIGN KEY (gas_station_id) REFERENCES public.gas_station(id);
 O   ALTER TABLE ONLY public.pump_gas DROP CONSTRAINT pump_gas_gas_station_id_fkey;
       public          postgres    false    217    3494    215            �           2606    17209    sale sale_air_water_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_air_water_id_fkey FOREIGN KEY (air_water_id) REFERENCES public.air_water(id);
 E   ALTER TABLE ONLY public.sale DROP CONSTRAINT sale_air_water_id_fkey;
       public          postgres    false    225    219    3498            �           2606    17214    sale sale_car_wash_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_car_wash_id_fkey FOREIGN KEY (car_wash_id) REFERENCES public.car_wash(id);
 D   ALTER TABLE ONLY public.sale DROP CONSTRAINT sale_car_wash_id_fkey;
       public          postgres    false    221    225    3500            �           2606    17194    sale sale_product_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);
 C   ALTER TABLE ONLY public.sale DROP CONSTRAINT sale_product_id_fkey;
       public          postgres    false    223    3502    225            �           2606    17204    sale sale_pump_gas_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pump_gas_id_fkey FOREIGN KEY (pump_gas_id) REFERENCES public.pump_gas(id);
 D   ALTER TABLE ONLY public.sale DROP CONSTRAINT sale_pump_gas_id_fkey;
       public          postgres    false    3496    225    217            L      x�3�4�2�=... ��      N      x�3�4����� ]      H   .   x�3��H���42�40��N,�Tp+�38C"8��M,M�b���� ��
V      P     x���MO�0@�ɯ�N�*�֭="\��ƴ]��ⵑ�vrR��{�n�8[r���"�5+�z�,*��o�#�[x)�+t�� _�h�JD�D)9��K�[x@�3].�B�grz�7���@��qw�����h�燘*9�;M��7�\��a�B����h�-:b��ϭ���ܑɆ��$ɔ�{b�-��	]C�%2��b�z�a��U�i$�T�����#��0�G�D�Gcl\v�/�����VC�y8\����z������O7�|K��_���      J   (   x�3�4�2bc 6bS 6bs � bK 64 1z\\\ �@�      R     x���Mo�0���_�n�������!@�K��P�m���L��d�q⬴���'�x>m�A���?�������3���a�)������������A7 3�� ��6@
)	x~8`�������ǧ?����������݉�ǝ�=�A�C�Hu�{��?�'~kZX��!u�l��R��TOR�I���W�!5�$iy�8�>l�&b$>�^�Y�RB���r��A>��� �@ㄎ�(��*�Xf��AC$�e	*��y�"��5;X03G�˃��Td��m�A	�,�v��ǻ���<�؋@��#�q>����/�q��.�j��D�&�R�!�2�9�r������r=�� ��r�Hr�-׳#��5��1դfL��ͬTW�!IպT�W�٦t5n��Y"�#��G�ɍ��A.���X�-Wf�W�1�N�[ö��@�*#����nr�"lH�P�Ǩ֥��X���3�8��Y���e:s���p3'�AA&�ۖ��dA��,hD��V�̂�{��&6.:�Μ�I�H�8�Z�.�V��T�K�dM���츯�1�)�Ki��^�r���xDCiᄊ��.j<'�����A��F���G+`*��:����T{@3�є�;@�B��[P��V]�?�Lx�𹨸2 8���tr��g !�H�9�Vs�i��x�!,H��h��FR]��R;���+5cLR�.5S��c��v����}1��}y����}M�2�gqy�
\:�XQ���,��B�>�~l�C*\f{џ4,&;��zz9	�����=��a��VKR�H'W-	������"g�^ewΦ'�І���%+W���<���S�ː�.3�8���H� Ю�J�W#�G�����o�6�ⒷY���!~0=�U[�RgM^�x�c���*\<���@�:�C�>��%Фn��������߿���D����v`�`p�o��u��x��n���c�f`���x+�������i-����J�8� aE��     