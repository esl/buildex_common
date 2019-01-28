defmodule Buildex.Common.Tasks.Sources.Source do
  alias Buildex.Common.Tasks.Task
  @callback fetch(Task.t(), Path.t()) :: {:ok, Task.t()} | {:error, any()}
end
