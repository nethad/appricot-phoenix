defmodule Appricot.Repo.Migrations.CreateProjectMembership do
  use Ecto.Migration

  def change do
    create table(:project_memberships) do
      add :roles, {:array, :string}, default: []
      add :user_id, references(:users, on_delete: :nothing)
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
    create index(:project_memberships, [:user_id])
    create index(:project_memberships, [:project_id])

  end
end
