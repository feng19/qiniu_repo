defmodule QiniuRepo.MixProject do
  use Mix.Project

  def project do
    [
      app: :qiniu_repo,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {QiniuRepo.Application, []}
    ]
  end

  defp deps do
    [
      {:qiniu, github: "feng19/qiniu"},
      {:mini_repo, github: "feng19/mini_repo"},
      {:logger_file_backend, "~> 0.0.13"}
    ]
  end

  defp escript do
    [
      main_module: QiniuRepo,
      emu_args: "+K true -detached"
    ]
  end
end
