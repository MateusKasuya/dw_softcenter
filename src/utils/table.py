from enum import Enum


class Table(Enum):
    FRCTRC = "FRCTRC"
    CPTIT = "CPTIT"
    FACTRC = "FACTRC"
    TBCID = "TBCID"
    TBCLI = "TBCLI"
    TBFIL = "TBFIL"
    TBFOR = "TBFOR"
    TBHIS = "TBHIS"
    TBPRO = "TBPRO"

    def __str__(self):
        return "%s" % self.value
