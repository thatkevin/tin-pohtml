class Admin::DashboardController < Admin::BaseController
  def index
    @upcoming_gigs = Gig.upcoming.limit(5)
    @recent_pages = Page.order(updated_at: :desc).limit(5)
    @series_count = Series.count
  end
end