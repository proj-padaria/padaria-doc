CREATE OR REPLACE FUNCTION f_bloquear_operacoes_ufs()
RETURNS TRIGGER AS $$
BEGIN
   RAISE EXCEPTION 'Não é permitido incluir, alterar ou excluir após a inserção de todas as UFs.';
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tbiud_bloquear_operacoes_ufs
BEFORE INSERT OR UPDATE OR DELETE ON ufs
FOR EACH ROW
EXECUTE FUNCTION f_bloquear_operacoes_ufs();