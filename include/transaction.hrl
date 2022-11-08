-ifndef(TRANSACTION_HRL).
-define(TRANSACTION_HRL, "transaction_hrl").

-record(transaction, {
        id,next,prev,
        timestamp,
        beneficiary, % bank/client
        subsidiary,  % bank/client
        amount,
        tax,
        ballance,
        currency,
        description,
        info,
        prevdate,
        rate,
        item
        }).

-record(item, {
        timestamp,
        move_type, % debit | credit
        day,
        amount
}).

-endif.
