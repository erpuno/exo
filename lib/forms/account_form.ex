defmodule Account.Form do
  require EXO
  require NITRO
  require FORM
  require BPE
  def doc(), do: "Форма вводу облікового запису користувача системи"
  def id, do: EXO.account()
  def new(name, _program, _) do
      :erlang.put(:type_account_none, :type)
      FORM.document(
        name: :form.atom([:account,name]),
        sections: [ FORM.sec(name: ["Створення рахунку: " ])],
        buttons:  [ FORM.but(id: :decline,
                         name: :decline,
                         title: "Відміна",
                         class: [:cancel],
                         postback: {:"Close",[]} ),
                    FORM.but(id: :proceed,
                         name: :proceed,
                         title: "Створити",
                         class: [:button,:sgreen],
                         sources: [:name_account_none,:type_account_none,
                                   :date_account_none,:formula_account_none],
                         postback: {:"CreateAccount", :form.atom([:account, name])})],
        fields:   [ FORM.field(id: :name,
                         name: :name,
                         type: :string,
                         title: "Ім'я клієнта",
                         labelClass: :label),
                    FORM.field(id: :edrpou,
                         name: :edrpou,
                         type: :string,
                         title: "ЄДРПОУ",
                         labelClass: :label),
                    FORM.field(
                         id: :type,
                         name: :type,
                         title: "Тип:",
                         type: :select,
                         default: :internet,
                         options: [ FORM.opt(name: :internet, checked: true, title: "Інтернет"),
                                    FORM.opt(name: :oil, title: "Нафта"),
                                    FORM.opt(name: :gas, title: "Газ"),
                                    FORM.opt(name: :electricity, title: " Електроенергія"), ]),
                    FORM.field(
                         id: :program,
                         name: :program,
                         title: "Тарифна модель:",
                         type: :select,
                         default: :internet,
                         options: [ ]),
                    FORM.field(id: :date,
                         name: :date,
                         type: :calendar,
                         title: "Дата",
                         labelClass: :label) ] )
  end
end
