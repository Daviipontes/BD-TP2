CREATE OR REPLACE FUNCTION verifica_capacidade_turma()
RETURNS TRIGGER AS $$
DECLARE
    capacidade INT;
    alunos_matriculados INT;
BEGIN
    SELECT capacidade_maxima INTO capacidade
    FROM Turma
    WHERE id = NEW.turma_id;

    SELECT COUNT(*) INTO alunos_matriculados
    FROM Aluno_Turma
    WHERE turma_id = NEW.turma_id;
    IF alunos_matriculados >= capacidade THEN
        RAISE EXCEPTION 'Não é possível adicionar mais alunos.';
    END IF;

    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_verifica_capacidade_turma
BEFORE INSERT ON Aluno_Turma
FOR EACH ROW
EXECUTE FUNCTION verifica_capacidade_turma();