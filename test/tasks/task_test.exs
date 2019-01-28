defmodule Buildex.Common.Tasks.TaskTest do
  use ExUnit.Case, async: false

  alias Buildex.Common.Tasks.Task
  alias Buildex.Common.Tasks.Runners.Make
  alias Buildex.Common.Tasks.Sources.Github

  test "creates a new task" do
    make_url = "https://github.com/elixir-lang/elixir"
    assert %Task{url: make_url, source: Github, runner: Make} == Task.new(url: make_url)
  end
end
