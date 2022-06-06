defmodule TasklistelixirTest do
  use ExUnit.Case
  doctest Tasklistelixir

  test "greets the world" do
    assert Tasklistelixir.hello() == :world
  end

  test "new creates new empty map" do
    assert Tasklistelixir.new() == %{}
  end

  test "addtask adds a new task to the map" do
    assert Tasklistelixir.addtask(%{}, ~D[2022-06-05], "Ebill Added") == %{~D[2022-06-05] => ["Ebill Added"]}
    assert Tasklistelixir.addtask(%{}, ~D[2022-06-05], "Ebill2 Added") == %{~D[2022-06-05] => ["Ebill2 Added"]}
  end

  test "gettask a task from the map" do
   task1 = Tasklistelixir.addtask(%{}, ~D[2022-06-05], "Ebill Added")
   task2 = Tasklistelixir.addtask(task1, ~D[2022-06-06], "Ebill Added2")
    assert Tasklistelixir.gettask(task2, ~D[2022-06-06]) == ["Ebill Added2"]
    assert Tasklistelixir.gettask(task2, ~D[2022-06-05]) == ["Ebill Added"]
  end


end
