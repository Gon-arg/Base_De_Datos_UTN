DROP TRIGGER IF EXISTS actualizar_saldo;

DELIMITER $$

CREATE TRIGGER actualizar_saldo
AFTER INSERT ON movimientos
FOR EACH ROW

BEGIN

  DECLARE saldo_anterior DECIMAL(10,2);
  DECLARE saldo_nuevo DECIMAL(10,2);

  SELECT saldo INTO saldo_anterior
  FROM cuentas
  WHERE numero_cuenta=new.numero_cuenta;

  IF new.tipo='DEBITO' THEN  
    SET saldo_nuevo=saldo_anterior-new.importe;  
  ELSE
    SET saldo_nuevo=saldo_anterior+new.importe; 
  END IF ;

  UPDATE cuentas
  SET saldo=saldo_nuevo
  WHERE numero_cuenta=new.numero_cuenta;
  INSERT INTO historial_movimientos(id,numero_cuenta,numero_movimiento,saldo_anterior,saldo_actual) VALUES 
  (new.id,new.numero_cuenta,new.numero_movimiento,saldo_anterior,saldo_nuevo);

END $$

DELIMITER ;