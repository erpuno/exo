-ifndef(PROGRAM_HRL).
-define(PROGRAM_HRL, "account_hrl").

-record(program, {id = [],next = [],prev = [],
        name = [],
        type = telecom,
        formula = [],
        date = {{2022,11,19},{1,1,1}},
        etc = []
       }).

-endif.
