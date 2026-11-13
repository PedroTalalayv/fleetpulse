# Identity Service

Serviço de identidade do FleetPulse. Nesta etapa, contém a estrutura inicial do projeto Spring Boot, a conexão com o PostgreSQL e um health check.

## Pré-requisitos

- JDK 21, com o `JAVA_HOME` apontando para ele.
- Docker, para executar o PostgreSQL local.

Não é preciso instalar o Maven: o Maven Wrapper (`mvnw`) baixa a versão correta na primeira execução. O build falha de propósito se o JDK em uso não for o 21.

## Banco de dados

O serviço usa o database compartilhado `fleetpulse_db`, mas acessa somente o schema `identity`, com o usuário próprio `identity_service`. O schema, o usuário e as permissões são criados pelo script `infra/postgres/init/01-identity.sh` na primeira vez que o PostgreSQL sobe.

### 1. Criar os arquivos `.env`

Os dois arquivos são ignorados pelo Git. Copie os modelos e troque os valores `change-me`:

| Modelo | Copiar para | Lido por |
|---|---|---|
| `.env.example` (raiz do repositório) | `.env` | Docker Compose |
| `identity-service/.env.example` | `identity-service/.env` | identity-service |

O valor de `IDENTITY_DB_PASSWORD` precisa ser o mesmo nos dois arquivos.

### 2. Subir o PostgreSQL

Na raiz do repositório:

```bash
docker compose up -d
docker compose ps
```

Aguarde o status `healthy`.

> **Atenção:** as senhas definidas no `.env` só são aplicadas na primeira criação do volume. Se você trocar alguma senha depois, recrie o banco com `docker compose down -v` (isso apaga todos os dados) e suba de novo.

## Gerar o pacote

Execute os comandos a partir da pasta `identity-service`.

PowerShell:

```powershell
.\mvnw.cmd clean package
```

Git Bash, Linux ou macOS:

```bash
./mvnw clean package
```

## Executar

Execute a partir da pasta `identity-service`, porque a aplicação procura o arquivo `.env` na pasta atual.

Com o Maven:

```bash
./mvnw spring-boot:run
```

Ou com o JAR gerado. O comando `java` usa o JDK do `PATH`, que pode não ser o mesmo do `JAVA_HOME`, por isso os comandos abaixo chamam o Java do `JAVA_HOME` diretamente.

PowerShell:

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\identity-service-0.1.0-SNAPSHOT.jar
```

Git Bash, Linux ou macOS:

```bash
"$JAVA_HOME/bin/java" -jar target/identity-service-0.1.0-SNAPSHOT.jar
```

A aplicação sobe na porta 8080. Na inicialização, o Flyway aplica as migrations de `src/main/resources/db/migration` no schema `identity`.

## Verificar

```bash
curl http://localhost:8080/actuator/health
```

Resposta esperada:

```json
{"groups":["liveness","readiness"],"status":"UP"}
```
