defmodule Mango.SalesTest do
  use Mango.DataCase
  
  alias Mango.{Sales, Repo}
  alias Mango.Sales.Order
  
  test "create_cart" do
    assert %Order{status: "In Cart"} = Sales.create_cart
  end
  
  test "get_cart/1" do
    cart1 = Sales.create_cart
    cart2 = Sales.get_cart(cart1.id)
    assert cart1.id == cart2.id
  end
  
  test "add_to_cart/2" do
    product = %Product{
      name: "Tomato",
      pack_size: "1 kg",
      price: 55,
      sku: "A123",
      is_seasonal: false, category: "vegetables" } |> Repo.insert!
      
      cart = Sales.create_cart
      
      {:ok, cart} = Sales.add_to_cart(cart, %{"prooduct_id" => product.id, "quantity" => "2"})
    }
  end
end