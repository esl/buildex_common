use Mix.Config

config :buildex_common, :rpc_impl, Buildex.Common.Services.RPC

import_config "#{Mix.env()}.exs"
