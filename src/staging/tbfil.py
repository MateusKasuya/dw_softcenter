from src.utils.schema import Schema
from src.utils.table import Table

from src.utils.writer import DBTFileWriter

from querys.staging.tbfil import create_tbfil_sql
from querys.staging.tbfil_models import create_tbfil_models


def tbfil(schema: Schema):
    table = Table.TBFIL

    sql_content = create_tbfil_sql(schema)
    yml_content = create_tbfil_models(schema)

    writer = DBTFileWriter(schema.value, table.value, sql_content, yml_content)
    writer.create_stg_dbt_model_sql()
    writer.create_stg_dbt_model_yml()
