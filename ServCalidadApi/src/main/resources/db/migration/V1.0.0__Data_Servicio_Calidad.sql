CREATE TABLE aut_user (
                id BIGINT AUTO_INCREMENT NOT NULL,
                username VARCHAR(25) NOT NULL,
                password VARCHAR(75) NOT NULL,
                organizacion VARCHAR(100) NOT NULL,
                estado VARCHAR(7) NOT NULL,
                fecha_alta DATE NOT NULL,
                fecha_baja DATE NOT NULL,
                PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO aut_user (id, username, password, organizacion, estado, fecha_alta, fecha_baja) VALUES (1, 'hendi', '$2a$04$I9Q2sDc4QGGg5WNTLmsz0.fvGv3OjoZyj81PrSFyGOqMphqfS2qKu', 'UPeU', '1', '2019-09-09', '2019-12-30');
INSERT INTO aut_user (id, username, password, organizacion, estado, fecha_alta, fecha_baja) VALUES (2, 'sasuke', '$2a$04$PCIX2hYrve38M7eOcqAbCO9UqjYg7gfFNpKsinAxh99nms9e.8HwK', 'UPeU', '1', '2019-09-09', '2019-12-30');
INSERT INTO aut_user (id, username, password, organizacion, estado, fecha_alta, fecha_baja) VALUES (3, 'naruto', '$2a$04$I9Q2sDc4QGGg5WNTLmsz0.fvGv3OjoZyj81PrSFyGOqMphqfS2qKu', 'UPeU', '1', '2019-09-09', '2019-12-30');
INSERT INTO aut_user (id, username, password, organizacion, estado, fecha_alta, fecha_baja) VALUES (4, 'sakura', '$2a$04$I9Q2sDc4QGGg5WNTLmsz0.fvGv3OjoZyj81PrSFyGOqMphqfS2qKu', 'UPeU', '1', '2019-09-09', '2019-12-30');

-- hendi / password
-- sasuke / password
-- naruto / password
-- sakura / password

CREATE TABLE serv_categoria_cliente (
                id_categoria_cliente INT AUTO_INCREMENT NOT NULL,
                nombre_c VARCHAR(40) NOT NULL,
                estado_c VARCHAR(2) NOT NULL,
                descripcion_c VARCHAR(60) NOT NULL,
                PRIMARY KEY (id_categoria_cliente)
);


CREATE TABLE serv_tipoalternativa (
                id_tipo_alternativa INT AUTO_INCREMENT NOT NULL,
                nombre_ta VARCHAR(40) NOT NULL,
                estado_ta VARCHAR(2) NOT NULL,
                descripcion_ta VARCHAR(60) NOT NULL,
                PRIMARY KEY (id_tipo_alternativa)
);


CREATE TABLE serv_alternativas (
                id_alternativas INT AUTO_INCREMENT NOT NULL,
                id_tipo_alternativa INT NOT NULL,
                nombre_al VARCHAR(40) NOT NULL,
                valor_al INT NOT NULL,
                PRIMARY KEY (id_alternativas)
);


CREATE TABLE serv_preguntas (
                id_preguntas INT AUTO_INCREMENT NOT NULL,
                id_tipo_alternativa INT NOT NULL,
                nombre_pre VARCHAR(60) NOT NULL,
                estado_pre VARCHAR(2) NOT NULL,
                categoria_pre VARCHAR(20) NOT NULL,
                PRIMARY KEY (id_preguntas)
);


CREATE TABLE serv_persona (
                id_persona INT AUTO_INCREMENT NOT NULL,
                dni_codigo VARCHAR(10) NOT NULL,
                nombres VARCHAR(80) NOT NULL,
                apellido_pat VARCHAR(60) NOT NULL,
                apellido_mat VARCHAR(60) NOT NULL,
                fecha_nacimiento DATE NOT NULL,
                celular VARCHAR(12) NOT NULL,
                usuario VARCHAR(20) NOT NULL,
                clave VARCHAR(75) NOT NULL,
                PRIMARY KEY (id_persona)
);


CREATE TABLE serv_periodo (
                id_periodo INT NOT NULL,
                periodo VARCHAR(7) NOT NULL,
                estado_pe VARCHAR(2) NOT NULL,
                PRIMARY KEY (id_periodo)
);


CREATE TABLE serv_nivel (
                id_nivel INT AUTO_INCREMENT NOT NULL,
                nombre_n VARCHAR(40) NOT NULL,
                estado_n VARCHAR(2) NOT NULL,
                descripcion_n VARCHAR(60) NOT NULL,
                PRIMARY KEY (id_nivel)
);


CREATE TABLE serv_area (
                id_area INT AUTO_INCREMENT NOT NULL,
                nombre_a VARCHAR(40) NOT NULL,
                estado_a VARCHAR(2) NOT NULL,
                descripcion_a VARCHAR(60) NOT NULL,
                PRIMARY KEY (id_area)
);


CREATE TABLE serv_subarea (
                id_subarea INT AUTO_INCREMENT NOT NULL,
                id_area INT NOT NULL,
                nombre_sa VARCHAR(40) NOT NULL,
                estado_sa VARCHAR(2) NOT NULL,
                descripcion_sa VARCHAR(60) NOT NULL,
                PRIMARY KEY (id_subarea)
);


CREATE TABLE serv_puesto (
                id_puesto INT AUTO_INCREMENT NOT NULL,
                id_subarea INT NOT NULL,
                id_nivel INT NOT NULL,
                nombre_p VARCHAR(80) NOT NULL,
                estado_p VARCHAR(2) NOT NULL,
                descripcion_p VARCHAR(60) NOT NULL,
                codigo_p VARCHAR(20) NOT NULL,
                coord_x DOUBLE PRECISION NOT NULL,
                coord_y DOUBLE PRECISION NOT NULL,
                fecha_alta DATE NOT NULL,
                PRIMARY KEY (id_puesto)
);


CREATE TABLE serv_puesto_periodo (
                id_puesto_periodo INT AUTO_INCREMENT NOT NULL,
                id_periodo INT NOT NULL,
                id_puesto INT NOT NULL,
                estado_puesto_p VARCHAR(2) NOT NULL,
                PRIMARY KEY (id_puesto_periodo)
);


CREATE TABLE serv_persona_puesto (
                id_persona_puesto INT AUTO_INCREMENT NOT NULL,
                id_persona INT NOT NULL,
                id_puesto_periodo INT NOT NULL,
                estado_persona_puesto VARCHAR(2) NOT NULL,
                PRIMARY KEY (id_persona_puesto)
);


CREATE TABLE serv_puesto_respuesta (
                id_puesto_respuesta INT AUTO_INCREMENT NOT NULL,
                id_persona_puesto INT NOT NULL,
                id_categoria_cliente INT NOT NULL,
                observacion VARCHAR(200) NOT NULL,
                fecha_registro DATETIME NOT NULL,
                num_movil VARCHAR(12) NOT NULL,
                PRIMARY KEY (id_puesto_respuesta)
);


CREATE TABLE serv_detalle_respuesta (
                id_detalle_respuesta INT AUTO_INCREMENT NOT NULL,
                id_preguntas INT NOT NULL,
                id_puesto_respuesta INT NOT NULL,
                valor_cal INT NOT NULL,
                PRIMARY KEY (id_detalle_respuesta)
);


ALTER TABLE serv_puesto_respuesta ADD CONSTRAINT serv_categoria_cliente_serv_puesto_respuesta_fk
FOREIGN KEY (id_categoria_cliente)
REFERENCES serv_categoria_cliente (id_categoria_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE serv_preguntas ADD CONSTRAINT serv_tipoalternativa_serv_preguntas_fk
FOREIGN KEY (id_tipo_alternativa)
REFERENCES serv_tipoalternativa (id_tipo_alternativa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE serv_alternativas ADD CONSTRAINT serv_tipoalternativa_serv_alternativas_fk
FOREIGN KEY (id_tipo_alternativa)
REFERENCES serv_tipoalternativa (id_tipo_alternativa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE serv_detalle_respuesta ADD CONSTRAINT serv_preguntas_serv_detalle_respuesta_fk
FOREIGN KEY (id_preguntas)
REFERENCES serv_preguntas (id_preguntas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE serv_persona_puesto ADD CONSTRAINT serv_persona_serv_persona_puesto_fk
FOREIGN KEY (id_persona)
REFERENCES serv_persona (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE serv_puesto_periodo ADD CONSTRAINT serv_periodo_serv_puesto_periodo_fk
FOREIGN KEY (id_periodo)
REFERENCES serv_periodo (id_periodo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE serv_puesto ADD CONSTRAINT serv_nivel_serv_puesto_fk
FOREIGN KEY (id_nivel)
REFERENCES serv_nivel (id_nivel)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE serv_subarea ADD CONSTRAINT serv_area_serv_subarea_fk
FOREIGN KEY (id_area)
REFERENCES serv_area (id_area)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE serv_puesto ADD CONSTRAINT serv_subarea_serv_puesto_fk
FOREIGN KEY (id_subarea)
REFERENCES serv_subarea (id_subarea)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE serv_puesto_periodo ADD CONSTRAINT serv_puesto_serv_puesto_periodo_fk
FOREIGN KEY (id_puesto)
REFERENCES serv_puesto (id_puesto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE serv_persona_puesto ADD CONSTRAINT serv_puesto_periodo_serv_persona_puesto_fk
FOREIGN KEY (id_puesto_periodo)
REFERENCES serv_puesto_periodo (id_puesto_periodo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE serv_puesto_respuesta ADD CONSTRAINT serv_persona_puesto_serv_puesto_respuesta_fk
FOREIGN KEY (id_persona_puesto)
REFERENCES serv_persona_puesto (id_persona_puesto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE serv_detalle_respuesta ADD CONSTRAINT serv_puesto_respuesta_serv_detalle_respuesta_fk
FOREIGN KEY (id_puesto_respuesta)
REFERENCES serv_puesto_respuesta (id_puesto_respuesta)
ON DELETE NO ACTION
ON UPDATE NO ACTION;