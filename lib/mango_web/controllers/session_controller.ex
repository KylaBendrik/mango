defmodule MangoWeb.SessionController do
  use MangoWeb, :controller
  
  def new(conn, _params) do
    render(conn, "new.html")
  end
  
  def create(conn, %{"session" => session_params}) do
    # check and load the customer matching the given credentials
    # if customer found, put the customer id on session data
    # if not found return to login page with error
  end
end
