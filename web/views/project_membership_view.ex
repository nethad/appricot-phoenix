defmodule Appricot.ProjectMembershipView do
  use Appricot.Web, :view

  def render("index.json", %{project_memberships: project_memberships}) do
    %{data: render_many(project_memberships, Appricot.ProjectMembershipView, "project_membership.json")}
  end

  def render("project_membership.json", %{project_membership: project_membership}) do
    %{
      id: project_membership.id,
      roles: project_membership.roles,
      name: project_membership.user.name,
      email: project_membership.user.email,
      href: Appricot.Router.Helpers.user_url(Appricot.Endpoint, :show, project_membership.user.id)
    }
  end

end
