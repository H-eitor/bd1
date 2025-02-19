Repositório pare armazenamento dos roteiros utilizados na cadeira Banco de Dados I

### Acesso à VM

> $ ssh heitordsa@150.165.85.18 -p 45600

### Acesso ao PSQL

> $ psql -h localhost -d heitordsa_db -U heitordsa

### Sair do PSQL

> \q

### Gerar o dump (Exemplo do roteiro 2)

- Na VM
> $ pg_dump -h localhost heitordsa_db -c --column-inserts -t funcionario -t tarefas > roteiro2-dump-123110811.sql

- Fora da VM
> $ scp -P 45600 heitordsa@150.165.85.18:/home/heitordsa/roteiro2-dump-123110811.sql .

### Alterar o search_path para company

> SET search_path TO company,public;