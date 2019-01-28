defmodule Buildex.Common.Helpers.MapTest do
  use ExUnit.Case, async: false

  alias Buildex.Common.Helpers.Map, as: HelperMap

  test "safely maps the keys of a map into existing atoms" do
    map = %{
      "name" => "v0.1",
      "commit" => %{
        "sha" => "c5b97d5ae6c19d5c5df71a34c7fbeeda2479ccbc",
        "url" =>
          "https://api.github.com/repos/octocat/Hello-World/commits/c5b97d5ae6c19d5c5df71a34c7fbeeda2479ccbc"
      },
      "zipball_url" => "https://github.com/octocat/Hello-World/zipball/v0.1",
      "tarball_url" => "https://github.com/octocat/Hello-World/tarball/v0.1"
    }

    assert %{
             name: "v0.1",
             commit: %{
               sha: "c5b97d5ae6c19d5c5df71a34c7fbeeda2479ccbc",
               url:
                 "https://api.github.com/repos/octocat/Hello-World/commits/c5b97d5ae6c19d5c5df71a34c7fbeeda2479ccbc"
             },
             zipball_url: "https://github.com/octocat/Hello-World/zipball/v0.1",
             tarball_url: "https://github.com/octocat/Hello-World/tarball/v0.1"
           } == HelperMap.safe_map_keys_to_atom(map)
  end
end
