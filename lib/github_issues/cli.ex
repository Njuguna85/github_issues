defmodule GithubIssues.Cli do
  @default_count 4

  @moduledoc """
  Handle cli parsing and dispatch to the various functions
  that end up generating a table of the last _n_ issues in a
  github project
  """

  def run(args) do
    parse_args(args)
  end

  @doc """
    `argv` can be -h or --help, which returns :help

    Otherwise it is a github username, project name and optionally
    the number of entries to format

    Return a tuple of `{user, project, count}`, or `:help` if help was given
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      {[help: true], _, _} -> :help
      {_, [user, project, count], _} -> {user, project,String.to_integer(count)}
      {_, [user, project], _} -> {user, project, @default_count}
      _ -> :help
    end
  end
end
