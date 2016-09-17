defmodule Appricot.EnvironmentView do
  use Appricot.Web, :view

  def render("index.json", %{environments: environments}) do
    %{data: render_many(environments, Appricot.EnvironmentView, "environment.json")}
  end

  def render("show.json", %{environment: environment}) do
    render_one(environment, Appricot.EnvironmentView, "environment.json")
  end

  def render("environment.json", %{environment: environment}) do
    %{
      href: Appricot.Router.Helpers.project_environment_url(Appricot.Endpoint, :show, environment.project_id, environment.id),
      id: environment.id,
      name: environment.name,
      servers: environment.servers,
      urls: environment.urls,
      root_path: environment.root_path,
      ruby_version: "2.1.6.lol",
      rails_version: "4.0.20.lol"
    }
  end

end
