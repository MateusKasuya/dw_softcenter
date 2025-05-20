from utils.schema import Schema
from utils.table import Table

from utils.writer import DBTFileWriter

from querys.intermediate.frctrc_joined import create_frctrc_joined_sql
from querys.intermediate.frctrc_joined_models import create_frctrc_joined_models


def frctrc_joined(schema: Schema):
    table = Table.FRCTRC

    sql_content = create_frctrc_joined_sql(schema)
    yml_content = create_frctrc_joined_models(schema)

    writer = DBTFileWriter(schema.value, table.value, sql_content, yml_content)
    writer.create_int_dbt_model_sql()
    writer.create_int_dbt_model_yml()
