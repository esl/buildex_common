defmodule Buildix.Common.Tasks.Sources.Source do
  alias Buildix.Common.Tasks.Task
  @callback fetch(Task.t(), Path.t()) :: {:ok, Task.t()} | {:error, any()}
end
