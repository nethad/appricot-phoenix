defmodule Appricot.ProjectView do
  use Appricot.Web, :view

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, Appricot.ProjectView, "project.json")}
  end

  def render("show.json", %{project: project}) do
    render_one(project, Appricot.ProjectView, "project.json")
  end

  def render("project.json", %{project: project}) do
    %{
      href: Appricot.Router.Helpers.project_url(Appricot.Endpoint, :show, project.id),
      id: project.id,
      key: project.key,
      name: project.name,
      categories: project.categories,
      environments: render_many(project.environments, Appricot.EnvironmentView, "environment.json"),
      members: render_many(project.project_memberships, Appricot.ProjectMembershipView, "project_membership.json"),
      continuous_integration: project.continuous_integration,
      slack_channel: %{
        uri: "slack://channel?team=team&id=SOMEID",
        name: "#project"
      },
      project_management: project.project_management,
      bug_reporting: project.bug_reporting,
      repository: project.repository,
      erp: project.erp,
      show_case: project.show_case
    }
  end

end
