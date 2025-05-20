from src.utils.schema import Schema
from src.utils.table import Table

from src.utils.writer import DBTFileWriter

from querys.staging.tbhis import create_tbhis_sql
from querys.staging.tbhis_models import create_tbhis_models


def tbhis(schema: Schema):
    table = Table.TBHIS

    sql_content = create_tbhis_sql(schema)
    yml_content = create_tbhis_models(schema)

    writer = DBTFileWriter(schema.value, table.value, sql_content, yml_content)
    writer.create_stg_dbt_model_sql()
    writer.create_stg_dbt_model_yml()
