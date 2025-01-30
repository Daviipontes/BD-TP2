CREATE OR REPLACE PROCEDURE inc_semestre(param_semestre INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Aluno
    SET semestre = semestre + 1
    WHERE semestre = param_semestre;
END;
$$;