defmodule PortfolioWeb.ContactView do
  use PortfolioWeb, :view

  def render("scripts.index.html", _assigns) do
    ~E"""
      <script src="/plugins/jquery-validation/jquery.validate.min.js"></script>
      <script src="/js/form.js"></script>
    """
  end
end
