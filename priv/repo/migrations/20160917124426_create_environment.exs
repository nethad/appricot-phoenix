defmodule Appricot.Repo.Migrations.CreateEnvironment do
  use Ecto.Migration

  def change do
    create table(:environments) do
      add :name, :string
      add :servers, {:array, :string}, default: []
      add :urls, {:array, :string}, default: []
      add :root_path, :string
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
    create index(:environments, [:project_id])

  end
end
