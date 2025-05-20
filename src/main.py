import os
import sys

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from utils.schema import Schema

from staging.cptit import cptit
from staging.factrc import factrc
from staging.frctrc import frctrc
from staging.tbcid import tbcid
from staging.tbcli import tbcli
from staging.tbfil import tbfil
from staging.tbfor import tbfor
from staging.tbhis import tbhis
from staging.tbpro import tbpro
from staging.source import source

from intermediate.cptit_joined import cptit_joined
from intermediate.factrc_joined import factrc_joined
from intermediate.frctrc_joined import frctrc_joined
from intermediate.tbcid_joined import tbcid_joined

if __name__ == "__main__":
    list_schemas = [Schema.RCR]

    for schema in list_schemas:
        print(f"Starting {schema.value} processing...")
        cptit(schema)
        print(f"Finished {schema.value} processing.")
        print(f"Starting {schema.value} factrc processing...")
        factrc(schema)
        print(f"Finished {schema.value} factrc processing.")
        print(f"Starting {schema.value} frctrc processing...")
        frctrc(schema)
        print(f"Finished {schema.value} frctrc processing.")
        print(f"Starting {schema.value} tbcid processing...")
        tbcid(schema)
        print(f"Finished {schema.value} tbcid processing.")
        print(f"Starting {schema.value} tbcli processing...")
        tbcli(schema)
        print(f"Finished {schema.value} tbcli processing.")
        print(f"Starting {schema.value} tbfil processing...")
        tbfil(schema)
        print(f"Finished {schema.value} tbfil processing.")
        print(f"Starting {schema.value} tbfor processing...")
        tbfor(schema)
        print(f"Finished {schema.value} tbfor processing.")
        print(f"Starting {schema.value} tbhis processing...")
        tbhis(schema)
        print(f"Finished {schema.value} tbhis processing.")
        print(f"Starting {schema.value} tbpro processing...")
        tbpro(schema)
        print(f"Finished {schema.value} tbpro processing.")
        print(f"Starting {schema.value} source processing...")
        source(schema)
        print(f"Finished {schema.value} source processing.")
        print(f"Starting {schema.value} cptit_joined processing...")
        cptit_joined(schema)
        print(f"Finished {schema.value} cptit_joined processing.")
        print(f"Starting {schema.value} factrc_joined processing...")
        factrc_joined(schema)
        print(f"Finished {schema.value} factrc_joined processing.")
        print(f"Starting {schema.value} frctrc_joined processing...")
        frctrc_joined(schema)
        print(f"Finished {schema.value} frctrc_joined processing.")
        print(f"Starting {schema.value} tbcid_joined processing...")
        tbcid_joined(schema)
        print(f"Finished {schema.value} tbcid_joined processing.")
