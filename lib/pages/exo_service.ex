defmodule EXO.Service do
   require EXO
   require BPE
   require NITRO

   def showTariffs(type) do
      :lists.map(fn x -> case EXO.program(x, :type) do
           t when t == type -> :nitro.insert_top(:tariffsRow, Program.Row.new(:form.atom([:row, EXO.program(x, :id)]), x, []))
           _ -> :skip
      end end, :kvs.all('/exo/tariffs'))
   end

   def event(:init) do
       :nitro.clear(:serviceTypesHead)
       :nitro.clear(:serviceTypesRow)
       :nitro.insert_top(:serviceTypesHead, serviceHeader())
       :nitro.insert_top(:tariffsHead, header())
       :nitro.clear(:frms)
       :nitro.clear(:ctrl)
       mod = Account.Form
       form = :form.new(mod.new(mod,mod.id(), []), mod.id(), [])
       :nitro.insert_bottom(:frms, form)
       :nitro.insert_bottom(:ctrl, NITRO.link(id: :creator, body: "Новий", postback: :create, class: [:button, :sgreen]))
       :nitro.hide(:frms)

      :nitro.insert_top(:serviceTypesHeader, serviceHeader())
      :nitro.insert_top(:serviceTypesRow, NITRO.panel(class: :td, body: NITRO.link(postback: {:showTariffs, "gas"}, body: "Газ")))
      :nitro.insert_top(:serviceTypesRow, NITRO.panel(class: :td, body: NITRO.link(postback: {:showTariffs, "oil"}, body: "Нафта")))
      :nitro.insert_top(:serviceTypesRow, NITRO.panel(class: :td, body: NITRO.link(postback: {:showTariffs, "electricity"}, body: "Електрика")))
      :nitro.insert_top(:serviceTypesRow, NITRO.panel(class: :td, body: NITRO.link(postback: {:showTariffs, "internet"}, body: "Інтернет")))

      showTariffs("internet")
   end

   def event({:showTariffs,e}) do
       :nitro.clear(:tariffsRow)
       showTariffs(e)
   end

   def event(:create) do
       :nitro.hide(:ctrl)
       :nitro.show(:frms)
   end

   def event({:"CreateTariff", _}) do
       date = :date_program_none |> :nitro.q
       name = :name_program_none |> :nitro.q
       formula = :formula_program_none |> :nitro.q
       id = :kvs.seq([],[])
       tariff = EXO.program(date: date, id: id, formula: formula, name: name)
       nitro = :form.new Program.Row.new(:form.atom([:row,name]), tariff, []), tariff, []
       :kvs.append tariff, '/exo/tariffs'
       :nitro.insert_top(:tableRow, nitro)
       :nitro.hide(:frms)
       :nitro.show(:ctrl)
    end

    def event({:"Close", []}) do
        :nitro.hide(:frms)
        :nitro.show(:ctrl)
    end

    def event(_), do: :ok

    def serviceHeader() do
        NITRO.panel(id: :serviceTypeHeader,
                    class: :th,
                    body: [
                            NITRO.panel(class: :column100, body: "Тип"),
                          ] )
   end

    def header() do
        NITRO.panel(id: :tariffsHeader,
                    class: :th,
                    body: [
                            NITRO.panel(class: :column20, body: "Імя"),
                            NITRO.panel(class: :column20, body: "Тип"),
                            NITRO.panel(class: :column20, body: "Формула"),
                            NITRO.panel(class: :column20, body: "Дата"),
                          ] )
   end
end
