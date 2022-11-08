-module(bpe_pass).
-include_lib("form/include/meta.hrl").
-include("phone.hrl").
-export([doc/0,id/0,new/3]).

doc() -> <<"Форма одноразового OTP паролю для 2FA"/utf8>>.
id() -> #phone{}.
new(Name,_Phone,_) ->
    #document { name = form:atom([otp,Name]),
    sections = [ #sec { name=[<<"Аутентифікуйтесь: "/utf8>> ] } ],
    buttons  = [ #but { id=decline,
                        name=decline,
                        title= <<"Відміна"/utf8>>,
                        class=[cancel],
                        postback={'Close',[]} },
                 #but { id=proceed,
                        name=proceed,
                        title = <<"Далі"/utf8>>,
                        class = [button,sgreen],
                        sources = [user,otp],
                        postback = {'Next',form:atom([otp,otp,Name])}}],
    fields = [ #field { id=number,
                        name=number,
                        type=string,
                        title= <<"Логін:"/utf8>>,
                        labelClass=label},
               #field { id=auth,
                        name=auth,
                        type=string,
                        title= <<"Пароль:"/utf8>>,
                        labelClass=label}]}.
