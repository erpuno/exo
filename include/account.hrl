-ifndef(ACCOUNT_HRL).
-define(ACCOUNT_HRL, "account_hrl").

-record(account, {id,next,prev,
        origin,
        type, % oil | gas | internet
        iban,
        program = [],
        client,
        name,
        amount=0,
        transactions = "/exo/:bank/:client/tx/:id",
        state = open,
        startDate={2015,1,1},
        terminationDate={2015,1,1}
       }).

-endif.
