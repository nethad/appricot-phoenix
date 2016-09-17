defmodule Appricot.ProjectTest do
  use Appricot.ModelCase

  alias Appricot.Project

  @valid_attrs %{bug_reporting: "some content", continuous_integration: "some content", erp: "some content", key: "some content", name: "some content", project_management: "some content", repository: "some content", show_case: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Project.changeset(%Project{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Project.changeset(%Project{}, @invalid_attrs)
    refute changeset.valid?
  end
end
