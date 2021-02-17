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
    ## WHEN ##
    # I navigate to the fruits page
    navigate_to("/categories/fruits")
    
    ## THEN ##
    # I expect the page title to be "Fruits"
    page_title = find_element(:css, ".page-title") 
      |> visible_text()
      
    assert page_title == "Fruits"
    
    # And I expect Apple in the products displayed
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name")
      |> visible_text()
    product_price = find_within_element(product, :css, ".product-price")
      |> visible_text()
      
    assert product_name == "Apple"
    assert product_price == "100"
    
    # And I expect that Tomato is not present on screen
    refute page_source() =~ "Tomato"
  end
  
  test "show vegetables" do
    ## WHEN ##
    # I navigate to the vegetables page
    navigate_to("/categories/vegetables")
    
    ## THEN ##
    # I expect the page title to be "Vegetables"
    page_title = find_element(:css, ".page-title") 
      |> visible_text()
      
    assert page_title == "Vegetables"
    
    # And I expect Tomato in the products displayed
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name")
      |> visible_text()
    product_price = find_within_element(product, :css, ".product-price")
      |> visible_text()
      
    assert product_name == "Tomato"
    assert product_price == "50"
    
    # And I expect that Apple is not present on screen
    refute page_source() =~ "Apple"
  end
end
