defmodule Buildex.Common.MixProject do
  use Mix.Project

  def project do
    [
      app: :buildex_common,
      version: "0.1.0",
      elixir: "~> 1.7",
      deps: deps()
    ]
  end

  defp deps do
    [
      {:poison, "~> 4.0"},
      {:ex_docker_build, "~> 0.6.0"},
      {:mox, "~> 0.4", only: :test},
      {:mimic, "~> 0.2", only: :test}
    ]
  end
end
