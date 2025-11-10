DELIMITER $$

CREATE PROCEDURE Depositar(IN cuenta INT, IN monto DECIMAL(10,2))

BEGIN

  INSERT INTO movimientos(numero_cuenta,fecha, tipo,importe)
  VALUES (cuenta,curdate(),'CREDITO',monto);

END $$

DELIMITER ;