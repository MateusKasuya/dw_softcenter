def create_tbfor_models(schema: str):
    query = f"""
version: 2  # Versão do esquema de metadados

models:
  - name: stg_{schema}__tbfor # Nome do modelo
    description: "View Staging da TBFOR"  # Descrição do modelo
    columns:
          - name: cgccpfforne
            description: Código Fornecedor - Primary Key
            tests:
              - unique
              - not_null

          - name: nomefantasia
            description: Nome Fantasia Fornecedor
              - not_null

"""
    return query
