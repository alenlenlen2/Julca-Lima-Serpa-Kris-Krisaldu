
CREATE DATABASE krisseldu;
use krisseldu;
CREATE TABLE ejercicios (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion TEXT,
    horarios VARCHAR(255),
    realizado BOOLEAN DEFAULT 0
);

INSERT INTO ejercicios (nombre, descripcion, horarios, realizado) VALUES
('Balance en pelota', 'Ejercicio de balance en pelota para mejorar la coordinación y estabilidad', 'Martes y Jueves - 9:00 AM', 0),
('Balance en pelota', 'Ejercicio de balance en pelota para mejorar la coordinación', 'Lunes - 10:00 AM', 0),
('Balance en pelota', 'Ejercicio de balance en pelota para mejorar la distribución', 'Martes - 11:00 AM', 0),
('Balance en pesas', 'Ejercicio de balance en pesas', 'Miércoles - 9:00 AM', 0);


select * from ejercicios;

CREATE TABLE usuario (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    edad INT,
    dni VARCHAR(15),
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255),
    rol VARCHAR(20)  -- ejemplo: 'TERAPEUTA', 'ADMIN', 'PACIENTE', etc.
);

ALTER TABLE usuario DROP COLUMN condicion;

	
DELETE FROM usuario_condicion WHERE id = 23;


CREATE TABLE condiciones (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE usuario_condicion (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT NOT NULL,
    condicion_id BIGINT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (condicion_id) REFERENCES condiciones(id)
);

CREATE TABLE condicion_ejercicio (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    condicion_id BIGINT NOT NULL,
    ejercicio_id BIGINT NOT NULL,
    FOREIGN KEY (condicion_id) REFERENCES condiciones(id),
    FOREIGN KEY (ejercicio_id) REFERENCES ejercicios(id)
);
CREATE TABLE condicion_terapeuta (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    condicion_id BIGINT NOT NULL,
    terapeuta_id BIGINT NOT NULL,
    FOREIGN KEY (condicion_id) REFERENCES condiciones(id),
    FOREIGN KEY (terapeuta_id) REFERENCES usuario(id)
);

INSERT INTO condiciones (nombre) VALUES
('Tendinitis'),
('Esguince de tobillo');

INSERT INTO usuario (nombre, apellido, edad, dni, username, password, rol) VALUES
('Carlos', 'Ramírez', 35, '12345678', 'carlos.terapeuta', 'hashedpass1', 'TERAPEUTA'),
('María', 'López', 40, '87654321', 'maria.terapeuta', 'hashedpass2', 'TERAPEUTA'),
('Juan', 'Pérez', 28, '11223344', 'juan.paciente', 'hashedpass3', 'PACIENTE'),
('Ana', 'Gómez', 32, '44332211', 'ana.paciente', 'hashedpass4', 'PACIENTE');

-- Juan tiene Tendinitis
INSERT INTO usuario_condicion (usuario_id, condicion_id) VALUES
((SELECT id FROM usuario WHERE username='juan.paciente'),
 (SELECT id FROM condiciones WHERE nombre='Tendinitis'));

-- Ana tiene Esguince de tobillo
INSERT INTO usuario_condicion (usuario_id, condicion_id) VALUES
((SELECT id FROM usuario WHERE username='ana.paciente'),
 (SELECT id FROM condiciones WHERE nombre='Esguince de tobillo'));

-- Carlos atiende Tendinitis
INSERT INTO condicion_terapeuta (condicion_id, terapeuta_id) VALUES
((SELECT id FROM condiciones WHERE nombre='Tendinitis'),
 (SELECT id FROM usuario WHERE username='carlos.terapeuta'));

-- María atiende Esguince de tobillo
INSERT INTO condicion_terapeuta (condicion_id, terapeuta_id) VALUES
((SELECT id FROM condiciones WHERE nombre='Esguince de tobillo'),
 (SELECT id FROM usuario WHERE username='maria.terapeuta'));
 
 INSERT INTO ejercicios (nombre, descripcion, horarios, realizado) VALUES
('Ejercicio de estiramiento para tendinitis', 'Estiramiento del tendón afectado para mejorar la flexibilidad.', 'Mañana y tarde', false),
('Fortalecimiento muscular para tendinitis', 'Ejercicios para fortalecer músculos relacionados.', 'Tarde', false),
('Movilización suave para esguince de tobillo', 'Movilización para recuperar movilidad articular.', 'Mañana', false),
('Ejercicio de equilibrio para esguince de tobillo', 'Ejercicios para mejorar el equilibrio y estabilidad.', 'Noche', false);


-- Ejercicios para Tendinitis (primeros 2 ejercicios)
INSERT INTO condicion_ejercicio (condicion_id, ejercicio_id) VALUES
((SELECT id FROM condiciones WHERE nombre='Tendinitis'),
 (SELECT id FROM ejercicios WHERE nombre='Ejercicio de estiramiento para tendinitis'));

INSERT INTO condicion_ejercicio (condicion_id, ejercicio_id) VALUES
((SELECT id FROM condiciones WHERE nombre='Tendinitis'),
 (SELECT id FROM ejercicios WHERE nombre='Fortalecimiento muscular para tendinitis'));

-- Ejercicios para Esguince de tobillo (últimos 2 ejercicios)
INSERT INTO condicion_ejercicio (condicion_id, ejercicio_id) VALUES
((SELECT id FROM condiciones WHERE nombre='Esguince de tobillo'),
 (SELECT id FROM ejercicios WHERE nombre='Movilización suave para esguince de tobillo'));

INSERT INTO condicion_ejercicio (condicion_id, ejercicio_id) VALUES
((SELECT id FROM condiciones WHERE nombre='Esguince de tobillo'),
 (SELECT id FROM ejercicios WHERE nombre='Ejercicio de equilibrio para esguince de tobillo'));

 INSERT INTO usuario (nombre, apellido, edad, dni, username, password, rol) VALUES
('Alfredo', 'Serpa', 37, '23412123', 'Alfredo.terapeuta', 'cerpa2828', 'TERAPEUTA');
INSERT INTO condicion_terapeuta (condicion_id, terapeuta_id) VALUES
((SELECT id FROM condiciones WHERE nombre='Esguince de tobillo'),
 (SELECT id FROM usuario WHERE username='Alfredo.terapeuta'));

CREATE TABLE usuario_ejercicio (
    usuario_id BIGINT,
    ejercicio_id BIGINT,
    realizado BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (usuario_id, ejercicio_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (ejercicio_id) REFERENCES ejercicios(id)
);

CREATE TABLE paciente (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT,
    horarios VARCHAR(255),
    asistencia VARCHAR(50),
    video VARCHAR(255),
    terapeuta_id BIGINT,
    FOREIGN KEY (terapeuta_id) REFERENCES usuario(id)
);

CREATE TABLE asistencia (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT NOT NULL,
    ejercicio_id BIGINT NOT NULL,
    asistencia ENUM('presente', 'ausente') NOT NULL,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (ejercicio_id) REFERENCES ejercicios(id)
);


SELECT * FROM usuario;

SELECT * FROM usuario;
