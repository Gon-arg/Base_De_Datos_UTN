DELIMITER $$

CREATE PROCEDURE AplicarPorcentaje(IN monto DECIMAL(10,2), IN porcentaje DECIMAL(10,2))

BEGIN

  DECLARE v_saldo DECIMAL(10,2);
  DECLARE v_numero_cuenta INT;
  DECLARE fin_cursor BOOLEAN DEFAULT FALSE;
  DECLARE cursor CURSOR FOR
  SELECT numero_cuenta, saldo
  FROM cuentas
  WHERE saldo>monto;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor=TRUE;

  OPEN cursor;
  leer_filas: LOOP

    FETCH cursor INTO v_numero_cuenta, v_saldo;
    IF fin_cursor THEN
      LEAVE leer_filas;
    END IF ;
    UPDATE cuentas
    SET saldo=v_saldo*(1+porcentaje)
    WHERE numero_cuenta=v_numero_cuenta;
  
  END LOOP leer_filas;
  CLOSE cursor;

END $$

DELIMITER ;