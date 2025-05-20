from utils.schema import Schema
from utils.table import Table

from utils.writer import DBTFileWriter

from querys.staging.cptit import create_cptit_sql
from querys.staging.cptit_models import create_cptit_models


def cptit(schema: Schema):
    table = Table.CPTIT

    sql_content = create_cptit_sql(schema)
    yml_content = create_cptit_models(schema)

    writer = DBTFileWriter(schema.value, table.value, sql_content, yml_content)
    writer.create_stg_dbt_model_sql()
    writer.create_stg_dbt_model_yml()
