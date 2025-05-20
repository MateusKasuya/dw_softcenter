from src.utils.schema import Schema
from src.utils.table import Table

from src.utils.writer import DBTFileWriter

from querys.staging.tbpro import create_tbpro_sql
from querys.staging.tbpro_models import create_tbpro_models


def tbpro(schema: Schema):
    table = Table.TBPRO

    sql_content = create_tbpro_sql(schema)
    yml_content = create_tbpro_models(schema)

    writer = DBTFileWriter(schema.value, table.value, sql_content, yml_content)
    writer.create_stg_dbt_model_sql()
    writer.create_stg_dbt_model_yml()
