class SearchController < ApplicationController

  def index
    # binding.pry
    render locals: { facade: StudentSearchFacade.new(params[:house]) }
  end


end
