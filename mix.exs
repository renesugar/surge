defmodule Surge.Mixfile do
  use Mix.Project

  def project do
    [app: :surge,
     version: "0.0.1",
     elixir: "~> 1.3",
     description: "Amazon DynamoDB for Elixir",
     package: package(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [
        :logger,
        :ex_aws,
        :poison,
        :hackney
      ]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_aws, git: "https://github.com/CargoSense/ex_aws.git"},
      {:poison, "~> 2.0"},
      {:hackney, "~> 1.6"},
      {:dialyxir, "~> 0.4", only: [:dev]},
      {:ex_doc, "~> 0.14", only: :dev},
      {:credo, "~> 0.5", only: :dev}
    ]
  end

  defp package do
    [ name: :surge,
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["hirocaster"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/hirocaster/surge"} ]
  end
end
