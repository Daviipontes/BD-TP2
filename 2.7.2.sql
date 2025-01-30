CREATE OR REPLACE FUNCTION verifica_limite_disciplinas()
RETURNS TRIGGER AS $$
DECLARE
    semestre_turma VARCHAR(20); 
    disciplina_turma INT;       
    qtd_disciplinas INT;        
BEGIN
    
    SELECT semestre, disciplina_id INTO semestre_turma, disciplina_turma
    FROM Turma
    WHERE id = NEW.turma_id;

    
    SELECT COUNT(DISTINCT disciplina_id) INTO qtd_disciplinas
    FROM Turma
    JOIN Aluno_Turma ON Turma.id = Aluno_Turma.turma_id
    WHERE Aluno_Turma.aluno_id = NEW.aluno_id
      AND Turma.semestre = semestre_turma;

    
    IF qtd_disciplinas >= 4 AND NOT EXISTS (
        SELECT 1
        FROM Turma
        JOIN Aluno_Turma ON Turma.id = Aluno_Turma.turma_id
        WHERE Aluno_Turma.aluno_id = NEW.aluno_id
          AND Turma.semestre = semestre_turma
          AND Turma.disciplina_id = disciplina_turma
    ) THEN
        RAISE EXCEPTION 'Excesso de disciplinas';
    END IF;

    RETURN NEW; 
END;
$$ LANGUAGE plpgsql


CREATE TRIGGER trg_limite_disciplinas
BEFORE INSERT ON Aluno_Turma
FOR EACH ROW
EXECUTE FUNCTION verifica_limite_disciplinas();