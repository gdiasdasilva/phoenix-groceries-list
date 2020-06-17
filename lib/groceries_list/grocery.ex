defmodule GroceriesList.Grocery do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groceries" do
    field :name, :string
    field :quantity, :integer, default: 0
    field :complete, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(grocery, attrs \\ %{}) do
    grocery
    |> cast(attrs, [:name, :quantity])
    |> validate_required(:name)
    |> validate_length(:name, min: 3)
    |> validate_length(:name, max: 40)
  end
end
