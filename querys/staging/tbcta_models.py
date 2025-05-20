def create_tbcta_models(schema: str):
    query = f"""
version: 2  # Versão do esquema de metadados

models:
  - name: stg_{schema}__tbcta # Nome do modelo
    description: "View Staging da TBCTA"  # Descrição do modelo
    columns:
          - name: contareduz
            description: Código Conta Reduzida - Primary Key
            tests:
              - unique
              - not_null

          - name: nomeconta
            description: Nome Conta
            tests:
              - not_null



"""
    return query
