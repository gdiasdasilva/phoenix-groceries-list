defmodule GroceriesListWeb.GroceryController do
  use GroceriesListWeb, :controller

  alias GroceriesList.{Grocery, Repo}

  def index(conn, _params) do
    groceries = Repo.all(Grocery)

    conn
    |> assign(:groceries, groceries)
    |> render("index.html")
  end

  def new(conn, _params) do
    # should show the groceries form
  end

  def create(conn, params) do
    # should persist a grocery
  end

  def delete(conn, params) do
    # should delete a grocery
  end
end
