defmodule Buildix.Common.Services.FakeDatabase do
  alias Buildix.Common.Services.Database
  @behaviour Database

  @impl true
  def get_all_repositories do
    {:ok, []}
  end

  @impl true
  def get_all_tags(_url) do
    {:ok, []}
  end

  @impl true
  def create_tag(_url, _tag) do
    {:ok, %{name: "", commit_sha: "", commit_url: ""}}
  end

  @impl true
  def get_repo_tasks(_url) do
    {:ok, []}
  end
end
