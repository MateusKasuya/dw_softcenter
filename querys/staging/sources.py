def create_sources_yml(schema: str):
    query = f"""
version: 2

sources:
  - name: {schema}
    description: "Essa é uma réplica do banco Firebird usado no Frete Fácil"
    database: postgres
    schema: {schema}
    tables:
      - name: "FRCTRC"
        description: Movimento de CTRC's

      - name: "TBCID"
        description: Cadastro de Localidades/Cidades

      - name: "TBCLI"
        description: Cadastro de Clientes

      - name: "TBFIL"
        description: Cadastro de Filiais

      - name: "FACTRC"
        description: Movimento de Faturas

      - name: "CPTIT"
        description: Movimento de Contas a Pagar

      - name: "TBHIS"
        description: Cadastro de Históricos

      - name: "TBFOR"
        description: Cadastro de Fornecedores

      - name: "TBPRO"
        description: Cadastro de Produtos Transportados

"""
    return query
