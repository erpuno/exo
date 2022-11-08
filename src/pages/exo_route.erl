-module(exo_route).
-export([init/2, finish/2]).

finish(State, Ctx) -> {ok, State, Ctx}.
init(State, #cx{req=Req}=Cx) ->
    #{path:=Path}=Req,
    Fix = route_prefix(Path),
    {ok, State, Cx#cx{path=Path,module=Fix}}.

route_prefix(<<"/ws/",P/binary>>)  -> route(P);
route_prefix(<<"/",   P/binary>>)  -> route(P);
route_prefix(P)                    -> route(P).

route(<<>>)                        -> bpe_index;
route(<<"app/bpe",     _/binary>>) -> bpe_index;
route(<<"app/kvs",     _/binary>>) -> 'Elixir.KVS.Index';
route(<<"app/login",   _/binary>>) -> bpe_login;
route(<<"app/form",    _/binary>>) -> bpe_forms;
route(<<"app/process", _/binary>>) -> bpe_act;
route(_)                           -> bpe_login.
