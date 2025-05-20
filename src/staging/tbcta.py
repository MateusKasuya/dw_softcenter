from src.utils.schema import Schema
from src.utils.table import Table

from src.utils.writer import DBTFileWriter

from querys.staging.tbcta import create_tbcta_sql
from querys.staging.tbcta_models import create_tbcta_models


def tbcta(schema: Schema):
    table = Table.TBCTA

    sql_content = create_tbcta_sql(schema)
    yml_content = create_tbcta_models(schema)

    writer = DBTFileWriter(schema.value, table.value, sql_content, yml_content)
    writer.create_stg_dbt_model_sql()
    writer.create_stg_dbt_model_yml()
