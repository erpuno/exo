-ifndef(PROGRAM_HRL).
-define(PROGRAM_HRL, "account_hrl").

-record(program, {id = [],next = [],prev = [],
        name = [],
        type = telecom,
        formula = [],
        date = [],
        etc = []
       }).

-endif.
