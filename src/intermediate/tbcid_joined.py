from utils.schema import Schema
from utils.table import Table

from utils.writer import DBTFileWriter

from querys.intermediate.tbcid_joined import create_tbcid_joined_sql
from querys.intermediate.tbcid_joined_models import create_tbcid_joined_models


def tbcid_joined(schema: Schema):
    table = Table.TBCID

    sql_content = create_tbcid_joined_sql(schema)
    yml_content = create_tbcid_joined_models(schema)

    writer = DBTFileWriter(schema.value, table.value, sql_content, yml_content)
    writer.create_int_dbt_model_sql()
    writer.create_int_dbt_model_yml()
