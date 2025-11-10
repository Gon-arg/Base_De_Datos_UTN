DELIMITER $$

CREATE PROCEDURE TotalMovimientosDelMes(IN cuenta INT, OUT total DECIMAL(10,2))

BEGIN

  SELECT SUM(CASE
                WHEN tipo='DEBITO' THEN importe
                WHEN tipo='CREDITO' THEN -importe
            END) INTO total
  FROM movimientos
  WHERE month(fecha)=month(curdate()) and numero_cuenta=cuenta;

END $$

DELIMITER ;