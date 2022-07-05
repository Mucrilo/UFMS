SET search_path = delegacia;

DROP VIEW IF EXISTS v_ultimo_homicidio;
DROP VIEW IF EXISTS v_qtd_violencia_contra_mulher;
DROP VIEW IF EXISTS v_qtde_ocorrencias_30_dias_sp;
DROP VIEW IF EXISTS v_vitimas_com_pelo_menos_3_ocorrencias;

-- Data e hora completa, nome e data nascimento da vítima do último “Homicidio” registrado no estado de MS no 
--    ano atual;
CREATE OR REPLACE VIEW v_ultimo_homicidio AS
    SELECT bo.data_ocorrencia AS "Data e Hora", vitima.nome AS "Nome", vitima.datanasc AS "Data de Nascimento"
    FROM tipo_ocorrencia JOIN bo ON tipo_ocorrencia.codigo = bo.tipo_ocorrencia_codigo
        JOIN vitima ON bo.vitima_codigo = vitima.codigo
    WHERE tipo_ocorrencia.nome LIKE 'Homicidio%'
        AND bo.local_estado = 'MS'
        AND date_part('year', bo.data_ocorrencia) = date_part('year', now())
    ORDER BY bo.data_ocorrencia DESC
    LIMIT 1;

--número total de registros “Violencia contra mulher” nos últimos 10 anos, agregados por estado de 
--    ocorrência e ordenados ascendentemente pelo nome do estado;
CREATE OR REPLACE VIEW v_qtd_violencia_contra_mulher AS
    SELECT bo.local_estado AS "Estado", COUNT(*) AS "Ocorrências"
    FROM tipo_ocorrencia JOIN bo ON tipo_ocorrencia.codigo = bo.tipo_ocorrencia_codigo
    WHERE tipo_ocorrencia.nome = 'Violencia contra mulher'
        AND bo.data_ocorrencia > now() - interval '10' YEAR
    GROUP BY bo.local_estado
    ORDER BY bo.local_estado ASC;

--número total de registros de ocorrência nos últimos 30 dias no estado de SP, agregados por tipo 
--    de ocorrência e ordenados ascendetemente pelo nome do tipo de ocorrência;
CREATE OR REPLACE VIEW v_qtde_ocorrencias_30_dias_sp AS
    SELECT tipo_ocorrencia.nome AS "Ocorrência", COUNT(*) AS "Total de Ocorrências"
    FROM tipo_ocorrencia JOIN bo ON tipo_ocorrencia.codigo = bo.tipo_ocorrencia_codigo
    WHERE bo.data_ocorrencia >= NOW() - INTERVAL '30' DAY
        AND bo.local_estado = 'SP'
    GROUP BY tipo_ocorrencia.nome
    ORDER BY tipo_ocorrencia.nome ASC;

--Listar nome, data de nascimento, telefone (com ddd, numero e operadora, caso seja celular) 
--    das vitimas que registraram pelo menos 3 boletins de ocorrência desde o ano de 1914;
CREATE OR REPLACE VIEW v_vitimas_com_pelo_menos_3_ocorrencias AS
    SELECT vitima.nome AS "Nome", vitima.datanasc AS "Data de Nascimento", telefone.ddd AS "DDD", telefone.numero AS "Telefone", telefone_operadora.nome AS "Operadora"
    FROM vitima JOIN telefone ON vitima.codigo = telefone.vitima_codigo
        JOIN telefone_operadora ON telefone_operadora.codigo = telefone.telefone_operadora_codigo
        JOIN bo on vitima.codigo = bo.vitima_codigo
    WHERE telefone.tipo = '_CELULAR_'
        AND date_part('year', bo.data_ocorrencia) >= 1914
    GROUP BY vitima.nome, vitima.datanasc, telefone.ddd, telefone.numero, telefone_operadora.nome 
    HAVING COUNT(vitima.codigo) >= 3;

--  SELECT * FROM v_ultimo_homicidio;
--  SELECT * FROM v_qtd_violencia_contra_mulher;
--  SELECT * FROM v_qtde_ocorrencias_30_dias_sp;
--  SELECT * FROM v_vitimas_com_pelo_menos_3_ocorrencias;