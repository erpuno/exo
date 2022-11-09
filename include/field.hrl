-ifndef(FORM_HRL).
-define(FORM_HRL, "field_hrl").

-record(field,      { id=[], raw=[], sec=1, name=[], pos=[], title=[], layout=[], visible=true, disabled=false,
                      vector=false, index=[], bind=[], format="~w", curr=[], postfun=[], desc=[], wide=normal,
                      type=binary, etc=[], labelClass=label, fieldClass=field, boxClass=box, form = [], multiple=false,
                      required=false, module=[], access=[], tooltips=[], options=[], min=0, distinct=false, input=[],
                      max=1000000, length=10, postback=[], onchange=[], validation=[], hidden=false, default=[],
                      modify_pos=[], modify_feed=[], modify_module=[], modify_default=[], subtitle=[], update=[] }).

-endif.
