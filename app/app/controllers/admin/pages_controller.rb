class Admin::PagesController < Admin::BaseController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  
  def index
    @pages = Page.all.order(:title)
  end
  
  def show
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(page_params)
    
    if @page.save
      # If setting as home page, update other pages
      @page.set_as_home if @page.home
      
      redirect_to admin_page_path(@page), notice: 'Page was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @page.update(page_params)
      # If setting as home page, update other pages
      @page.set_as_home if @page.home
      
      redirect_to admin_page_path(@page), notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @page.destroy
    redirect_to admin_pages_path, notice: 'Page was successfully deleted.'
  end
  
  private
  
  def set_page
    @page = Page.find(params[:id])
  end
  
  def page_params
    params.require(:page).permit(:title, :slug, :content, :description, :home, :published)
  end
end