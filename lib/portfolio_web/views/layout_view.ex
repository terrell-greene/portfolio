defmodule PortfolioWeb.LayoutView do
  use PortfolioWeb, :view

  def nav_link(conn, path, text, icon) do
    current_path = Path.join(["/" | conn.path_info])
    active? = path == current_path

    list_styles = active_link_class?(active?)

    content_tag :li, class: list_styles do
      link(to: path, class: "nav-link") do
        active_link_content?(active?, text, icon)
      end
    end
  end

  defp active_link_class?(active?) do
    if active?, do: "nav-item active", else: "nav-item"
  end

  defp active_link_content?(active?, text, icon) do
    icon = ~E"""
      <i class="fas <%= icon %> fa-fw mr-2"></i>
    """

    content = [icon, text]

    if active? do
      content ++ content_tag(:span, "(current)", class: "sr-only")
    else
      content
    end
  end
end
