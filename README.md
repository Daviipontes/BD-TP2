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
    * `id`: SERIAL (Ch
