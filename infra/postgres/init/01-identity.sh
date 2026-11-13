#!/bin/sh
# Provisiona o schema e o usuário do identity-service no database compartilhado.
#
# A imagem oficial do PostgreSQL executa este script, como administrador, somente
# na primeira inicialização do volume. O script é idempotente e pode ser executado
# de novo manualmente:
#   docker compose exec postgres sh /docker-entrypoint-initdb.d/01-identity.sh
#
# A imagem pode carregar o script com "source" em vez de executá-lo, por isso ele
# não altera opções do shell (set -e, set -u).

: "${POSTGRES_USER:?POSTGRES_USER não definida}"
: "${POSTGRES_DB:?POSTGRES_DB não definida}"
: "${IDENTITY_DB_PASSWORD:?IDENTITY_DB_PASSWORD não definida}"

# A senha entra como variável do psql (:'identity_password'), que cuida das aspas.
psql -v ON_ERROR_STOP=1 \
     --username "$POSTGRES_USER" \
     --dbname "$POSTGRES_DB" \
     --set identity_password="$IDENTITY_DB_PASSWORD" \
     --set admin_role="$POSTGRES_USER" \
     --set db_name="$POSTGRES_DB" <<'SQL'
-- Usuário do serviço: apenas login, sem poderes administrativos.
SELECT 'CREATE ROLE identity_service LOGIN'
WHERE NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'identity_service')
\gexec

ALTER ROLE identity_service
    WITH LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE NOREPLICATION
    PASSWORD :'identity_password';

-- Databases: ninguém conecta por padrão; cada serviço recebe CONNECT explicitamente.
-- postgres e template1 são databases de manutenção que, por padrão, aceitam qualquer usuário.
REVOKE ALL ON DATABASE :"db_name" FROM PUBLIC;
REVOKE CONNECT ON DATABASE postgres FROM PUBLIC;
REVOKE CONNECT ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE :"db_name" TO identity_service;

-- Schema public: bloqueado para todos, para que nenhum serviço o use por engano.
REVOKE ALL ON SCHEMA public FROM PUBLIC;

-- Schema identity: pertence ao administrador; o serviço pode usá-lo e criar objetos nele.
CREATE SCHEMA IF NOT EXISTS identity AUTHORIZATION :"admin_role";
GRANT USAGE, CREATE ON SCHEMA identity TO identity_service;

-- SQL sem schema qualificado usa identity.
ALTER ROLE identity_service SET search_path = identity;
SQL
