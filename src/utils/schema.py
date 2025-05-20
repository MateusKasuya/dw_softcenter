from enum import Enum


class Schema(Enum):
    FN9 = "fn9"
    MGP = "mgp"
    RCR = "rcr"

    def __str__(self):
        return "%s" % self.value
