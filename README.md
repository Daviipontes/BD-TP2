# Projeto de Banco de Dados - Sistema de Gestão Acadêmica

Este projeto implementa um banco de dados para um sistema de gestão acadêmica simples, utilizando PostgreSQL e Python com a biblioteca `psycopg`. O sistema gerencia cursos, alunos, professores, disciplinas e turmas, além de controlar as matrículas dos alunos.

## Modelo do Banco de Dados

O banco de dados é composto por 6 tabelas principais que se relacionam para formar o sistema acadêmico.

### Tabelas

1.  **Curso**: Armazena informações sobre os cursos oferecidos.
    * `id`: SERIAL (Chave Primária)
    * `nome`: VARCHAR(100)
    * `regime`: VARCHAR(20)
    * `duracao`: INT

2.  **Aluno**: Armazena os dados dos alunos matriculados.
    * `id`: SERIAL (Chave Primária)
    * `nome`: VARCHAR(100)
    * `curso_id`: INT (Chave Estrangeira para `Curso`)
    * `semestre`: INT

3.  **Professor**: Contém informações sobre os professores.
    * `id`: SERIAL (Chave Primária)
    * `nome`: VARCHAR(100)
    * `area_especializacao`: VARCHAR(100)
    * `contato`: VARCHAR(100)
    * `curso_id`: INT (Chave Estrangeira para `Curso`)

4.  **Disciplina**: Descreve as disciplinas de cada curso.
    * `id`: SERIAL (Chave Primária)
    * `codigo`: VARCHAR(100) (Único)
    * `nome`: VARCHAR(100)
    * `area_especializacao`: VARCHAR(100)
    * `carga_horaria`: INT
    * `curso_id`: INT (Chave Estrangeira para `Curso`)

5.  **Turma**: Organiza as turmas para cada disciplina em um semestre.
    * `id`: SERIAL (Chave Primária)
    * `codigo`: VARCHAR(10) (Único)
    * `disciplina_id`: INT (Chave Estrangeira para `Disciplina`)
    * `semestre`: VARCHAR(20)
    * `capacidade_maxima`: INT
    * `estado`: VARCHAR(20)
    * `prof_id`: INT (Chave Estrangeira para `Professor`)

6.  **Aluno_Turma**: Tabela de associação que representa a matrícula de um aluno em uma turma.
    * `aluno_id`: INT (Chave Estrangeira para `Aluno`)
    * `turma_id`: INT (Chave Estrangeira para `Turma`)

## Funcionalidades Implementadas

O projeto inclui scripts em Python para realizar as seguintes operações no banco de dados:

1.  **Criação das Tabelas**: Um script SQL define e cria toda a estrutura de tabelas, chaves e relacionamentos.
2.  **Inserção de Dados**: Dados de exemplo são inseridos em todas as tabelas para popular o banco e permitir testes.
3.  **Stored Procedure (`inc_semestre`)**: Uma procedure que incrementa o semestre de um aluno específico.
4.  **Triggers de Matrícula**:
    * Um trigger que impede a matrícula de um aluno em uma turma que já atingiu sua capacidade máxima.
    * Um trigger que impede que um aluno se matricule mais de 5 vezes no mesmo semestre.

## Tecnologias Utilizadas

* **Banco de Dados**: PostgreSQL
* **Linguagem de Script**: Python 3
* **Driver do Banco**: `psycopg`

## Como Executar

### Pré-requisitos

* Ter um servidor PostgreSQL ativo e acessível.
* Ter o Python 3 instalado.
* Instalar a biblioteca `psycopg`:
    ```bash
    pip install psycopg
    ```

### Configuração

Nos scripts Python, altere os dados da conexão com o banco de dados conforme necessário:

```python
# Exemplo de conexão
psycopg.connect(
    host="SEU_HOST",
    dbname="SEU_DB_NAME",
    user="SEU_USUARIO",
    password="SUA_SENHA"
)
```

### Execução dos Scripts

Execute os arquivos Python na seguinte ordem para garantir o funcionamento correto:

1.  **Script de Criação de Tabelas**: Para criar a estrutura do banco de dados.
2.  **Script de Inserção de Dados**: Para popular o banco com dados de exemplo.
3.  **Scripts de Teste**: Para verificar o funcionamento da *Stored Procedure* e dos *Triggers*.
