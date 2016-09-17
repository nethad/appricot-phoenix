defmodule Appricot.Repo.Migrations.AddCategoriesToProjects do
  use Ecto.Migration

  def change do
    alter table(:projects) do
      add :categories, {:array, :string}, default: []
    end
  end
end
