defmodule PortfolioWeb.PortfolioView do
  use PortfolioWeb, :view

  def render("scripts.index.html", _assigns) do
    ~E"""
      <script src="/plugins/imagesloaded.pkgd.min.js"></script>
      <script src="/plugins/isotope.pkgd.min.js"></script>
      <script src="/js/isotope-custom.js"></script>
    """
  end

  def project_card(conn, filters, img_src, heading, description, client) do
    content_tag :div, class: "isotope-item col-md-6 mb-5 #{filters}" do
      content_tag :div, class: "card project-card" do
        [
          card_content(conn, img_src, heading, description, client),
          link_mask()
        ]
      end
    end
  end

  def card_content(conn, img_src, heading, description, client) do
    img =
      content_tag :div, class: "col-lg-4 card-img-holder" do
        tag(:img,
          src: Routes.static_path(conn, img_src),
          class: "card-img",
          alt: "image"
        )
      end

    body =
      content_tag :div, class: "col-lg-8" do
        content_tag :div, class: "card-body" do
          [
            content_tag(:h5, heading),
            content_tag(:p, description, class: "card-text"),
            content_tag(:p, class: "card-text") do
              content_tag(:small, "Client: #{client}", class: "text-muted")
            end
          ]
        end
      end

    content_tag :div, class: "row no-gutters" do
      [img, body]
    end
  end

  def link_mask do
    link_mask_link = link("", to: "/")

    link_mask_text =
      content_tag :div, class: "link-mask-text" do
        link to: "/", class: "btn btn-secondary" do
          [
            ~E"""
              <i class="fas fa-eye mr-2"></i>
            """,
            "View Case Study"
          ]
        end
      end

    content_tag :div, class: "link-mask" do
      [
        link_mask_link,
        link_mask_text
      ]
    end
  end
end
