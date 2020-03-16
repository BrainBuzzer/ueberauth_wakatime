defmodule UeberauthWakatime.Mixfile do
  use Mix.Project

  @version "0.1.0"
  @url "https://github.com/BrainBuzzer/ueberauth_wakatime"

  def project do
    [
      app: :ueberauth_wakatime,
      version: @version,
      elixir: "~> 1.3",
      name: "Ueberauth Wakatime",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      source_url: @url,
      homepage_url: @url,
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [applications: [:logger, :oauth2, :ueberauth]]
  end

  defp deps do
    [
      {:ueberauth, "~> 0.6"},
      {:oauth2, "~> 2.0"},
      {:ex_doc, "~> 0.3", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev}
    ]
  end

  defp docs do
    [extras: ["README.md"]]
  end

  defp description do
    "An Uberauth strategy for Wakatime authentication."
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Aditya Giri"],
      licenses: ["MIT"],
      links: %{GitHub: @url}
    ]
  end
end
