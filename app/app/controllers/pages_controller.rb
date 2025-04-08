class PagesController < ApplicationController
  def show
    @page = if params[:id]
      Page.find_by(slug: params[:id])
    else
      Page.home
    end
    
    unless @page
      # Page not found
      raise ActionController::RoutingError.new('Not Found')
    end
  end
  
  def home
    @page = Page.home
    @upcoming_gigs = Gig.upcoming.limit(3)
    
    render :show
  end
end