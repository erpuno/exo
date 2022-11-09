defmodule EXO do
  require Record

  Enum.each([ :account, :client, :card, :transaction, :act, :currency, :phone, :otp ],
    fn t ->
      Enum.each(
        Record.extract_all(
          from_lib: "exosculat/include/" <> :erlang.list_to_binary(:erlang.atom_to_list(t)) <> ".hrl"
        ),
        fn {name, definition} ->
          prev = :application.get_env(:kernel, :exo_tables, [])
          case :lists.member(name, prev) do
            true ->
              :skip

            false ->
              Record.defrecord(name, definition)
              :application.set_env(:kernel, :exo_tables, [name | prev])
          end
        end
      )
    end
  )

  defmacro __using__(opts \\ []) do
    imports =
      opts
      |> Macro.expand(__CALLER__)
      |> Keyword.get(:with, [:exo])

    Enum.map(imports, fn mod ->
      if Code.ensure_compiled(mod) do
        upcased = Module.concat([String.upcase(to_string(mod))])

        quote do
          import unquote(upcased)
          alias unquote(mod), as: unquote(upcased)
        end
      else
        IO.warn("🚨 Unknown module #{mod} was requested to be used by :erp. Skipping.")
      end
    end)
  end
end
