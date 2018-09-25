defmodule ApiserverTest do
  use ExUnit.Case
  doctest Apiserver

  test "greets the world" do
    assert Apiserver.hello() == :world
  end
end
