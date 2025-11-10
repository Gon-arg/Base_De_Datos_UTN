DELIMITER $$

CREATE PROCEDURE Extraer(IN cuenta INT, IN monto DECIMAL(10,2))

BEGIN

  DECLARE saldoP DECIMAL(10,2);
  SELECT saldo INTO saldoP
  FROM cuentas
  WHERE numero_cuenta=cuenta;
  IF monto<saldoP and saldoP>0 THEN
    INSERT INTO movimientos(numero_cuenta,fecha,tipo,importe) VALUES (cuenta,curdate(),'DEBITO',monto);
  ELSE 
    SIGNAL SQLSTATE '45000' SET message_text='fondos insuficientes';
  END IF ;

END $$

DELIMITER ;