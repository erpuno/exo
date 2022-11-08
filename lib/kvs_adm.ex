defmodule KVS.Index do
  use N2O, with: [:n2o, :nitro]
  use FORM
  use KVS
  require Logger

  def parse(_), do: []

  def event(:init),
    do:
      [:user, :writers, :session, :enode]
      |> Enum.map(fn x ->
       [ NITRO.clear(x),
         send(self(), {:direct, x})] end)

  def event(:user),
  do: NITRO.update(:user,
      span(body: parse(:n2o.user())))

  def event(:session),
  do: NITRO.update(:session,
      span(body: :n2o.sid()))

  def event(:enode),
  do: NITRO.update(:enode,
      span(body: NITRO.compact(:erlang.node())))

  def event({:link, i}),
  do: [
      NITRO.clear(:feeds),
      :kvs.feed(i) |> Enum.map(fn t ->
        NITRO.insert_bottom(:feeds,
          panel(body: NITRO.compact(t))) end)
    ]

  def event(:writers),
    do:
      :writer
      |> :kvs.all()
      |> :lists.sort()
      |> Enum.map(fn writer(id: i, count: c) ->
        NITRO.insert_bottom(
          :writers,
          panel(body:
          [link(body: i, postback: {:link, i}),
           ' (' ++ NITRO.to_list(c) ++ ')']))
      end)

  def event(_), do: []

  def ram(os), do: NITRO.compact(os)
end
