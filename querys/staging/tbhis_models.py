def create_tbhis_models(schema: str):
    query = f"""
version: 2  # Versão do esquema de metadados

models:
  - name: stg_{schema}__tbhis # Nome do modelo
    description: "View Staging da TBHIS"  # Descrição do modelo
    columns:
          - name: codtransacao
            description: Código Transação - Primary Key
            tests:
              - unique
              - not_null

          - name: descricao
            description: Descrição Transação
            tests:
              - not_null
"""
    return query
