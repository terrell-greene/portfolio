defmodule PortfolioWeb.PageView do
  use PortfolioWeb, :view

  def render("scripts.index.html", _assigns) do
    ~E"""
    <script src="/plugins/owlcarousel/owl.carousel.min.js"></script>
     <script src="/js/testimonials.js"></script>
    """
  end
end
