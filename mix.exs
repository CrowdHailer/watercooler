defmodule Watercooler.Mixfile do
  use Mix.Project

  def project do
    [app: :watercooler,
     version: "0.1.0",
     elixir: "~> 1.6",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger],
      mod: {Watercooler.Application, []}]
  end

  defp deps do
    [
      {:ace, "~> 0.18.0"},
      {:phoenix_html, "~> 2.11"},
      {:raxx_static, "~> 0.7.0"},
      {:server_sent_event, "~> 0.3.1"},
      {:exsync, "~> 0.2.3", only: :dev},
    ]
  end
end
