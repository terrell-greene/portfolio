defmodule PortfolioWeb.AdminController do
  use PortfolioWeb, :controller
  plug :admin_layout

  def index(conn, _params) do
    render(conn, "index.html")
  end

  defp admin_layout(conn, _opts) do
    conn
    |> put_layout({PortfolioWeb.LayoutView, "admin.html"})
  end
end
