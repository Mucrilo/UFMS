SET search_path = delegacia;

--Crie uma função (intitulada fn_bo_varios_estados) que receba como parâmetro o código
-- (INTEGER) de uma vítima e retorne (TRUE ou FALSE) se ela já registrou boletins de ocorrência
-- em mais de um estado do território brasileiro

CREATE OR REPLACE FUNCTION fn_bo_varios_estados(codigo_vitima INTEGER)
RETURNS bool AS
$$
    BEGIN
        PERFORM (SELECT bo.local_estado
                    FROM bo
                    WHERE bo.vitima_codigo = codigo_vitima
                    GROUP BY bo.local_estado
                    HAVING COUNT(bo.local_estado) > 1
                    LIMIT 1);
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$$ LANGUAGE 'plpgsql';


--  SELECT fn_bo_varios_estados(2);