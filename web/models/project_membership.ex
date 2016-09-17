defmodule Appricot.ProjectMembership do
  use Appricot.Web, :model

  schema "project_memberships" do
    field :roles, {:array, :string}
    belongs_to :user, Appricot.User
    belongs_to :project, Appricot.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:roles, :user_id, :project_id])
    |> validate_required([:roles, :user_id, :project_id])
  end
end
