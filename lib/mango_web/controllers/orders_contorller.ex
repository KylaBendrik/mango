defmodule MangoWeb.OrdersController do
  use MangoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
