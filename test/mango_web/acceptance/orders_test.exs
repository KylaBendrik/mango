defmodule MangoWeb.Acceptance.OrdersTest do
  use Mango.DataCase
  use Hound.Helpers
  hound_session()

  @doc"""
  when login as user you can chick on orders tab in the nav bar


  """

  test "view my_orders" do
    
    conn
    navigate_to("/orders")

    page_title =
      find_element(:css, ".page-title")
      |> visible_text()

    assert page_title == "My Orders"

    # orders = find_element(:css, ".orders")

  end
end
