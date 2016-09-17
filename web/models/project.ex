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

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:key, :name, :continuous_integration, :project_management, :bug_reporting, :repository, :erp, :show_case])
    |> validate_required([:key, :name])
  end
end
