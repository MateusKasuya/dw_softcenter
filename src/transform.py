import os
import sys

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from src.request_ibge import get_municipios_from_ibge

import pandas as pd


def json_to_csv():
    municipios = get_municipios_from_ibge()

    df = pd.DataFrame(municipios)

    for col in df.columns:
        if df[col].apply(lambda x: isinstance(x, dict)).any():
            df_normalized = pd.json_normalize(df[col])
            df_normalized.columns = [
                f"{col}_{subcol}" for subcol in df_normalized.columns
            ]
            df = df.drop(columns=[col]).join(df_normalized)

    df.to_csv("dbt_softcenter/seeds/ibge_municipios.csv", index=False)


if __name__ == "__main__":
    json_to_csv()
