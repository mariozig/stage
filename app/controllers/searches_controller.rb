class SearchesController < ApplicationController
  def index
    # For now assume galleries because we search nothing else.  If we move to more
    # searchables then this could become parameterized.
    query = params[:q].presence || '*'
    @galleries = Gallery.search(query)
  end
end
