-ifndef(PHONE_HRL).
-define(PHONE_HRL, "phone_hrl").

-record(phone, {id,
    number = "380676631870",
    auth = [] % [{number,"3804546546"},{password,"SomePassword"}]
}).

-endif.
