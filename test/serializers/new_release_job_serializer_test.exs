defmodule Buildix.Common.Serializers.NewReleaseJobSerializer.Test do
  use ExUnit.Case, async: false

  alias Buildix.Common.Serializers.NewReleaseJobSerializer, as: JobSerializer
  alias Buildix.Common.Jobs.NewReleaseJob
  alias Buildix.Common.Repos.Repo
  alias Buildix.Common.Tags.Tag

  setup do
    repo = Repo.new("https://github.com/elixir-lang/elixir")

    tag = %Tag{
      commit: %{
        sha: "2b338092b6da5cd5101072dfdd627cfbb49e4736",
        url:
          "https://api.github.com/repos/elixir-lang/elixir/commits/2b338092b6da5cd5101072dfdd627cfbb49e4736"
      },
      name: "v1.7.2",
      node_id: "MDM6UmVmMTIzNDcxNDp2MS43LjI=",
      tarball_url: "https://api.github.com/repos/elixir-lang/elixir/tarball/v1.7.2",
      zipball_url: "https://api.github.com/repos/elixir-lang/elixir/zipball/v1.7.2"
    }

    {:ok, repo: repo, tag: tag}
  end

  test "serializes a new release job", %{repo: repo, tag: tag} do
    job = NewReleaseJob.new(repo, tag)

    assert JobSerializer.serialize!(job) ==
             "{\"repo\":{\"url\":\"https://github.com/elixir-lang/elixir\",\"polling_interval\":3600000,\"owner\":\"elixir-lang\",\"name\":\"elixir\",\"github_token\":null},\"new_tag\":{\"zipball_url\":\"https://api.github.com/repos/elixir-lang/elixir/zipball/v1.7.2\",\"tarball_url\":\"https://api.github.com/repos/elixir-lang/elixir/tarball/v1.7.2\",\"node_id\":\"MDM6UmVmMTIzNDcxNDp2MS43LjI=\",\"name\":\"v1.7.2\",\"commit\":{\"url\":\"https://api.github.com/repos/elixir-lang/elixir/commits/2b338092b6da5cd5101072dfdd627cfbb49e4736\",\"sha\":\"2b338092b6da5cd5101072dfdd627cfbb49e4736\"}}}"
  end

  test "deserialize a new release job", %{repo: repo, tag: tag} do
    job = NewReleaseJob.new(repo, tag)

    decoded_job =
      JobSerializer.deserialize!(
        "{\"repo\":{\"url\":\"https://github.com/elixir-lang/elixir\",\"owner\":\"elixir-lang\",\"name\":\"elixir\",\"polling_interval\":3600000,\"id\":1},\"new_tag\": {\"zipball_url\":\"https://api.github.com/repos/elixir-lang/elixir/zipball/v1.7.2\",\"tarball_url\":\"https://api.github.com/repos/elixir-lang/elixir/tarball/v1.7.2\",\"node_id\":\"MDM6UmVmMTIzNDcxNDp2MS43LjI=\",\"name\":\"v1.7.2\",\"commit\":{\"url\":\"https://api.github.com/repos/elixir-lang/elixir/commits/2b338092b6da5cd5101072dfdd627cfbb49e4736\",\"sha\":\"2b338092b6da5cd5101072dfdd627cfbb49e4736\"}}}"
      )

    assert decoded_job == job
  end
end
