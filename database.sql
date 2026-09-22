-- ============================================================
-- BANCO DE DADOS - CONTEÚDOS E CONTATOS
-- ============================================================


-- ============================================================
-- 1. EXCLUSÃO DAS TABELAS
-- Somente para ambiente de desenvolvimento/testes
-- ============================================================

DROP TABLE IF EXISTS content;
DROP TABLE IF EXISTS fbuser;
DROP TABLE IF EXISTS contact;


-- ============================================================
-- 2. TABELA DE USUÁRIOS
-- ============================================================

CREATE TABLE fbuser (
    u_id         INTEGER PRIMARY KEY AUTOINCREMENT,
    u_created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    u_uid        TEXT NOT NULL UNIQUE,
    u_email      TEXT NOT NULL UNIQUE,
    u_name       TEXT,
    u_photo      TEXT
);


-- ============================================================
-- 3. TABELA DE CONTEÚDOS
-- ============================================================

CREATE TABLE content (
    c_id         INTEGER PRIMARY KEY AUTOINCREMENT,
    c_created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    c_title      TEXT NOT NULL,
    c_text       TEXT,
    c_status     TEXT CHECK (c_status IN ('on', 'off', 'del')) DEFAULT 'on',
    c_owner      INTEGER,

    FOREIGN KEY (c_owner)
        REFERENCES fbuser (u_id)
);


-- ============================================================
-- 4. TABELA DE CONTATOS
-- ============================================================

CREATE TABLE contact (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    name       TEXT,
    email      TEXT,
    subject    TEXT,
    message    TEXT,
    status     TEXT CHECK (
        status IN ('recebido', 'lido', 'respondido', 'apagado')
    ) DEFAULT 'recebido'
);


-- ============================================================
-- 5. USUÁRIOS PARA TESTES
-- ============================================================

INSERT INTO fbuser (
    u_uid,
    u_email,
    u_name,
    u_photo
)
VALUES
(
    'qwertyuiop',
    'joca@silva.com',
    'Joca da Silva',
    'https://randomuser.me/api/portraits/lego/4.jpg'
),
(
    'asdfghjkl',
    'mairneuza@siri.com',
    'Marineuza Siriliano',
    'https://randomuser.me/api/portraits/lego/1.jpg'
);


-- ============================================================
-- 6. CONTEÚDOS PARA TESTES
-- ============================================================

INSERT INTO content (
    c_title,
    c_text,
    c_owner
)
VALUES
(
    'Como fazer pipoca na praia',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos magnam nihil ducimus quas! Dolores deserunt omnis.',
    1
),
(
    'Comprando online no buteko do Seu Zé',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos magnam nihil ducimus quas! Dolores deserunt omnis.',
    2
),
(
    'Realizando desejos da máquina',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos magnam nihil ducimus quas! Dolores deserunt omnis.',
    2
),
(
    'Como deixar sua área de trabalho livre',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos magnam nihil ducimus quas! Dolores deserunt omnis.',
    1
),
(
    'Acertando pombos com seringuinha',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos magnam nihil ducimus quas! Dolores deserunt omnis.',
    1
),
(
    'Receita de pizza com bombom',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos magnam nihil ducimus quas! Dolores deserunt omnis.',
    2
);