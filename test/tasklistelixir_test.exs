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
    task1 = Tasklistelixir.addtask(%{}, ~D[2022-06-05], "Ebill Added")
    task2 = Tasklistelixir.addtask(task1, ~D[2022-06-06], "Ebill Added2")
    assert task2 ==  %{~D[2022-06-05] => ["Ebill Added"], ~D[2022-06-06] => ["Ebill Added2"]}
  end

  test "gettask a task from the map" do
   task1 = Tasklistelixir.addtask(%{}, ~D[2022-06-05], "Ebill Added")
   task2 = Tasklistelixir.addtask(task1, ~D[2022-06-06], "Ebill Added2")
    assert Tasklistelixir.gettask(task2, ~D[2022-06-06]) == ["Ebill Added2"]
    assert Tasklistelixir.gettask(task2, ~D[2022-06-05]) == ["Ebill Added"]
  end

  test "get struck from tasklist" do
     assert %Tasklistelixir{top: 1, bottom: 2} == %Tasklistelixir{top: 1, bottom: 2}
   end
  test "new generates new struck" do
    assert Tasklistelixir.new(1, 2) == %Tasklistelixir{top: 1, bottom: 2}
  end
  test "value get the values top/bottom" do
    assert Tasklistelixir.value(%Tasklistelixir{top: 1, bottom: 2}) == 0.50
  end

  test "value get the values 0 if bottom is 0" do
    assert Tasklistelixir.value(%Tasklistelixir{top: 1, bottom: 0}) == 0
  end

  test "Adds the two values get the sum of 1/2 to get 1" do
    assert Tasklistelixir.add(%Tasklistelixir{top: 1, bottom: 2},%Tasklistelixir{top: 1, bottom: 2}) == %Tasklistelixir{bottom: 4, top: 4}
  end


end
