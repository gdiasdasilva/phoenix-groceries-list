defmodule GroceriesListWeb.GroceryController do
  use GroceriesListWeb, :controller

  alias GroceriesList.{Grocery, Repo}
  require Ecto.Query

  def index(conn, _params) do
    groceries = Grocery |> Ecto.Query.order_by([asc: :complete, asc: :name] ) |> Repo.all()

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

  def add(conn, %{"grocery_id" => id}) do
    grocery = Repo.get!(Grocery, id)

    grocery
    |> Grocery.changeset(%{quantity: grocery.quantity + 1})
    |> Repo.update()

    redirect(conn, to: Routes.grocery_path(conn, :index))
  end

  def subtract(conn, %{"grocery_id" => id}) do
    grocery = Repo.get!(Grocery, id)

    grocery
    |> Grocery.changeset(%{quantity: grocery.quantity - 1})
    |> Repo.update()

    redirect(conn, to: Routes.grocery_path(conn, :index))
  end

  def complete(conn, %{"grocery_id" => id}) do
    Repo.get!(Grocery, id) |> Grocery.changeset(%{complete: true}) |> Repo.update()

    IO.inspect(Repo.get!(Grocery, id))
    redirect(conn, to: Routes.grocery_path(conn, :index))
  end
end
