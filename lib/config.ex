defmodule Buildex.Common.Config do
  alias Buildex.Common.Services.RPC

  def get_admin_node do
    Application.fetch_env!(:buildex_common, :admin_node)
  end

  def get_rpc_impl do
    Application.get_env(:buildex_common, :rpc_impl, RPC)
  end
end
