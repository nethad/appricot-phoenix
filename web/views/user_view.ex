defmodule Appricot.UserView do
  use Appricot.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Appricot.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    render_one(user, Appricot.UserView, "user.json")
  end

  def render("user.json", %{user: user}) do
    %{
      href: Appricot.Router.Helpers.user_url(Appricot.Endpoint, :show, user.id),
      id: user.id,
      name: user.name,
      email: user.email
    }
  end
end
