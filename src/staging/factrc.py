from src.utils.schema import Schema
from src.utils.table import Table

from src.utils.writer import DBTFileWriter

from querys.staging.factrc import create_factrc_sql
from querys.staging.factrc_models import create_factrc_models


def factrc(schema: Schema):
    table = Table.FACTRC

    sql_content = create_factrc_sql(schema)
    yml_content = create_factrc_models(schema)

    writer = DBTFileWriter(schema.value, table.value, sql_content, yml_content)
    writer.create_stg_dbt_model_sql()
    writer.create_stg_dbt_model_yml()
