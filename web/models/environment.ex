defmodule Appricot.Environment do
  use Appricot.Web, :model

  schema "environments" do
    field :name, :string
    field :servers, {:array, :string}
    field :urls, {:array, :string}
    field :root_path, :string
    belongs_to :project, Appricot.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :servers, :urls, :root_path, :project_id])
    |> validate_required([:name, :servers, :urls, :root_path, :project_id])
  end
end
