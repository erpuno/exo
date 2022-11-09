defmodule EXOSCULAT do
  use Application
  use Supervisor
  def stop(_), do: :ok
  def init([]), do: {:ok, { {:one_for_one, 5, 10}, []} }
  def start(_, _) do
    :cowboy.start_clear(:http, [{:port, :application.get_env(:n2o, :port, 8051)}],  %{env: %{dispatch: :n2o_cowboy.points()}})
    Supervisor.start_link([], strategy: :one_for_one, name: EXO.Supervisor)
  end
end

