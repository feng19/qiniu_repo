defmodule QiniuRepo do
  @moduledoc false

  def main(_) do
    start()
    IO.puts("RSB Helper started.")

    receive do
      :stop -> :stop
    end
  end

  def start, do: Application.ensure_started(:qiniu_repo)
end
