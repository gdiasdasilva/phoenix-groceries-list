defmodule GroceriesList.Repo.Migrations.CreateGroceries do
  use Ecto.Migration

  def change do
    create table(:groceries) do
      add :name, :string
      add :quantity, :integer, default: 0
      add :complete, :boolean, default: false

      timestamps()
    end

  end
end
