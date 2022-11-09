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

  def route(<<"app/kvs",     _::binary>>), do: KVS.Index
  def route(<<"app/n2o",     _::binary>>), do: N2O.Index
  def route(<<"app/mnesia",  _::binary>>), do: MNESIA.Index
  def route(<<"app/form",    _::binary>>), do: BPE.FORM
  def route(<<"app/bpe",     _::binary>>), do: BPE.Index
  def route(<<"app/process", _::binary>>), do: BPE.Act
  def route(<<"app/login",   _::binary>>), do: BPE.Login
  def route(<<"app/home",    _::binary>>), do: BPE.Login
  def route(<<"app/profile", _::binary>>), do: BPE.Login
  def route(<<"app/consume", _::binary>>), do: BPE.Login
  def route(<<"app/service", _::binary>>), do: BPE.Login
  def route("")                          , do: BPE.Login
  def route(_)                           , do: BPE.Login

end
