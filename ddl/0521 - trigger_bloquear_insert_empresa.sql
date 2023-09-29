CREATE OR REPLACE FUNCTION f_bloquear_insert_empresa()
RETURNS TRIGGER AS $$
BEGIN
   RAISE EXCEPTION 'Não é permitido incluir outra empresa.';
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tbid_f_bloquear_insert_empresa
BEFORE INSERT OR DELETE ON empresa
FOR EACH ROW
EXECUTE FUNCTION f_bloquear_insert_empresa();

