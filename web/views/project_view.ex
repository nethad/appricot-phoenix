defmodule Appricot.ProjectView do
  use Appricot.Web, :view


  # def render("show.json", %{project: project}) do
  #   %{render_one(project, Appricot.ProjectView, "project.json")}
  # end

  def render("show.json", %{project: project}) do
    render_one(project, Appricot.ProjectView, "project.json")
  end

  def render("project.json", %{project: project}) do
    %{
      key: project.key,
      name: project.name,
      continuous_integration: project.continuous_integration,
      project_management: project.project_management,
      bug_reporting: project.bug_reporting,
      repository: project.repository,
      erp: project.erp,
      show_case: project.show_case
    }
  end

end
