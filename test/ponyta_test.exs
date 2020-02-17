defmodule PonytaTest do
  use ExUnit.Case
  doctest Ponyta

  test "greets the world" do
    assert Ponyta.hello() == :world
  end
end
