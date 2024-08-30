--Criando Roles (Papéis)
--Role para Administradores
CREATE ROLE ghostbusters_admin WITH LOGIN CREATEDB CREATEROLE SUPERUSER;
--Role para Jogadores
CREATE ROLE ghostbusters_player WITH LOGIN NOSUPERUSER;

--Criando Users (Usuários) no Ghostbusters
--Usuário Administrador
CREATE USER admin_ghostbusters WITH PASSWORD 'adminpassword';
GRANT ghostbusters_admin TO admin_ghostbusters;
--Usuário Jogador
CREATE USER player_ghostbusters WITH PASSWORD 'playerpassword';
GRANT ghostbusters_player TO player_ghostbusters;
--Usuário Específico para Desenvolvimento
CREATE USER dev_ghostbusters WITH PASSWORD 'devpassword';
GRANT ghostbusters_developer TO dev_ghostbusters;
--Usuário para Auditoria
CREATE USER audit_ghostbusters WITH PASSWORD 'auditpassword';
GRANT ghostbusters_audit TO audit_ghostbusters;
--Usuário Convidado (Acesso Temporário ou Limitado)
CREATE USER guest_ghostbusters WITH PASSWORD 'guestpassword';
GRANT ghostbusters_guest TO guest_ghostbusters;

--Definindo Permissões Específicas para Roles
--Permitir ao ghostbusters_player acessar apenas tabelas de leitura:
GRANT SELECT ON ALL TABLES IN SCHEMA public TO ghostbusters_player;
--Permitir ao ghostbusters_admin acessar todas as tabelas com permissões completas:
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ghostbusters_admin;
--Revogando Permissões
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM ghostbusters_player;
