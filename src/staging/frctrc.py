from src.utils.schema import Schema
from src.utils.table import Table

from src.utils.writer import DBTFileWriter

from querys.staging.frctrc import create_frctrc_sql
from querys.staging.frctrc_models import create_frctrc_models


def frctrc(schema: Schema):
    table = Table.FRCTRC

    sql_content = create_frctrc_sql(schema)
    yml_content = create_frctrc_models(schema)

    writer = DBTFileWriter(schema.value, table.value, sql_content, yml_content)
    writer.create_stg_dbt_model_sql()
    writer.create_stg_dbt_model_yml()
