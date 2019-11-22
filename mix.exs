defmodule OrderedBroadway.MixProject do
  use Mix.Project

  def project do
    [
      app: :ordered_broadway,
      version: "0.1.0",
      elixir: "~> 1.9.2",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:amqp],
      extra_applications: [:logger, :amqp],
      mod: {OrderedBroadway.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      # {:broadway, "~> 0.4.0"},
      {:broadway, git: "https://github.com/somersbmatthews/broadway_test.git"},
      {:hackney, "~> 1.9"},
      # {:broadway_rabbitmq, "~> 0.4.0"},
      {:broadway_rabbitmq, git: "https://github.com/somersbmatthews/broadway_rabbitmq.git"},
      {:amqp, "~> 1.3.2"}
    ]
  end
end
