defmodule MangoWeb.CartController do
  use MangoWeb, :controller
  alias Mango.Sales
  alias Mango.Catalog

  def add(conn, %{"cart" => cart_params}) do
    cart = conn.assigns.cart
    case Sales.add_to_cart(cart, cart_params) do
      {:ok, _} ->
        %{"product_name" => name, "pack_size" => size, "quantity" => qty } = cart_params
        message = "Product added to cart - #{name}(#{size}) x #{qty} qty"

        conn
        |> put_flash(:info, message)
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:info, "Error adding product to cart")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def show(conn, _params) do
    cart = conn.assigns.cart
    cart_changeset = Sales.change_cart(cart)
    products = Catalog.list_seasonal_products(3)
    render conn, "show.html", cart: cart, cart_changeset: cart_changeset, products: products
  end

  def update(conn, %{"order" => cart_params}) do
    cart = conn.assigns.cart
    case Sales.update_cart(cart, cart_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Cart updated successfully")
        |> redirect(to: Routes.cart_path(conn, :show))
      {:error,e} ->
        conn
        |> put_flash(:info, "Error updating cart#{inspect e}")
        |> redirect(to: Routes.cart_path(conn, :show))
    end
  end
end
