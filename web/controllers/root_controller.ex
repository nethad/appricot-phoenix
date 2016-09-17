defmodule Appricot.RootController do
  use Appricot.Web, :controller

  def index(conn, _params) do
    render conn, "index.json", %{}
  end

end
