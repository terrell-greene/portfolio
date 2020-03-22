defmodule PortfolioWeb.LayoutView do
  use PortfolioWeb, :view

  def nav_link(conn, path, text) do
    current_path = Path.join(["/" | conn.path_info])
    active? = path == current_path

    list_styles = active_link_class?(active?)

    content_tag :li, class: list_styles do
      link(to: path, class: "nav-link") do
        active_link_content?(active?, text)
      end
    end
  end

  defp active_link_class?(active?) do
    if active?, do: "nav-item active", else: "nav-item"
  end

  defp active_link_content?(active?, text) do
    if active? do
      [
        text,
        content_tag(:span, "(current)", class: "sr-only")
      ]
    else
      text
    end
  end
end
