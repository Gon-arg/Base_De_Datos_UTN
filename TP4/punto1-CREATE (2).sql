DROP DATABASE IF EXISTS Banco;
CREATE DATABASE Banco;
USE Banco;

CREATE TABLE clientes(
  numero_cliente INT NOT NULL PRIMARY KEY,
  dni INT NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  nombre VARCHAR(50) NOT NULL
);
CREATE TABLE cuentas(
  numero_cuenta INT NOT NULL PRIMARY KEY,
  numero_cliente INT NOT NULL,
  saldo DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (numero_cliente) REFERENCES clientes (numero_cliente)
);
CREATE TABLE movimientos(
  numero_movimiento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  numero_cuenta INT NOT NULL,
  fecha DATE NOT NULL,
  tipo ENUM("CREDITO","DEBITO") NOT NULL,
  importe DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (numero_cuenta) REFERENCES cuentas (numero_cuenta)
);
CREATE TABLE historial_movimientos(
  id INT NOT NULL PRIMARY KEY,
  numero_cuenta INT NOT NULL,
  numero_movimiento INT NOT NULL,
  saldo_anterior DECIMAL(10,2) NOT NULL,
  saldo_actual DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (numero_cuenta) REFERENCES cuentas (numero_cuenta),
  FOREIGN KEY (numero_movimiento) REFERENCES movimientos (numero_movimiento)
);

-- creamos un trigger para convertir a mayuscula todos los ingresos en el parámetro 'tipo'

DELIMITER $$

CREATE TRIGGER tipo_mayuscula
BEFORE INSERT ON movimientos
FOR EACH ROW
BEGIN
  SET NEW.tipo = UPPER(NEW.tipo);
END $$

DELIMITER ;