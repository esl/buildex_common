defmodule Buildex.Common.Services.RPC do
  alias Buildex.Common.Config
  alias Buildex.Common.Repos.Repo

  @callback get_all_repositories() :: any() | {:badrpc, any()}
  @callback get_all_tags(String.t()) :: any() | {:badrpc, any()}
  @callback create_tag(Repo.url(), map()) :: any() | {:badrpc, any()}
  @callback get_repo_tasks(Repo.url()) :: any() | {:badrpc, any()}

  def get_all_repositories() do
    Config.get_admin_node()
    |> :rpc.call(Buildex.API.Repository.Service, :all, [])
  end

  def get_all_tags(url) do
    Config.get_admin_node() |> :rpc.call(Buildex.API.Repository.Service, :repo_tags, [url])
  end

  def create_tag(url, tag) do
    Config.get_admin_node()
    |> :rpc.call(Buildex.API.Repository.Service, :create_tag, [url, tag])
  end

  def get_repo_tasks(url) do
    Config.get_admin_node()
    |> :rpc.call(Buildex.API.Repository.Service, :repo_tasks, [url])
  end
end
