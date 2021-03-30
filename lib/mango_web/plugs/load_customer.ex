defmodule MangoWeb.Plugs.LoadCustomer do
  def init(_opts), do: nil
  
  def call(%Plug.Conn{} = conn, _opts) do
    conn
  end
end
