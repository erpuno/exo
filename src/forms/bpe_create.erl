-module(bpe_create).
-include_lib("nitro/include/nitro.hrl").
-include_lib("form/include/meta.hrl").
-include_lib("bpe/include/bpe.hrl").
-include("act.hrl").
-export([doc/0,id/0,new/3]).

doc() -> <<"Форма створення BPE/BPMN процесів."/utf8>>.
id() -> #act{}.
new(Name,#act{}, _) ->
  put(process_type_pi_none, "bpe_account"),
  #document { name = form:atom([pi,Name]),
    sections = [ #sec { name=[<<"Новий процес: "/utf8>>] } ],
    buttons  = [ #but { id=form:atom([pi,decline]),
                        title= <<"Відміна"/utf8>>,
                        class=cancel,
                        postback={'Discard',[]} },
                 #but { id=form:atom([pi,proceed]),
                        title = <<"Створення"/utf8>>,
                        class = [button,sgreen],
                        sources = [process_type],
                        postback = {'Spawn',[]}}],
    fields = [ #field { name=process_type,
                        id=process_type,
                        type=select,
                        title= <<"Тип:"/utf8>>,
                        tooltips = [],
                        default = bpe_account,
                        options = [ #opt{name=bpe_account,checked=true,title = <<"Рахунок"/utf8>>} ]
                       } ] }.
