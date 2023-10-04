CREATE OR REPLACE FUNCTION f_bloquear_insert_empresa()
RETURNS TRIGGER AS $$
BEGIN
	IF (TG_OP = 'INSERT' ) THEN
		IF EXISTS (SELECT 1
		   			FROM empresa) THEN
			RAISE EXCEPTION 'Não pode haver outra empresa!';
		END IF;
	ELSIF (TG_OP = 'DELETE') THEN
			RAISE EXCEPTION 'Não é permitido deletar a empresa!';
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tbid_f_bloquear_insert_empresa
BEFORE INSERT OR DELETE ON empresa
FOR EACH ROW
EXECUTE FUNCTION f_bloquear_insert_empresa();



