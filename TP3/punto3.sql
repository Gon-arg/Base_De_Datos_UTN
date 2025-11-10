DELIMITER $$

CREATE PROCEDURE VerCuentas()

BEGIN

  SELECT numero_cuenta, saldo
  FROM cuentas;

END $$

DELIMITER ;