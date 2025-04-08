class Admin::GigsController < Admin::BaseController
  before_action :set_gig, only: [:show, :edit, :update, :destroy]
  
  def index
    @gigs = Gig.all.order(date: :desc)
  end
  
  def show
  end
  
  def new
    @gig = Gig.new
  end
  
  def create
    @gig = Gig.new(gig_params)
    
    if @gig.save
      redirect_to admin_gig_path(@gig), notice: 'Gig was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @gig.update(gig_params)
      redirect_to admin_gig_path(@gig), notice: 'Gig was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @gig.destroy
    redirect_to admin_gigs_path, notice: 'Gig was successfully deleted.'
  end
  
  private
  
  def set_gig
    @gig = Gig.find(params[:id])
  end
  
  def gig_params
    params.require(:gig).permit(
      :title, :date, :start_time, :end_time, :description, 
      :price, :ticket_url, :slug, :series_id,
      :main_image, :thumbnail_image, :banner_image,
      :headline, :subheadline, :published
    )
  end
end