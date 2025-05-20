def create_tbpro_models(schema: str):
    query = f"""
version: 2  # Versão do esquema de metadados

models:
  - name: stg_{schema}__tbpro # Nome do modelo
    description: "View Staging da TBPRO"  # Descrição do modelo
    columns:
          - name: codpro
            description: Código Produto - Primary Key
            tests:
              - unique
              - not_null

          - name: nome
            description: Nome Produto
            tests:
              - not_null

"""
    return query
