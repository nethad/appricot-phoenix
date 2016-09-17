defmodule Appricot.RootView do
  use Appricot.Web, :view

  def render("index.json", _params) do
    %{
      projects: %{
        href: Appricot.Router.Helpers.project_url(Appricot.Endpoint, :index)
      },
      users: %{
        href: Appricot.Router.Helpers.user_url(Appricot.Endpoint, :index)
      }
    }
  end

end
