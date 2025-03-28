import requests


def get_municipios_from_ibge():
    """
    Consulta a API do IBGE para obter a lista de municípios do Brasil.

    Returns:
        list: Uma lista de dicionários com os dados dos municípios.
    """
    url = "https://servicodados.ibge.gov.br/api/v1/localidades/municipios"

    try:
        response = requests.get(url)
        response.raise_for_status()  # Lança erro se o status for 4xx ou 5xx
        municipios = response.json()
        # print(municipios)
        return municipios

    except requests.exceptions.HTTPError as http_err:
        print(f"Erro HTTP: {http_err}")
    except requests.exceptions.RequestException as req_err:
        print(f"Erro de requisição: {req_err}")
    except Exception as err:
        print(f"Erro inesperado: {err}")

    return []


if __name__ == "__main__":
    get_municipios_from_ibge()
