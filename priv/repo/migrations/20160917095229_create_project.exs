defmodule Appricot.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :key, :string
      add :name, :string
      add :continuous_integration, :string
      add :project_management, :string
      add :bug_reporting, :string
      add :repository, :string
      add :erp, :string
      add :show_case, :string

      timestamps()
    end

  end
end
