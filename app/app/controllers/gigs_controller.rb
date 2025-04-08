class GigsController < ApplicationController
  def index
    @gigs = Gig.upcoming.where(published: true)
    @past_gigs = Gig.past.where(published: true).limit(5)
  end
  
  def show
    @gig = Gig.find_by(slug: params[:id])
    
    unless @gig
      # Gig not found
      raise ActionController::RoutingError.new('Not Found')
    end
    
    # Related gigs (same series or similar date)
    if @gig.series
      @related_gigs = @gig.series.gigs.where.not(id: @gig.id).where(published: true).limit(3)
    else
      @related_gigs = Gig.where.not(id: @gig.id)
                        .where('date >= ?', @gig.date - 1.month)
                        .where('date <= ?', @gig.date + 1.month)
                        .where(published: true)
                        .limit(3)
    end
  end
  
  def series
    @series = Series.find_by(slug: params[:id])
    
    unless @series
      # Series not found
      raise ActionController::RoutingError.new('Not Found')
    end
    
    @gigs = @series.gigs.upcoming.where(published: true)
    @past_gigs = @series.gigs.past.where(published: true).limit(5)
  end
end