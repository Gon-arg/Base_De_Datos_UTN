DELIMITER $$

CREATE PROCEDURE TotalMovimientosDelMes(IN cuenta INT, OUT total DECIMAL(10,2))

BEGIN

  DECLARE fin_cursor BOOLEAN DEFAULT FALSE;
  DECLARE v_fecha DATE;
  DECLARE v_tipo VARCHAR(10);
  DECLARE v_importe DECIMAL(10,2);

  DECLARE cursor CURSOR FOR
  SELECT fecha, tipo, importe
  FROM movimientos
  WHERE numero_cuenta=cuenta and month(fecha)=month(curdate());

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor=TRUE;

  SET total=0.00;


  OPEN cursor;
  leer_filas: LOOP

    FETCH cursor INTO v_fecha, v_tipo, v_importe;
    IF fin_cursor THEN 
      LEAVE leer_filas;
    END IF ;
  
    IF v_tipo='DEBITO' THEN
      total=total-v_importe;
    ELSE
      total=total+v_importe;
    END IF ;

  END LOOP leer_filas;
  CLOSE cursor;

END $$

DELIMITER ;