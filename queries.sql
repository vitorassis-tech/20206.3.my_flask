-- ============================================================
-- CONSULTA 1 - LISTAGEM DOS CONTEÚDOS ATIVOS
-- ============================================================

-- Seleciona os conteúdos ativos e cria um resumo do texto
SELECT
    c_title,  -- Exibe o título do conteúdo

    -- Pega os primeiros 50 caracteres do texto
    -- e adiciona "..." ao final
    SUBSTR(c_text, 1, 50) || '...' AS c_resume

FROM content  -- Busca os dados na tabela content

-- Exibe somente os conteúdos com status ativo
WHERE c_status = 'on'

-- Ordena do conteúdo mais recente para o mais antigo
ORDER BY c_created_at DESC;


-- ============================================================
-- CONSULTA 2 - VISUALIZAÇÃO DE UM ÚNICO CONTEÚDO
-- ============================================================

-- Usada na página "view" para exibir um conteúdo
-- específico identificado pelo seu ID
SELECT
    c_id,          -- ID do conteúdo
    c_created_at,  -- Data de criação
    c_title,       -- Título do conteúdo
    c_text,        -- Texto completo do conteúdo
    u_id,          -- ID do usuário/autor
    u_name,        -- Nome do autor
    u_photo        -- Foto do autor

FROM content

-- Relaciona o conteúdo com o usuário que o criou
INNER JOIN fbuser
    ON c_owner = u_id

-- Exibe somente conteúdos ativos
WHERE c_status = 'on'

-- Seleciona o conteúdo com ID igual a 4
AND c_id = 4;