-ifndef(CLIENT_HRL).
-define(CLIENT_HRL, "client_hrl").

-record(client, {
        id = kvs:seq([],[]),
        next = [],prev = [],
        bank = [],
        iban = [],
        local = [],
        type = consumer,
        status = online,
        program = [],
        amount = [],
        default_account,
        accounts = "/exo/:bank/:id/accounts",
        default_card = [],
        cards = "/exo/:bank/:id/cards",
        phone = <<>>,
        tax = [],
        names = <<>>,
        surnames = <<>>,
        date = [],
        display_name = [],
        registration = [] }).

-endif.
