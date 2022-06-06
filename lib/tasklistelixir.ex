defmodule Tasklistelixir do
  @moduledoc """
  Documentation for `Tasklistelixir`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Tasklistelixir.hello()
      :world

  """
  def hello do
    :world
  end
  def new(), do: %{}
  def addtask(tasklist, date, body) do
    Map.update(
      tasklist,
      date,
      [body],
      fn tasks -> [body|tasks] end
    )
  end
  def gettask(tasklist, date) do
    Map.get(tasklist, date, [])
  end
end
