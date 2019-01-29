defmodule Buildex.Common.MixProject do
  use Mix.Project

  def project do
    [
      app: :buildex_common,
      deps: deps(),
      elixir: "~> 1.7",
      test_coverage: [tool: ExCoveralls],
      version: "0.0.1",
      organization: "esl",
      description: "Common utilities and domain objects for the buildex project",
      package: package(),
      source_url: "https://github.com/esl/buildex_common"
    ]
  end

  defp package() do
    [
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE),
      licenses: ["Apache 2"],
      links: %{"GitHub" => "https://github.com/esl/buildex_common"}
    ]
  end

  defp deps do
    [
      # {:credo, "~> 0.9.1", only: [:dev, :test]},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.18", only: :dev, runtime: false},
      {:ex_docker_build, "~> 0.6.0"},
      {:excoveralls, "~> 0.10.4", only: [:dev, :test], runtime: false},
      {:mimic, "~> 0.2", only: :test},
      {:mox, "~> 0.4", only: :test},
      {:poison, "~> 4.0"}
    ]
  end
end
