CREATE OR REPLACE FUNCTION f_tbiu_cidades()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM cidades
        WHERE UPPER(nome) = UPPER (NEW.nome) AND UPPER (uf) = UPPER (NEW.uf)
    ) THEN
        RAISE EXCEPTION 'Já existe uma cidade com o mesmo nome nesta UF.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_tbiu_cidades
BEFORE INSERT OR UPDATE ON cidades
FOR EACH ROW
EXECUTE FUNCTION f_tbiu_cidades();

UPDATE empresa SET db_versao = "B0260";