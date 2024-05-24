defmodule LocalMixProject.MixProject do
  use Mix.Project

  def project do
    [
      app: :local_mix_project,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end

  defp aliases do
    [
      iex: ["cmd iex -S mix run --no-halt -r ./iex_helpers.exs"]
    ]
  end
end
