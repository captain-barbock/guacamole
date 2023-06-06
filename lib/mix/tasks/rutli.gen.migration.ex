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
        repos -> hd(repos)
      end
    IO.inspect(ecto_repo: ecto_repo)

    IO.inspect(app_path: Mix.Project.app_path())
    IO.inspect(deps_paths: Mix.Project.deps_paths())

    rutli_path = Mix.Project.deps_paths()[:rutli]
    IO.inspect(rutli_path: rutli_path)

    Mix.shell().info("Migration done")
  end
end
