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

  def create(conn, %{"grocery" => params}) do
    changeset = Grocery.changeset(%Grocery{}, params)

    case Repo.insert(changeset) do
      {:ok, grocery} ->
        conn
        |> put_flash(:info, "#{grocery.name} successfully added.")
        |> redirect(to: Routes.grocery_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "There was an error while creating the grocery.")
        |> render(:new, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    Repo.get!(Grocery, id) |> Repo.delete!

    conn
    |> put_flash(:info, "Grocery successfully deleted.")
    |> redirect(to: Routes.grocery_path(conn, :index))
  end
end
