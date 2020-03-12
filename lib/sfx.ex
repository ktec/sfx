defmodule Sfx do
  @moduledoc """
  Sfx is a library for seamlessly managing side effects in Elixir.
  """

  defmacro __using__(_opts \\ []) do
    quote do
      require Sfx.Effect
      import Sfx.Effect
    end
  end
end
