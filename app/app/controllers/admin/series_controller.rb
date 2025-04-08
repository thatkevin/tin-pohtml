class Admin::SeriesController < Admin::BaseController
  before_action :set_series, only: [:show, :edit, :update, :destroy]
  
  def index
    @series = Series.all.order(:name)
  end
  
  def show
  end
  
  def new
    @series = Series.new
  end
  
  def create
    @series = Series.new(series_params)
    
    if @series.save
      redirect_to admin_series_path(@series), notice: 'Series was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @series.update(series_params)
      redirect_to admin_series_path(@series), notice: 'Series was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    if @series.gigs.any?
      redirect_to admin_series_path(@series), alert: 'Cannot delete a series that has gigs. Remove the gigs first or reassign them.'
    else
      @series.destroy
      redirect_to admin_series_index_path, notice: 'Series was successfully deleted.'
    end
  end
  
  private
  
  def set_series
    @series = Series.find(params[:id])
  end
  
  def series_params
    params.require(:series).permit(:name, :description, :slug, :logo)
  end
end