defmodule Appricot.ProjectMembershipTest do
  use Appricot.ModelCase

  alias Appricot.ProjectMembership

  @valid_attrs %{roles: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ProjectMembership.changeset(%ProjectMembership{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ProjectMembership.changeset(%ProjectMembership{}, @invalid_attrs)
    refute changeset.valid?
  end
end
