from src.utils.schema import Schema
from src.utils.table import Table

from src.utils.writer import DBTFileWriter

from querys.staging.tbfor import create_tbfor_sql
from querys.staging.tbfor_models import create_tbfor_models


def tbfor(schema: Schema):
    table = Table.TBFOR

    sql_content = create_tbfor_sql(schema)
    yml_content = create_tbfor_models(schema)

    writer = DBTFileWriter(schema.value, table.value, sql_content, yml_content)
    writer.create_stg_dbt_model_sql()
    writer.create_stg_dbt_model_yml()
