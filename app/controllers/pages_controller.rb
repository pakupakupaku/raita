class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to page_path(@page)
    else
      @errors = @page.errors.full_messages
      render :new
    end
  end

  def index
    @pages = Page.order(updated_at: :desc)
  end

  private

  def page_params
    params.require(:page).permit(:title, :body)
  end
end
