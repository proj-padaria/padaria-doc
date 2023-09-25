CREATE OR REPLACE FUNCTION f_bloquear_operacoes_ufs()
RETURNS TRIGGER AS $$
BEGIN

    IF (SELECT 1 FROM ufs WHERE ufs_sigla NOT IN ('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA',
															'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO',
															'RR', 'SC', 'SP', 'SE', 'TO')) THEN
       
        RETURN NEW;
    END IF;
	
    RAISE EXCEPTION 'Não é permitido incluir, alterar ou excluir após a inserção de todas as UFs.';
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tbiud_bloquear_operacoes_ufs
BEFORE INSERT OR UPDATE OR DELETE ON ufs
FOR EACH ROW
EXECUTE FUNCTION f_bloquear_operacoes_ufs();