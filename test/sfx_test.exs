defmodule SfxTest do
  use ExUnit.Case
  doctest Sfx

  alias Sfx.Effect

  # example service
  defmodule Service do
    def foo, do: :hello
  end

  # example module
  defmodule Example do
    use Sfx

    def do_something do
      effect(Sfx.Service.foo())
    end
  end

  test "provides effect/1" do
    assert Example.do_something() == Effect.new(Sfx.Service, :foo)
  end
end
