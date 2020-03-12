defmodule Sfx.Effect do
  @moduledoc """
  Module for describing side effects
  """

  alias __MODULE__

  @type t :: %{m: module, f: atom, a: [any]}

  defstruct [:m, :f, :a]

  def new(m, f, a \\ []), do: %__MODULE__{m: m, f: f, a: List.wrap(a)}

  defmacro effect(block) do
    {{_, _, [{_, _, mod}, f]}, _, args} = block

    m = Module.concat(mod)

    quote bind_quoted: [m: m, f: f, args: args] do
      Effect.new(m, f, args)
    end
  end
end
