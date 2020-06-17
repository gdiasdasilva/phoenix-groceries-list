defmodule GroceriesList.Repo do
  use Ecto.Repo,
    otp_app: :groceries_list,
    adapter: Ecto.Adapters.Postgres
end
