from src.utils.schema import Schema

from src.utils.writer import DBTFileWriter

from querys.staging.sources import create_sources_yml


def source(schema: Schema):
    source_yml_content = create_sources_yml(schema)

    writer = DBTFileWriter(
        schema_name=schema.value,
        table_name="",
        sql_content="",
        yml_content="",
        yml_content_source=source_yml_content,
    )

    writer.create_stg_dbt_source_yml()
