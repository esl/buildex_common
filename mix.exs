defmodule Domain.MixProject do
  use Mix.Project

  def project do
    [
      app: :domain,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
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
