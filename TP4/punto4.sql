DELIMITER $$

CREATE PROCEDURE CuentasConSaldoMayorQue(IN limite DECIMAL(10,2))

BEGIN

  SELECT *
  FROM cuentas
  WHERE saldo>limite;

END $$

DELIMITER ;