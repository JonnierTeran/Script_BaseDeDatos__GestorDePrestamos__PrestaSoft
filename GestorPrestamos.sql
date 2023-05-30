CREATE DATABASE GestorPrestamos;

USE GestorPrestamos;

CREATE TABLE administrador(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombres VARCHAR(255) NOT NULL,
    apellidos VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE cliente(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombres VARCHAR(255) NOT NULL,
    apellidos VARCHAR(255) NOT NULL,
    id_administrador INT NOT NULL,
    FOREIGN KEY (id_administrador) REFERENCES administrador(id)
);

CREATE TABLE prestamo(
    codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado VARCHAR(255) NOT NULL,
    monto_prestado DECIMAL(10,2) NOT NULL,
    total_deuda DECIMAL(10,2) NOT NULL,
    saldo_restante DECIMAL(10,2) NOT NULL,
    id_administrador INT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_administrador) REFERENCES administrador(id),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE pago(
    referencia INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    monto_abonado DECIMAL(10,2) NOT NULL,
    codigo_prestamo INT NOT NULL,
    FOREIGN KEY (codigo_prestamo) REFERENCES prestamo(codigo)
);
