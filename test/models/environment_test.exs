defmodule Appricot.EnvironmentTest do
  use Appricot.ModelCase

  alias Appricot.Environment

  @valid_attrs %{name: "some content", root_path: "some content", servers: "some content", urls: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Environment.changeset(%Environment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Environment.changeset(%Environment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
