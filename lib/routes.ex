defmodule EXO.Route do
  require N2O
  require Logger

  def finish(state, ctx), do: {:ok, state, ctx}
  def init(state, context) do
      %{path: path} = N2O.cx(context, :req)
      {:ok, state, N2O.cx(context, path: path, module: route_prefix(path))}
  end

  def route_prefix(<<"/ws/",p::binary>>) , do: route(p)
  def route_prefix(<<"/",   p::binary>>) , do: route(p)
  def route_prefix(p)                    , do: route(p)

  # Administrator

  def route(<<"app/admin/kvs",     _::binary>>), do: ADM.KVS
  def route(<<"app/admin/n2o",     _::binary>>), do: ADM.N2O
  def route(<<"app/admin/mnesia",  _::binary>>), do: ADM.MNESIA
  def route(<<"app/admin/form",    _::binary>>), do: ADM.FORM
  def route(<<"app/admin/bpe",     _::binary>>), do: ADM.BPE
  def route(<<"app/admin/process", _::binary>>), do: ADM.ACT

  # Billing

  def route(<<"app/login",              _::binary>>), do: EXO.Login
  def route(<<"app/consumer/profile",   _::binary>>), do: EXO.Login
  def route(<<"app/consumer/consume",   _::binary>>), do: EXO.Login
  def route(<<"app/consumer/service",   _::binary>>), do: EXO.Service
  def route(<<"app/backoffice/reports", _::binary>>), do: EXO.Domains
  def route(<<"app/backoffice/tariffs", _::binary>>), do: EXO.Tarrifs
  def route(<<"app/backoffice/domains", _::binary>>), do: EXO.Domains

  def route(""), do: EXO.Login
  def route(_) , do: EXO.Login

end
