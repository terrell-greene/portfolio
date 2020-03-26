defmodule PortfolioWeb.BlogView do
  use PortfolioWeb, :view

  def blog_post_card(conn, img_src, title, text) do
    img =
      tag(
        :img,
        class: "card-img-top",
        alt: "image",
        src: Routes.static_path(conn, img_src)
      )

    footer =
      content_tag :div, class: "card-footer" do
        content_tag(:small, "Published 2 days ago", class: "text-muted")
      end

    content_tag :div, class: "col-md-4 mb-3" do
      content_tag :div, class: "card blog-post-card" do
        [
          img,
          card_body(conn, title, text),
          footer
        ]
      end
    end
  end

  def card_body(conn, title, text) do
    title =
      content_tag :h5, class: "card-title" do
        link(title, to: "#", class: "theme-link")
      end

    text = content_tag(:p, text, class: "card-text")

    link =
      content_tag :p, class: "" do
        link(to: "#", class: "more-link") do
          ~E"""
           Read more &rarr;
          """
        end
      end

    content_tag :div, class: "card-body" do
      [title, text, link]
    end
  end
end
