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

  def route(<<"app/login",   _::binary>>), do: BPE.Login

  def route(<<"app/admin/kvs",     _::binary>>), do: KVS.Index
  def route(<<"app/admin/n2o",     _::binary>>), do: N2O.Index
  def route(<<"app/admin/mnesia",  _::binary>>), do: MNESIA.Index
  def route(<<"app/admin/form",    _::binary>>), do: BPE.FORM
  def route(<<"app/admin/bpe",     _::binary>>), do: BPE.Index
  def route(<<"app/admin/process", _::binary>>), do: BPE.Act

  def route(<<"app/consumer/profile", _::binary>>), do: BPE.Login
  def route(<<"app/consumer/consume", _::binary>>), do: BPE.Login
  def route(<<"app/consumer/service", _::binary>>), do: BPE.Login

  def route(<<"app/backoffice/reports", _::binary>>), do: EXO.Domains
  def route(<<"app/backoffice/tariffs", _::binary>>), do: EXO.Domains
  def route(<<"app/backoffice/domains", _::binary>>), do: EXO.Domains

  def route(""), do: BPE.Login
  def route(_) , do: BPE.Login

end
