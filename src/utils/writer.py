import os


class DBTFileWriter:
    def __init__(
        self,
        schema_name: str,
        table_name: str,
        sql_content: str,
        yml_content: str,
        yml_content_source: str = None,
    ):
        self.schema_name = schema_name
        self.table_name = table_name
        self.sql_content = sql_content
        self.yml_content = yml_content
        self.yml_content_source = yml_content_source

    def create_stg_dbt_model_sql(self) -> str:
        """
        Generates a DBT model SQL file for the FRCTRC table with a dynamic source schema.
        The output file will be placed in 'dbt_softcenter/models/staging/{schema_name}/'.

        Args:
                schema_name: The name of the source schema (e.g., 'fn9', 'f98').
                table_name: The name of the table to be replicated.
                sql_content: The content of the SQL file to be written.

        Returns:
            The file path of the generated .sql file.
        """
        base_output_dir = "dbt_softcenter/models/staging"
        model_name = f"stg_{self.schema_name.lower()}__{self.table_name.lower()}.sql"
        schema_output_dir = os.path.join(base_output_dir, self.schema_name.lower())
        file_path = os.path.join(schema_output_dir, model_name)

        # Ensure the subdirectory for the schema exists
        os.makedirs(schema_output_dir, exist_ok=True)

        sql_content = self.sql_content

        with open(file_path, "w", encoding="utf-8") as f:
            f.write(sql_content)

        print(f"Generated SQL file: {file_path}")
        return file_path

    def create_stg_dbt_model_yml(self) -> str:
        """
        Generates a DBT model SQL file for the FRCTRC table with a dynamic source schema.
        The output file will be placed in 'dbt_softcenter/models/staging/{schema_name}/'.

        Args:
            schema_name: The name of the source schema (e.g., 'fn9', 'f98').
            table_name: The name of the table to be replicated.
            yml_content: The content of the yml file to be written.

        Returns:
            The file path of the generated .yml file.
        """
        base_output_dir = "dbt_softcenter/models/staging"
        model_name = (
            f"_{self.schema_name.lower()}_{self.table_name.lower()}__models.yml"
        )
        schema_output_dir = os.path.join(base_output_dir, self.schema_name.lower())
        file_path = os.path.join(schema_output_dir, model_name)

        # Ensure the subdirectory for the schema exists
        os.makedirs(schema_output_dir, exist_ok=True)

        yml_content = self.yml_content

        with open(file_path, "w", encoding="utf-8") as f:
            f.write(yml_content)

        print(f"Generated YML file: {file_path}")
        return file_path

    def create_stg_dbt_source_yml(self) -> str:
        """
        Generates a DBT model SQL file for the FRCTRC table with a dynamic source schema.
        The output file will be placed in 'dbt_softcenter/models/staging/{schema_name}/'.

        Args:
            schema_name: The name of the source schema (e.g., 'fn9', 'f98').
            yml_content: The content of the yml file to be written.

        Returns:
            The file path of the generated .yml file.
        """
        base_output_dir = "dbt_softcenter/models/staging"
        model_name = f"_{self.schema_name.lower()}__sources.yml"
        schema_output_dir = os.path.join(base_output_dir, self.schema_name.lower())
        file_path = os.path.join(schema_output_dir, model_name)

        # Ensure the subdirectory for the schema exists
        os.makedirs(schema_output_dir, exist_ok=True)

        yml_content = self.yml_content_source

        with open(file_path, "w", encoding="utf-8") as f:
            f.write(yml_content)

        print(f"Generated YML file: {file_path}")
        return file_path

    def create_int_dbt_model_sql(self) -> str:
        """
        Generates a DBT model SQL file for the FRCTRC table with a dynamic source schema.
        The output file will be placed in 'dbt_softcenter/models/intermediate/{schema_name}/'.

        Args:
                schema_name: The name of the source schema (e.g., 'fn9', 'f98').
                table_name: The name of the table to be replicated.
                sql_content: The content of the SQL file to be written.

        Returns:
            The file path of the generated .sql file.
        """
        base_output_dir = "dbt_softcenter/models/intermediate"
        model_name = (
            f"int_{self.schema_name.lower()}_{self.table_name.lower()}_joined.sql"
        )
        schema_output_dir = os.path.join(base_output_dir, self.schema_name.lower())
        file_path = os.path.join(schema_output_dir, model_name)

        # Ensure the subdirectory for the schema exists
        os.makedirs(schema_output_dir, exist_ok=True)

        sql_content = self.sql_content

        with open(file_path, "w", encoding="utf-8") as f:
            f.write(sql_content)

        print(f"Generated SQL file: {file_path}")
        return file_path

    def create_int_dbt_model_yml(self) -> str:
        """
        Generates a DBT model SQL file for the FRCTRC table with a dynamic source schema.
        The output file will be placed in 'dbt_softcenter/models/intermediate/{schema_name}/'.

        Args:
            schema_name: The name of the source schema (e.g., 'fn9', 'f98').
            table_name: The name of the table to be replicated.
            yml_content: The content of the yml file to be written.

        Returns:
            The file path of the generated .yml file.
        """
        base_output_dir = "dbt_softcenter/models/intermediate"
        model_name = (
            f"_{self.schema_name.lower()}_{self.table_name.lower()}_joined__models.yml"
        )
        schema_output_dir = os.path.join(base_output_dir, self.schema_name.lower())
        file_path = os.path.join(schema_output_dir, model_name)

        # Ensure the subdirectory for the schema exists
        os.makedirs(schema_output_dir, exist_ok=True)

        yml_content = self.yml_content

        with open(file_path, "w", encoding="utf-8") as f:
            f.write(yml_content)

        print(f"Generated YML file: {file_path}")
        return file_path
