CREATE OR REPLACE FUNCTION fn_retorna() RETURNS integer
AS $$
DECLARE
    inteiro integer := 10;
    
BEGIN

    return inteiro;
    
END;
$$LANGUAGE 'plpgsql'


CREATE OR REPLACE FUNCTION fn_subtrai (vlr_a decimal, vlr_b decimal) returns decimal AS
$$
DECLARE
    resultado decimal(10,2);
BEGIN
    resultado := vlr_a - vlr_b;
    
    return resultado; 
END;
$$ LANGUAGE 'plpgsql'


CREATE OR REPLACE FUNCTION fn_retorna_qtd_2blocos()
RETURNS integer AS
$$
    DECLARE
        qtd integer:= 30;
    BEGIN
        RAISE NOTICE 'qtd aqui é %', qtd; -- 30
        qtd := 50;
        -- sub bloco
        DECLARE
            qtd integer := 80;
        BEGIN
            RAISE NOTICE 'qtd aqui é %', qtd; -- 80
        END;
        -- fim bloco
        RAISE NOTICE 'atd aqui é %', qtd; -- 50
        RETURN qtd;
    END;
$$ LANGUAGE 'plpgsql';

