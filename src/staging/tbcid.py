from src.utils.schema import Schema
from src.utils.table import Table

from src.utils.writer import DBTFileWriter

from querys.staging.tbcid import create_tbcid_sql
from querys.staging.tbcid_models import create_tbcid_models


def tbcid(schema: Schema):
    table = Table.TBCID

    sql_content = create_tbcid_sql(schema)
    yml_content = create_tbcid_models(schema)

    writer = DBTFileWriter(schema.value, table.value, sql_content, yml_content)
    writer.create_stg_dbt_model_sql()
    writer.create_stg_dbt_model_yml()
