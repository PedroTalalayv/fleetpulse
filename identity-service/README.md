# Identity Service

Serviço de identidade do FleetPulse. Nesta etapa, contém apenas a estrutura inicial do projeto Spring Boot e um health check.

## Pré-requisitos

- JDK 21, com o `JAVA_HOME` apontando para ele.

Não é preciso instalar o Maven: o Maven Wrapper (`mvnw`) baixa a versão correta na primeira execução. O build falha de propósito se o JDK em uso não for o 21.

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

O comando `java` usa o JDK do `PATH`, que pode não ser o mesmo do `JAVA_HOME`. Por isso, os comandos abaixo chamam o Java do `JAVA_HOME` diretamente.

PowerShell:

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\identity-service-0.1.0-SNAPSHOT.jar
```

Git Bash, Linux ou macOS:

```bash
"$JAVA_HOME/bin/java" -jar target/identity-service-0.1.0-SNAPSHOT.jar
```

A aplicação sobe na porta 8080.

## Verificar

```bash
curl http://localhost:8080/actuator/health
```

Resposta esperada:

```json
{"groups":["liveness","readiness"],"status":"UP"}
```
