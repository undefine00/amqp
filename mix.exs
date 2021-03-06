defmodule AMQP.Mixfile do
  use Mix.Project

  @version "1.0.5"

  def project do
    [
      app: :amqp,
      version: @version,
      elixir: "~> 1.7",
      description: description(),
      package: package(),
      source_url: "https://github.com/undefin00/amqp",
      deps: deps(),
      dialyzer: [
        ignore_warnings: "dialyzer.ignore-warnings",
        plt_add_deps: :transitive,
        flags: [:error_handling, :race_conditions, :no_opaque, :underspecs]
      ],
      docs: [
        extras: ["README.md"],
        main: "readme",
        source_ref: "v#{@version}",
        source_url: "https://github.com/ztran/amqp"
      ]
    ]
  end

  def application do
    [applications: [:logger, :amqp_client]]
  end

  defp deps do
    [
      {:amqp_client, "~> 3.8"},
      {:rabbit_common, "~> 3.8"},
      {:ranch, "~> 1.7.1", override: true},
    ]
  end

  defp description do
    """
        Idiomatic Elixir client for RabbitMQ.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Paulo Almeida", "Eduardo Gurgel"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/pma/amqp"
      }
    ]
  end
end
