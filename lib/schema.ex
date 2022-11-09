defmodule EXO do
  require KVS
  require FORM
  require Record

  @schema [ :account, :client, :card, :transaction, :act, :currency, :phone, :otp, :field ]

  Enum.each(@schema,
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

   def table(name) do
       exo_fields = :application.get_env(:exosculat, :exo_fields, [])
       {a,b} = :lists.unzip(:proplists.get_value(name, exo_fields, []))
       KVS.table(name: name, fields: a, instance: b)
   end

   def exo(), do: :lists.map(fn x -> table(x) end, @schema)

end
