defmodule ConstEnum.MixProject do
  use Mix.Project

  @source_url "https://github.com/bacnet-ex/const_enum"

  def project do
    [
      app: :const_enum,
      version: "0.2.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        ignore_warnings: "dialyzer.ignore-warnings.exs",
        plt_add_apps: []
      ],
      source_url: @source_url,
      description: "ConstEnum is a simple constant enum library.",
      docs: [
        main: "readme",
        source_ref: "master",
        groups_for_docs: [Guards: & &1[:guard]],
        groups_for_modules: [],
        nest_modules_by_prefix: [],
        extras: ["README.md"]
        # before_closing_head_tag: &docs_before_closing_head_tag/1,
        # before_closing_body_tag: &docs_before_closing_body_tag/1
      ],
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: []
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:dialyxir, "1.4.3", only: [:dev, :test], runtime: false},
      {:doctor, "~> 0.21", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.29", only: [:dev, :test], runtime: false}
    ]
  end

  defp package() do
    [
      maintainers: ["bacnet-ex"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
