# test that the option parser successfully detects the
# -h and --help options and it returns the arguments
# check that it supplies a default value for the count
# if only 2 args are given

defmodule CliTest do
  use ExUnit.Case
  doctest GithubIssues

  import GithubIssues.Cli, only: [parse_args: 1]

  test ":help return by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
  end

  test "count is defaulted if two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end
end
