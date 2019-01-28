defmodule Buildex.Common.Tasks.Runners.Runner do
  alias Buildex.Common.Tasks.Task
  @callback exec(task :: Task.t(), env :: keyword()) :: :ok | {:error, any()} | no_return()
end
