--Stored Procedure para Concluir uma Missão
CREATE OR REPLACE PROCEDURE sp_concluir_missao(p_missao_id INT) 
LANGUAGE plpgsql
AS $$
BEGIN
    --Atualiza o status da missão para 'concluída'
    UPDATE missao
    SET status = 'concluída'
    WHERE id = p_missao_id;
    --Verifica se todas as missões do mundo foram concluídas
    PERFORM 1
    FROM mundo m
    JOIN sala s ON m.id = s.mundo_id
    JOIN missao ms ON s.id = ms.sala_id
    WHERE ms.id = p_missao_id
    AND NOT EXISTS (
        SELECT 1
        FROM missao msi
        JOIN sala sa ON msi.sala_id = sa.id
        WHERE sa.mundo_id = m.id
        AND msi.status <> 'concluída'
    );
    --Atualiza o status do mundo para 'concluído' se todas as missões forem concluídas
    IF FOUND THEN
        UPDATE mundo
        SET status = 'concluído'
        WHERE id = (
            SELECT mundo_id
            FROM sala
            WHERE id = (SELECT sala_id FROM missao WHERE id = p_missao_id)
        );
    END IF;
END;
$$;

--Stored Procedure para Inserir um Novo Jogador no Grupo
CREATE OR REPLACE PROCEDURE sp_inserir_jogador_grupo(p_jogador_id INT, p_grupo_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_total_jogadores INT;
BEGIN
    --Conta quantos jogadores já estão no grupo
    SELECT COUNT(*)
    INTO v_total_jogadores
    FROM jogador
    WHERE grupo_id = p_grupo_id;
    --Verifica se o grupo já atingiu o número máximo de jogadores
    IF v_total_jogadores >= 3 THEN
        RAISE EXCEPTION 'O grupo já possui o número máximo de jogadores (3).';
    END IF;
    --Atualiza o grupo do jogador
    UPDATE jogador
    SET grupo_id = p_grupo_id
    WHERE id = p_jogador_id;
END;
$$;

--Stored Procedure para Adicionar Item ao Inventário
CREATE OR REPLACE PROCEDURE sp_adicionar_item_inventario(p_inventario_id INT, p_item_id INT, p_quantidade INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_peso_item NUMERIC;
    v_capacidade_restante NUMERIC;
BEGIN
    --Obtém o peso do item
    SELECT peso
    INTO v_peso_item
    FROM item
    WHERE id = p_item_id;
    --Verifica a capacidade restante do inventário
    SELECT capacidade - COALESCE(SUM(i.peso * ii.quantidade), 0)
    INTO v_capacidade_restante
    FROM item_inventario ii
    JOIN item i ON ii.item_id = i.id
    WHERE ii.inventario_id = p_inventario_id;
    --Verifica se o inventário tem capacidade suficiente
    IF v_capacidade_restante < (v_peso_item * p_quantidade) THEN
        RAISE EXCEPTION 'Capacidade insuficiente no inventário.';
    END IF;
    --Adiciona o item ao inventário
    INSERT INTO item_inventario (inventario_id, item_id, quantidade)
    VALUES (p_inventario_id, p_item_id, p_quantidade);
END;
$$;

--Stored Procedure para Criar um Novo Mundo com Salas e Missões
CREATE OR REPLACE PROCEDURE sp_criar_mundo(p_nome_mundo TEXT, p_salas JSON)
LANGUAGE plpgsql
AS $$
DECLARE
    v_mundo_id INT;
    v_sala_id INT;
    v_missao JSON;
BEGIN
    --Cria o novo mundo
    INSERT INTO mundo (nome, status)
    VALUES (p_nome_mundo, 'ativo')
    RETURNING id INTO v_mundo_id;

    --Itera sobre as salas e cria cada uma
    FOR v_sala IN SELECT * FROM json_array_elements(p_salas)
    LOOP
        INSERT INTO sala (nome, mundo_id)
        VALUES (v_sala->>'nome', v_mundo_id)
        RETURNING id INTO v_sala_id;

        --Itera sobre as missões da sala e cria cada uma
        FOR v_missao IN SELECT * FROM json_array_elements(v_sala->'missoes')
        LOOP
            INSERT INTO missao (nome, descricao, obrigatoriedade, sala_id, status)
            VALUES (
                v_missao->>'nome',
                v_missao->>'descricao',
                (v_missao->>'obrigatoriedade')::BOOLEAN,
                v_sala_id,
                'pendente'
            );
        END LOOP;
    END LOOP;
END;
$$;

--Stored Procedure para Verificar o Progresso de um Grupo
CREATE OR REPLACE PROCEDURE sp_verificar_progresso_grupo(p_grupo_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_missoes_concluidas INT;
    v_total_missoes INT;
BEGIN
    --Conta o número de missões concluídas
    SELECT COUNT(*)
    INTO v_missoes_concluidas
    FROM missao m
    JOIN sala s ON m.sala_id = s.id
    JOIN mundo mu ON s.mundo_id = mu.id
    WHERE mu.id = (SELECT mundo_id FROM grupo WHERE id = p_grupo_id)
    AND m.status = 'concluída';

    --Conta o número total de missões
    SELECT COUNT(*)
    INTO v_total_missoes
    FROM missao m
    JOIN sala s ON m.sala_id = s.id
    JOIN mundo mu ON s.mundo_id = mu.id
    WHERE mu.id = (SELECT mundo_id FROM grupo WHERE id = p_grupo_id);

    --Retorna os resultados
    RAISE NOTICE 'Progresso do grupo: % missões concluídas de % no total.', v_missoes_concluidas, v_total_missoes;
END;
$$;

--Stored Procedure para Remover um Jogador de um Grupo
CREATE OR REPLACE PROCEDURE sp_remover_jogador_grupo(p_jogador_id INT, p_grupo_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    --Verifica se o jogador está no grupo
    IF NOT EXISTS (
        SELECT 1
        FROM jogador
        WHERE id = p_jogador_id
        AND grupo_id = p_grupo_id
    ) THEN
        RAISE EXCEPTION 'Jogador com ID % não está no grupo com ID %.', p_jogador_id, p_grupo_id;
    END IF;
    --Remove o jogador do grupo
    UPDATE jogador
    SET grupo_id = NULL
    WHERE id = p_jogador_id;
END;
$$;

--Stored Procedure para Atribuir uma Missão a um Jogador
CREATE OR REPLACE PROCEDURE sp_atribuir_missao_jogador(p_jogador_id INT, p_missao_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    --Verifica se a missão existe e está pendente
    IF NOT EXISTS (
        SELECT 1
        FROM missao
        WHERE id = p_missao_id
        AND status = 'pendente'
    ) THEN
        RAISE EXCEPTION 'Missão com ID % não encontrada ou já foi concluída.', p_missao_id;
    END IF;

    --Verifica se o jogador já está atribuído a outra missão
    IF EXISTS (
        SELECT 1
        FROM jogador_missao
        WHERE jogador_id = p_jogador_id
        AND status = 'em progresso'
    ) THEN
        RAISE EXCEPTION 'Jogador com ID % já está em uma missão em progresso.', p_jogador_id;
    END IF;

    --Atribui a missão ao jogador e define o status como 'em progresso'
    INSERT INTO jogador_missao (jogador_id, missao_id, status)
    VALUES (p_jogador_id, p_missao_id, 'em progresso');
END;
$$;

--Stored Procedure para Remover um Item do Inventário
CREATE OR REPLACE PROCEDURE sp_remover_item_inventario(p_inventario_id INT, p_item_id INT, p_quantidade INT)
LANGUAGE plpgsql
AS $$
BEGIN
    --Verifica se o item está no inventário
    IF NOT EXISTS (
        SELECT 1
        FROM item_inventario
        WHERE inventario_id = p_inventario_id
        AND item_id = p_item_id
        AND quantidade >= p_quantidade
    ) THEN
        RAISE EXCEPTION 'Item com ID % não encontrado no inventário com ID % ou quantidade insuficiente.', p_item_id, p_inventario_id;
    END IF;
    --Remove a quantidade especificada do item
    UPDATE item_inventario
    SET quantidade = quantidade - p_quantidade
    WHERE inventario_id = p_inventario_id
    AND item_id = p_item_id;
    --Remove o item do inventário se a quantidade chegar a zero
    DELETE FROM item_inventario
    WHERE inventario_id = p_inventario_id
    AND item_id = p_item_id
    AND quantidade = 0;
END;
$$;

--Trigger para Concluir uma Missão
CREATE OR REPLACE FUNCTION fn_after_concluir_missao()
RETURNS TRIGGER AS $$
BEGIN
    --Atualiza o status da missão
    UPDATE missao
    SET status = 'concluída'
    WHERE id = NEW.id;

    --Verifica se todas as missões do mundo foram concluídas
    IF NOT EXISTS (
        SELECT 1
        FROM missao ms
        JOIN sala s ON ms.sala_id = s.id
        JOIN mundo m ON s.mundo_id = m.id
        WHERE m.id = (SELECT mundo_id FROM sala WHERE id = (SELECT sala_id FROM missao WHERE id = NEW.id))
        AND ms.status <> 'concluída'
    ) THEN
        --Atualiza o status do mundo para 'concluído'
        UPDATE mundo
        SET status = 'concluído'
        WHERE id = (SELECT mundo_id FROM sala WHERE id = (SELECT sala_id FROM missao WHERE id = NEW.id));
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_after_concluir_missao
AFTER UPDATE OF status ON missao
FOR EACH ROW
WHEN (NEW.status = 'concluída')
EXECUTE FUNCTION fn_after_concluir_missao();

--Trigger para Inserir um Novo Jogador no Grupo
CREATE OR REPLACE FUNCTION fn_before_inserir_jogador_grupo()
RETURNS TRIGGER AS $$
BEGIN
    --Conta quantos jogadores já estão no grupo
    DECLARE
        v_total_jogadores INT;
    BEGIN
        SELECT COUNT(*)
        INTO v_total_jogadores
        FROM jogador
        WHERE grupo_id = NEW.grupo_id;

        --Verifica se o grupo já atingiu o número máximo de jogadores
        IF v_total_jogadores >= 3 THEN
            RAISE EXCEPTION 'O grupo já possui o número máximo de jogadores (3).';
        END IF;

        RETURN NEW;
    END;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_before_inserir_jogador_grupo
BEFORE UPDATE OF grupo_id ON jogador
FOR EACH ROW
WHEN (NEW.grupo_id IS DISTINCT FROM OLD.grupo_id)
EXECUTE FUNCTION fn_before_inserir_jogador_grupo();

--Trigger para Adicionar Item ao Inventário
CREATE OR REPLACE FUNCTION fn_before_adicionar_item_inventario()
RETURNS TRIGGER AS $$
BEGIN
    DECLARE
        v_peso_item NUMERIC;
        v_capacidade_restante NUMERIC;
    BEGIN
        --Obtém o peso do item
        SELECT peso
        INTO v_peso_item
        FROM item
        WHERE id = NEW.item_id;

        --Verifica a capacidade restante do inventário
        SELECT capacidade - COALESCE(SUM(i.peso * ii.quantidade), 0)
        INTO v_capacidade_restante
        FROM item_inventario ii
        JOIN item i ON ii.item_id = i.id
        WHERE ii.inventario_id = NEW.inventario_id;

        --Verifica se o inventário tem capacidade suficiente
        IF v_capacidade_restante < (v_peso_item * NEW.quantidade) THEN
            RAISE EXCEPTION 'Capacidade insuficiente no inventário.';
        END IF;

        RETURN NEW;
    END;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_before_adicionar_item_inventario
BEFORE INSERT ON item_inventario
FOR EACH ROW
EXECUTE FUNCTION fn_before_adicionar_item_inventario();

--Trigger para Verificar o Progresso de um Grupo
CREATE OR REPLACE FUNCTION fn_after_verificar_progresso_grupo()
RETURNS TRIGGER AS $$
BEGIN
    --Verifica e notifica o progresso do grupo
    PERFORM sp_verificar_progresso_grupo(NEW.grupo_id);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_after_verificar_progresso_grupo
AFTER UPDATE OF status ON missao
FOR EACH ROW
WHEN (NEW.status = 'concluída')
EXECUTE FUNCTION fn_after_verificar_progresso_grupo();

--Trigger para Remover um Jogador de um Grupo
CREATE OR REPLACE FUNCTION fn_before_remover_jogador_grupo()
RETURNS TRIGGER AS $$
BEGIN
    --Verifica se o jogador está no grupo
    IF NOT EXISTS (
        SELECT 1
        FROM jogador
        WHERE id = OLD.id
        AND grupo_id = OLD.grupo_id
    ) THEN
        RAISE EXCEPTION 'Jogador com ID % não está no grupo com ID %.', OLD.id, OLD.grupo_id;
    END IF;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_before_remover_jogador_grupo
BEFORE UPDATE OF grupo_id ON jogador
FOR EACH ROW
WHEN (OLD.grupo_id IS DISTINCT FROM NEW.grupo_id)
EXECUTE FUNCTION fn_before_remover_jogador_grupo();

--Trigger para Atribuir uma Missão a um Jogador
CREATE OR REPLACE FUNCTION fn_before_atribuir_missao_jogador()
RETURNS TRIGGER AS $$
BEGIN
    --Verifica se o jogador já está atribuído a outra missão
    IF EXISTS (
        SELECT 1
        FROM jogador_missao
        WHERE jogador_id = NEW.jogador_id
        AND status = 'em progresso'
    ) THEN
        RAISE EXCEPTION 'Jogador com ID % já está em uma missão em progresso.', NEW.jogador_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_before_atribuir_missao_jogador
BEFORE INSERT ON jogador_missao
FOR EACH ROW
EXECUTE FUNCTION fn_before_atribuir_missao_jogador();

--Trigger para Remover um Item do Inventário
CREATE OR REPLACE FUNCTION fn_after_remover_item_inventario()
RETURNS TRIGGER AS $$
BEGIN
    --Remove o item do inventário se a quantidade chegar a zero
    DELETE FROM item_inventario
    WHERE inventario_id = OLD.inventario_id
    AND item_id = OLD.item_id
    AND quantidade = 0;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_after_remover_item_inventario
AFTER UPDATE OF quantidade ON item_inventario
FOR EACH ROW
WHEN (NEW.quantidade = 0)
EXECUTE FUNCTION fn_after_remover_item_inventario();
