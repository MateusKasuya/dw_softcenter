def create_factrc_models(schema: str):
    query = f"""
version: 2  # Versão do esquema de metadados

models:
  - name: stg_{schema}__factrc # Nome do modelo
    description: "View Staging da FACTRC"  # Descrição do modelo
    columns:

          - name: nrofatura
            description: Número da Fatura - Primary Key Composta
            tests:
              - not_null

          - name: anofatura
            description: Ano da Fatura - Primary Key Composta
            tests:
              - not_null

          - name: id
            description: Id da Fatura - Primary Key - nro + ano fatura
            tests:
              - unique
              - not_null

          - name: id_integra
            description: Id de Fatura de Parcelamento - Self Join Key - nro + ano integra

          - name: datavencto
            description: Data Vencimento da Fatura

          - name: datarecbto
            description: Data de recebimento da fatura

          - name: vlrfatura
            description: Valor da fatura

          - name: vlrrecbto
            description: Valor de recebimento da fatura

          - name: vlrsaldo
            description: Valor de saldo da fatura


"""
    return query
