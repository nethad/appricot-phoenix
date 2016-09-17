defmodule Appricot.ProjectController do
  use Appricot.Web, :controller
  import Ecto.Query

  alias Appricot.Project

  def index(conn, %{"query" => query}) do
    projects = (
      Project
      |> where([p], ilike(p.name, ^"%#{query}%"))
      |> Repo.all
      |> Repo.preload([:environments, project_memberships: :user])
    )
    render conn, "index.json", projects: projects
  end

  def index(conn, _params) do
    projects = Repo.all(Project) |> Repo.preload([:environments, project_memberships: :user])
    render conn, "index.json", projects: projects
  end

  def show(conn, %{"id" => id}) do
    project = Repo.get!(Project, id) |> Repo.preload([:environments, project_memberships: :user])

    render conn, "show.json", project: project
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Repo.get!(Project, id)
    changeset = Project.changeset(project, project_params)

    case Repo.update(changeset) do
      {:ok, project} ->
        conn
        |> redirect(to: project_path(conn, :show, project))
      {:error, changeset} ->
        conn
        |> put_status(422)
    end
  end

  def create(conn, %{"project" => project_params}) do
    changeset = Project.changeset(%Project{}, project_params)

    case Repo.insert(changeset) do
      {:ok, _project} ->
        conn
        |> redirect(to: project_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_status(422)
    end
  end

end
