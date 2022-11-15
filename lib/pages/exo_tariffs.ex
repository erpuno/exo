defmodule EXO.Tarrifs do
   require EXO
   require BPE
   require NITRO

   def event(:init) do
       :nitro.clear(:tableHead)
       :nitro.clear(:tableRow)
       :nitro.insert_top(:tableHead, header())
       :nitro.clear(:frms)
       :nitro.clear(:ctrl)
       mod = Program.Form
       form = :form.new(mod.new(mod,mod.id(), []), mod.id(), [])
#       :io.format 'FORM: ~p', [form]
#       :io.format 'FORM: ~ts', [form |> :nitro.render |> :erlang.iolist_to_binary]
       :nitro.insert_bottom(:frms, form)
       :nitro.insert_bottom(:ctrl, NITRO.link(id: :creator, body: "Новий", postback: :create, class: [:button, :sgreen]))
       :nitro.hide(:frms)
       :lists.map(fn x -> :nitro.insert_top(:tableRow,
           Program.Row.new(:form.atom([:row, EXO.program(x, :id)]), x, [])) end, :kvs.all('/exo/tariffs'))
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

    def header() do
        NITRO.panel(id: :header,
                    class: :th,
                    body: [
                            NITRO.panel(class: :column20, body: "Імя"),
                            NITRO.panel(class: :column20, body: "Тип"),
                            NITRO.panel(class: :column20, body: "Формула"),
                            NITRO.panel(class: :column20, body: "Дата"),
                          ] )
   end
end
