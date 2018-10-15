class HomeController < ApplicationController
  def index
    @pagy, @galleries = pagy(Gallery.all.default_order, items: 40)
  end

  def terms; end

  def privacy; end
end
