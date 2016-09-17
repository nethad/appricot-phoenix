defmodule Appricot.ProjectController do
  use Appricot.Web, :controller

  alias Appricot.Project

  # def index(conn, _params) do
  #   projects = Repo.all(Project)
  #   render conn, "index.json", project: project
  # end

  def show(conn, %{"id" => id}) do
    project = Repo.get!(Project, id)

    render conn, "show.json", project: project
  end

end
