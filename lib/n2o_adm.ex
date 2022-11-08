defmodule N2O.Index do
  require NITRO
  require Logger

  def parse(_), do: []

  def event(:init),
    do:
      [:user, :writers, :session, :enode]
      |> Enum.map(fn x ->
       [ :nitro.clear(x),
         send(self(), {:direct, x})] end)

  def event(:user),
  do: :nitro.update(:user,
      NITRO.span(body: parse(:n2o.user())))

  def event(:session),
  do: :nitro.update(:session,
      NITRO.span(body: :n2o.sid()))

  def event(:enode),
  do: :nitro.update(:enode,
      NITRO.span(body: :nitro.compact(:erlang.node())))

  def event({:link, table}),
  do: [
      :nitro.clear(:feeds),
      :ets.tab2list(table) |> Enum.map(fn t ->
        :nitro.insert_bottom(:feeds,
          NITRO.panel(body: :nitro.compact(t))) end)
    ]

  def event(:writers),
    do:
      :application.get_env(:n2o, :tables, [])
      |> Enum.map(fn table ->
        size = :proplists.get_value( :size, :ets.info(table),0)
        :nitro.insert_bottom(
          :writers,
          NITRO.panel(body:
          [NITRO.link(body: :nitro.to_list(table), postback: {:link, table}),
           ' (' ++ :nitro.to_list(size) ++ ')']))
      end)

  def event(_), do: []

  def ram(os), do: :nitro.compact(os)
end
