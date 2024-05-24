defmodule LocalMixProjectTest do
  use ExUnit.Case
  doctest LocalMixProject

  test "greets the world" do
    assert LocalMixProject.hello() == :world
  end
end
