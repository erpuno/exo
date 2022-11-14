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
       :nitro.insert_bottom(:frms, :form.new(mod.new(mod,mod.id(), []), mod.id(), []))
       :nitro.insert_bottom(:ctrl, NITRO.link(id: :creator, body: "Новий", postback: :create, class: [:button, :sgreen]))
       :nitro.hide(:frms)
#       :lists.map(fn x -> :nitro.insert_top(:tableRow, 
#           Program.Row.new(:form.atom([:row, EXO.program(x, :id)]), x, [])) end, :kvs.all('/exo/tarrifs'))
   end

   def event(:create) do
       :nitro.hide(:ctrl)
       :nitro.show(:frms)
   end

   def event({:"CreateTarrifs", _}) do
       date = :calendar.now_to_datetime :erlang.timestamp
       id = :kvs.seq([],[])
       client = EXO.program(date: date, id: id)
       nitro = :form.new Program.Row.new(:form.atom([:row,id]), client, []), client, []
       :kvs.append client, '/exo/tariffs'
       :nitro.insert_top(:tableRow, nitro)
       :nitro.hide(:frms)
       :nitro.show(:ctrl)
    end

    def event({:"Discard",[]}) do
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
