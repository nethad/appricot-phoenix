defmodule Appricot.EnvironmentController do
  use Appricot.Web, :controller
  import Ecto.Query

  alias Appricot.Environment
  alias Appricot.Project

  def index(conn, %{"project_id" => project_id}) do
    environments = (Environment
      |> where([e], e.project_id == ^project_id)
      |> Repo.all
    )

    render conn, "index.json", environments: environments
  end

  def show(conn, %{"id" => id}) do
    environment = Repo.get!(Environment, id)

    render conn, "show.json", environment: environment
  end

  def create(conn, %{"project_id" => project_id, "environment" => environment_params}) do
    project = Repo.get!(Project, project_id)

    all_params = Map.merge(environment_params, %{"project_id" => project_id})

    changeset = Environment.changeset(%Environment{}, all_params)
    IO.puts inspect all_params

    case Repo.insert(changeset) do
      {:ok, _environment} ->
        IO.puts "YAY"
        conn
        |> redirect(to: project_environment_path(conn, :index, project_id))
      {:error, changeset} ->
        conn
        |> put_status(422)
    end
  end

  def update(conn, %{"project_id" => project_id, "id" => id, "environment" => environment_params}) do
    environment = Repo.get!(Environment, id)
    changeset = Environment.changeset(environment, environment_params)

    case Repo.update(changeset) do
      {:ok, environment} ->
        conn
        |> redirect(to: project_environment_path(conn, :index, project_id))
      {:error, changeset} ->
        conn
        |> put_status(422)
    end
  end

end
