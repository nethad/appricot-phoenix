defmodule Appricot.Project do
  use Appricot.Web, :model

  schema "projects" do
    field :key, :string
    field :name, :string
    field :continuous_integration, :string
    field :project_management, :string
    field :bug_reporting, :string
    field :repository, :string
    field :erp, :string
    field :show_case, :string
    field :categories, {:array, :string}

    has_many :environments, Appricot.Environment
    many_to_many :users, Appricot.User, join_through: "project_memberships"
    has_many :project_memberships, Appricot.ProjectMembership

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:key, :name, :continuous_integration, :project_management, :bug_reporting, :repository, :erp, :show_case, :categories])
    |> validate_required([:key, :name])
  end
end
