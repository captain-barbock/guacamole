defmodule Mix.Tasks.Rutli.Gen.Migration do
  @shortdoc "Generates a Postgres migration file"

  use Mix.Task
  # import Mix.Ecto

  # alias Mix.Phoenix.Schema

  @doc false
  @impl Mix.Task
  def run(_args) do
    project_app = Mix.Project.config()[:app]
    IO.inspect(project_app: project_app)

    ecto_repo =
      case Application.fetch_env(project_app, :ecto_repos) do
        :error -> raise("There is no Ecto configuration")
        {:ok, repos} -> hd(repos)
      end

    IO.inspect(ecto_repo: ecto_repo)

    IO.inspect(app_path: Mix.Project.app_path())
    IO.inspect(deps_paths: Mix.Project.deps_paths())

    rutli_path = Mix.Project.deps_paths()[:rutli]
    IO.inspect(rutli_path: rutli_path)

    migration_template =
      Path.join([rutli_path, "priv", "templates", "rutli.gen.migration", "migration.exs"])

    IO.inspect(migration_template: migration_template)

    dest_path = Path.join(["priv", "migrations", timestamp() <> "_create_rutli_tables.exs"])

    assigns = [ecto_repo: ecto_repo]

    Mix.Generator.copy_template(migration_template, dest_path, assigns)

    # Mix.shell().info("Migration done")
  end

  defp timestamp() do
    NaiveDateTime.utc_now()
    |> NaiveDateTime.truncate(:second)
    |> NaiveDateTime.to_string()
    |> String.replace(["-", " ", ":"], "")
  end
end
