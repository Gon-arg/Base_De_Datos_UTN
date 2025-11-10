DELIMITER $$

CREATE TRIGGER actualizar_saldo
AFTER INSERT ON movimientos
FOR EACH ROW 

BEGIN

  IF new.tipo='DEBITO' THEN 
    UPDATE cuentas 
    SET saldo=saldo-new.importe
    WHERE numero_cuenta=new.numero_cuenta;
  ELSE 
    UPDATE cuentas 
    SET saldo=saldo+new.importe
    WHERE numero_cuenta=new.numero_cuenta;
  END IF ;

END $$

DELIMITER ;