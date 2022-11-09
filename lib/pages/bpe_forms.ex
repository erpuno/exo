defmodule BPE.FORM do
   require N2O
   require NITRO

   def event({:client,{:form,mod}}) do
       :nitro.insert_bottom(:stand, NITRO.h3(body: :nitro.to_binary(mod)))
       :nitro.insert_bottom(:stand, NITRO.h5(body: mod.doc(), style: "margin-bottom: 10px;"))
       :nitro.insert_bottom(:stand, NITRO.panel(:form.new(mod.new(mod,mod.id(),[]), mod.id()), class: :form))
   end

   def event(:init) do
       :nitro.clear(:stand)
       :lists.map(fn x -> send(self(),{:client,{:form,x}}) end, :application.get_env(:form, :registry, []))
   end

   def event(_), do: :ok

end


