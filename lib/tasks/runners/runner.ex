defmodule Buildix.Common.Tasks.Runners.Runner do
  alias Buildix.Common.Tasks.Task
  @callback exec(task :: Task.t(), env :: keyword()) :: :ok | {:error, any()} | no_return()
end
