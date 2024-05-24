defmodule IExHelpers do
  def run_script(script_name) do
    script_path = Path.expand("~/dev/local_mix_project/scripts/#{script_name}")

    if File.exists?(script_path) do
      IO.puts("running script #{script_name}!")
      Code.eval_file(script_path)
      :ok
    else
      IO.puts("Script #{script_name} not found!")
    end
  end
end
