defmodule Tasklistelixir do
  defstruct top: nil, bottom: nil
  def hello do
    :world
  end
  def new(), do: %{}
  def new(top, bottom) do
    %Tasklistelixir{top: top, bottom: bottom}
  end
  def value(%Tasklistelixir{top: _, bottom: 0}), do: 0
  def value(%Tasklistelixir{top: top, bottom: bottom}) do
    top/bottom
  end
  def add(%Tasklistelixir{top: firsttop, bottom: firstbottom},%Tasklistelixir{top: secondtop, bottom: secondbottom}) do
    new(
      firsttop * secondbottom + secondtop * firstbottom,
      firstbottom * secondbottom
      )
  end
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
