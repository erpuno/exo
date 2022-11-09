defmodule EXO do
  require KVS
  require FORM
  require Record

  Enum.each([ :account, :client, :card, :transaction, :act, :currency, :phone, :otp, :form ],
    fn t ->
      Enum.each(
        Record.extract_all(
          from_lib: "exosculat/include/" <> :erlang.list_to_binary(:erlang.atom_to_list(t)) <> ".hrl"
        ),
        fn {name, definition} ->
          prev = :application.get_env(:kernel, :exo_tables, [])
          prev2 = :application.get_env(:exosculat, :exo_fields, [])
          case :lists.member(name, prev) do
            true ->
              :skip

            false ->
              Record.defrecord(name, definition)
              :application.set_env(:kernel, :exo_tables, [name | prev])
              :application.set_env(:exosculat, :exo_fields, [{name,definition} | prev2])
          end
        end
      )
    end
  )

   def metainfo(), do: KVS.schema( name: :exo, tables: exo())

   def fields(table) do
       exo_fields = :application.get_env(:exosculat, :exo_fields, [])
       {a,_} = :lists.unzip(:proplists.get_value(table, exo_fields, []))
       a
   end

   def exo() do
       [
        KVS.table(name: :phone,       fields: fields(:phone),   instance: phone()),
        KVS.table(name: :field,       fields: fields(:field),   instance: FORM.field()),
        KVS.table(name: :account,     fields: fields(:account), instance: account()),
        KVS.table(name: :client,      fields: fields(:client),      instance: client()),
        KVS.table(name: :card,        fields: fields(:card),        instance: card()),
        KVS.table(name: :transaction, fields: fields(:transaction), instance: transaction())
       ]
  end

end
