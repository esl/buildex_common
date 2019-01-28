defmodule Buildix.Common.Tasks.Task do
  @moduledoc """
  Represents the task that is going to be executed when there is a new release of
  a repository.

  A task is a one particular action meant to be downloaded from an external
  source via a `source` module, and to be executed via a `runner` module,
  which is going to have access to the new release tag as a environment variable
  and a list of environment variables assigned via its `env` attribute.

  It is going to be executed by a `runner` module, defaults to: `Buildix.Common.Tasks.Runners.Make`,
  and its going to be downloaded by a `source` module, defaults to `Buildix.Common.Tasks.Sources.Github`.

  The task can contain multiple commands:

      make -f Makefile install
      make -f Makefile build
      make -f Makefile release
      make -f Makefile deploy
  """
  alias __MODULE__
  alias Buildix.Common.Tasks.Runners.Make
  alias Buildix.Common.Tasks.Sources.Github

  @type runner :: module()
  # TODO: add support for other sources e.g GitLab etc
  @type source :: module()

  @type t :: %__MODULE__{
          id: non_neg_integer(),
          url: String.t(),
          build_file_content: String.t(),
          path: Path.t(),
          env: list(),
          commands: list(String.t()),
          runner: runner(),
          source: source(),
          ssh_key: String.t(),
          docker_username: String.t(),
          docker_email: String.t(),
          docker_password: String.t(),
          docker_servername: String.t(),
          docker_image_name: String.t()
        }

  defstruct id: nil,
            url: nil,
            build_file_content: nil,
            path: nil,
            env: [],
            commands: [],
            runner: Make,
            source: Github,
            ssh_key: nil,
            docker_username: nil,
            docker_email: nil,
            docker_password: nil,
            docker_servername: nil,
            docker_image_name: nil

  @spec new(Enum.t()) :: Task.t() | no_return()
  def new(attrs) do
    struct!(__MODULE__, attrs)
  end

  @spec new(Task.t()) :: map()
  def get_docker_credentials(task) do
    Map.take(task, [:docker_username, :docker_password, :docker_servername])
  end
end
