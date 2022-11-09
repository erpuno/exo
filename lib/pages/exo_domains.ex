defmodule EXO.Domains do
   require EXO
   require BPE
   require NITRO

   def event(:init) do
       :nitro.clear(:tableHead)
       :nitro.clear(:tableRow)
       :nitro.insert_top(:tableHead, header())
       :nitro.clear(:frms)
       :nitro.clear(:ctrl)
       mod = BPE.Create
       :nitro.insert_bottom(:frms, :form.new(mod.new(mod,mod.id(), []), mod.id(), []))
       :nitro.insert_bottom(:ctrl, NITRO.link(id: :creator, body: "Новий", postback: :create, class: [:button, :sgreen]))
       :nitro.hide(:frms)
       :lists.map(fn x -> :nitro.insert_top(:tableRow, EXO.Client.Row.new(:form.atom([:row, x]), EXO.client(), [])) end, :kvs.all('/exo/user/client'))
   end

   def event(:create) do
       :nitro.hide(:ctrl)
       :nitro.show(:frms)
   end

   def event({:"Spawn",_}) do
       id = :kvs.seq [], []
       :nitro.insert_after(:header, EXO.Client.Row.new(:form.atom([:row,id]), EXO.client(), []))
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
                    body: [ NITRO.panel(class: :column20,  body: "ПІБ"),
                            NITRO.panel(class: :column20, body: "Тип"),
                            NITRO.panel(class: :column20, body: "Дата"),
                            NITRO.panel(class: :column10, body: "Статус") ] )
   end
end
