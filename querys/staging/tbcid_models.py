def create_tbcid_models(schema: str):
    query = f"""
version: 2  # Versão do esquema de metadados

models:
  - name: stg_{schema}__tbcid # Nome do modelo
    description: "View Staging da TBCID"  # Descrição do modelo
    columns:
          - name: codcid
            description: Código Cidade - Primary Key
            tests:
              - unique
              - not_null

          - name: nome
            description: Nome Cidade
            tests:
              - not_null

          - name: coduf
            description: UF Cidade
            tests:
              - accepted_values:
                  values: [
                            'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO',
                            'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI',
                            'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO',
                            'EX', 'IN'
                          ]

          - name: cidade_uf
            description: Concatenado de Cidade e UF
            tests:
              - not_null

          - name: localizacao_pbi
            description: Campo para ser utilizado como Mapa no Power BI
            tests:
              - not_null

          - name: codibge
            description: Código IBGE

"""
    return query
