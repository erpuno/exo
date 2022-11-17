-ifndef(ACCOUNT_HRL).
-define(ACCOUNT_HRL, "account_hrl").

-record(account, {id = kvs:seq([],[]), next = [], prev = [],
        origin = [],
        type = internet,
        iban = [],
        program = [],
        edrpou = [],
        client = [],
        name = [],
        amount = 0,
        transactions = "/exo/:bank/:client/tx/:id",
        state = open,
        date = {2015,1,1},
        terminationDate = {2015,1,1}
       }).

-endif.
