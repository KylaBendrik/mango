defmodule MangoWeb.SessionController do
  use MangoWeb, :controller
  
  def new(conn, _params) do
    render(conn, "new.html")
  end
  
  def create(conn, %{"session" => session_params}) do
    # check and load the customer matching the given credentials
    # if customer found, put the customer id on session data
    # if not found return to login page with error
    case CRM.get_customer_by_credentials(session_params) do
      :error ->
        conn
        |> put_flast(:error, "Invalid username/password combination")
        |> render("new.html")
      customer ->
        conn
        |> assign(:current_customer, customer)
        |> put_session(:customer_id, customer.id)
        |> configure_session(renew: true)
        |> put_flash(:info, "Login successful")
        |> redirect(to: page_path(conn, :index))
    end
  end
end
