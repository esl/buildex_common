defmodule Buildex.Common.Config do
  alias Buildex.Common.Services.RPC

  def get_admin_domain do
    Application.get_env(:domain, :admin_domain, :"admin@127.0.0.1")
  end

  def get_rpc_impl do
    Application.get_env(:domain, :rpc_impl, RPC)
  end
end
