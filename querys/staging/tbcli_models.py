def create_tbcli_models(schema: str):
    query = f"""
version: 2  # Versão do esquema de metadados

models:
  - name: stg_{schema}__tbcli # Nome do modelo
    description: "View Staging da TBCLI"  # Descrição do modelo
    columns:
          - name: cgccpfcli
            description: CPF/CNPJ Cliente - Primary Key
            tests:
              - unique
              - not_null

          - name: nomefantasia
            description: Nome Fantasia Cliente
            tests:
              - not_null


"""
    return query
