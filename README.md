# FleetPulse

**Intelligent Logistics Management & Real-Time Fleet Tracking Platform**

O FleetPulse é uma plataforma de gestão logística desenvolvida para centralizar operações de transporte, monitorar frotas em tempo real, acompanhar entregas e identificar ocorrências operacionais.

O projeto tem como objetivo construir uma solução baseada em arquitetura distribuída, processamento assíncrono e comunicação em tempo real, simulando desafios encontrados em operações logísticas empresariais.

> **Status:** Em desenvolvimento — fase de planejamento e definição da arquitetura.

---

## Objetivo do projeto

Desenvolver uma plataforma capaz de gerenciar operações logísticas de ponta a ponta, oferecendo visibilidade sobre veículos, motoristas, entregas e ocorrências.

O sistema busca resolver problemas como:

- Falta de visibilidade sobre a localização da frota.
- Dificuldade no acompanhamento de entregas.
- Identificação tardia de atrasos e problemas operacionais.
- Falta de centralização das informações logísticas.
- Dificuldade na análise de desempenho da operação.

## Funcionalidades planejadas

### 1. Autenticação e gestão organizacional
- Autenticação utilizando JWT.
- Controle de acesso baseado em permissões.
- Gestão de usuários e perfis.
- Suporte a múltiplas empresas (Multi-Tenant).
- Gestão de unidades e centros de distribuição.

### 2. Gestão de frota
- Cadastro e gerenciamento de veículos.
- Cadastro e gerenciamento de motoristas.
- Associação entre veículos e motoristas.
- Controle de disponibilidade da frota.
- Histórico operacional.

### 3. Gestão de entregas
- Cadastro e acompanhamento de entregas.
- Planejamento de viagens.
- Associação de entregas a veículos e motoristas.
- Controle do ciclo de vida das entregas.
- Gerenciamento de prazos e prioridades.

### 4. Rastreamento em tempo real
- Simulação de dispositivos GPS.
- Processamento de dados de telemetria.
- Rastreamento geográfico de veículos.
- Visualização da frota em mapa.
- Atualizações em tempo real via WebSocket.

### 5. Central de ocorrências
- Identificação de veículos parados.
- Detecção de desvios de rota.
- Identificação de entregas atrasadas.
- Monitoramento de geofences.
- Gerenciamento e histórico de ocorrências.
- Processamento assíncrono de notificações.

### 6. Dashboard e indicadores
- Visão geral da operação.
- Indicadores de desempenho logístico.
- Taxa de entregas no prazo.
- Tempo médio de entrega.
- Utilização da frota.
- Relatórios operacionais.

### 7. Evoluções futuras
- Previsão inteligente de chegada (ETA).
- Otimização de rotas.
- Gestão preventiva de manutenção.
- Integrações com sistemas externos.
- Aplicativo para motoristas.
- Detecção de anomalias operacionais.

---

## Stack tecnológica

As tecnologias abaixo representam a stack planejada para o desenvolvimento.

### Backend
- Java 21
- Spring Boot
- Spring Security
- Spring Cloud Gateway
- Spring Data JPA
- Hibernate

### Frontend
- React
- TypeScript
- Vite
- Tailwind CSS
- TanStack Query
- Zustand
- React Router

### Banco de dados e mensageria
- PostgreSQL
- PostGIS
- Apache Kafka
- RabbitMQ
- Redis

### Comunicação e infraestrutura
- REST API
- WebSocket
- Docker
- Kubernetes (evolução futura)

### Observabilidade e qualidade
- JUnit 5
- Mockito
- Testcontainers
- Vitest
- React Testing Library
- Playwright
- Prometheus
- Grafana
- OpenTelemetry

---

## Arquitetura planejada

O FleetPulse será desenvolvido utilizando uma arquitetura baseada em serviços com responsabilidades bem definidas.

Cada serviço será responsável pelo seu próprio domínio e gerenciamento de dados, evitando dependências desnecessárias entre módulos.

### Principais domínios

| Serviço | Responsabilidade |
|---|---|
| API Gateway | Entrada e roteamento das requisições |
| Identity Service | Autenticação e autorização |
| Fleet Service | Gestão de veículos e motoristas |
| Shipment Service | Gestão de entregas e viagens |
| Tracking Service | Rastreamento e telemetria |
| Incident Service | Gerenciamento de ocorrências |
| Notification Service | Processamento de notificações |

A divisão definitiva dos serviços será validada durante a implementação. Nem todos precisam existir como microsserviços independentes desde o início.

### Comunicação entre serviços

**Apache Kafka**

Planejado para:
- Eventos de telemetria.
- Atualizações de localização.
- Eventos de domínio.
- Processamento de fluxos de eventos.

**RabbitMQ**

Planejado para:
- Processamento de tarefas assíncronas.
- Envio de notificações.
- Integrações externas.
- Filas de trabalho e tratamento de falhas.

**WebSocket**

Utilizado para disponibilizar atualizações operacionais em tempo real ao frontend.

---

## Estratégia de desenvolvimento

O projeto será desenvolvido incrementalmente, utilizando ciclos de desenvolvimento (Sprints).

| Fase | Objetivo |
|---|---|
| 01 | Planejamento, requisitos e arquitetura |
| 02 | Fundação técnica e infraestrutura |
| 03 | Autenticação e gestão organizacional |
| 04 | Gestão de frota |
| 05 | Gestão de entregas e viagens |
| 06 | Rastreamento e processamento com Kafka |
| 07 | Mapa e comunicação em tempo real |
| 08 | Ocorrências e processamento com RabbitMQ |
| 09 | Dashboard e relatórios |
| 10 | Testes, observabilidade e CI/CD |
| 11 | Otimização e funcionalidades avançadas |

---

## Princípios de engenharia

Durante o desenvolvimento, serão priorizados:

- Separação de responsabilidades.
- Código limpo e manutenível.
- Arquitetura orientada a domínios.
- Baixo acoplamento entre serviços.
- Consistência e integridade dos dados.
- Idempotência no processamento de eventos.
- Tratamento de falhas e recuperação.
- Testes automatizados.
- Logs estruturados e rastreabilidade.
- Segurança e isolamento de dados.

O objetivo não é apenas implementar funcionalidades, mas compreender e aplicar os conceitos de engenharia de software envolvidos em cada decisão técnica.

---

## Ambiente de desenvolvimento

As instruções de instalação e execução serão adicionadas conforme a estrutura dos serviços e aplicações for definida.

## Documentação

A documentação técnica será mantida ao longo do desenvolvimento, incluindo:

- Requisitos funcionais e não funcionais.
- Diagramas de arquitetura.
- Modelagem de dados.
- Documentação de APIs.
- Decisões arquiteturais (ADR).
- Estratégia de testes.
- Procedimentos de execução e deploy.

---

## Sobre o projeto

FleetPulse é um projeto de engenharia de software com foco em desenvolvimento Full Stack, sistemas distribuídos, arquitetura de microsserviços, mensageria e processamento de dados em tempo real.

**Construído com foco em engenharia, escalabilidade e confiabilidade.**