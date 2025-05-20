from src.utils.schema import Schema
from src.utils.table import Table

from src.utils.writer import DBTFileWriter

from querys.staging.tbcli import create_tbcli_sql
from querys.staging.tbcli_models import create_tbcli_models


def tbcli(schema: Schema):
    table = Table.TBCLI

    sql_content = create_tbcli_sql(schema)
    yml_content = create_tbcli_models(schema)

    writer = DBTFileWriter(schema.value, table.value, sql_content, yml_content)
    writer.create_stg_dbt_model_sql()
    writer.create_stg_dbt_model_yml()
