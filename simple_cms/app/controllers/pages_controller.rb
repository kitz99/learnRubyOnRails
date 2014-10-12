class PagesController < ApplicationController

  layout false

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
     @page = Page.new({:name => "Default"})
  end

  def create
    @page = Page.new(page_params)
    if @page.save 
      flash[:notice] = "Page create successfully"
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      # if update succed, redirect to index action
      flash[:notice] = "Page updated successfully"
      redirect_to(:action => 'show', :id => @page.id)
    else
      # if update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}' destroyed successfully"
    redirect_to(:action => 'index')
    
  end

  protected
    def page_params
      params.require(:page).permit(:name, :position, :visible, :subject_id, :permalink)
    end
end
