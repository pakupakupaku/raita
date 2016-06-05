class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end
end
