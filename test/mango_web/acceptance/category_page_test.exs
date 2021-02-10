defmodule Mangoeb.Acceptance.CategoryPageTest do
  use ExUnit.Case
  use Hound.Helpers
  
  hound_session()
  
  setup do
    ## GIVEN ##
    # There are two products:
    # Apple (fruit, price: 100)
    # Tomato (vegetable (even though it is technically a fruit), price: 50)
    :ok
  end
  
  test "show fruits" do
    # write test for fruits
  end
  
  test "show vegetables" do
    # write test for vegetables
  end
end
