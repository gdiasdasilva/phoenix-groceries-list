defmodule GroceriesListWeb.GroceryController do
  use GroceriesListWeb, :controller

  alias GroceriesList.{Grocery, Repo}

  def index(conn, _params) do
    groceries = Repo.all(Grocery)

    conn
    |> assign(:groceries, groceries)
    |> render(:index)
  end

  def new(conn, _params) do
    changeset = Grocery.changeset(%Grocery{})

    conn
    |> assign(:changeset, changeset)
    |> render(:new)
  end

  def create(conn, params) do
    # should persist a grocery
  end

  def delete(conn, params) do
    # should delete a grocery
  end
end
