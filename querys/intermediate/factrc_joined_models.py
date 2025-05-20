def create_factrc_joined_models(schema: str):
    query = f"""
version: 2  # Versão do esquema de metadados

models:
  - name: int_{schema}_factrc_joined # Nome do modelo
    description: "View Intermediate da FACTRC self joined"  # Descrição do modelo
    columns:

          - name: id
            description: Id da Fatura - Primary Key - nro + ano fatura

          - name: datavencto
            description: Data Vencimento da Fatura

          - name: datarecbto
            description: Data de recebimento da fatura

          - name: vlrfatura
            description: Valor da fatura

          - name: vlrrecbto
            description: Valor de recebimento da fatura total

          - name: vlrsaldo
            description: Valor de saldo da fatura total

"""
    return query
