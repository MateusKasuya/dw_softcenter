def create_tbfil_models(schema: str):
    query = f"""
version: 2  # Versão do esquema de metadados

models:
  - name: stg_{schema}__tbfil # Nome do modelo
    description: "View Staging da TBFIL"  # Descrição do modelo
    columns:
          - name: codfil
            description: Código Filial - Primary Key
            tests:
              - unique
              - not_null

          - name: nome
            description: Nome Filial
            tests:
              - not_null



"""
    return query
