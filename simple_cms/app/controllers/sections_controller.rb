class SectionsController < ApplicationController
  
 layout false
  def index
     @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => "Default"})
  end

  def create
     @section = Section.new(section_params)
    if @section.save 
      flash[:notice] = "Section create successfully"
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      # if update succed, redirect to index action
      flash[:notice] = "section updated successfully"
      redirect_to(:action => 'show', :id => @section.id)
    else
      # if update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section '#{section.name}' destroyed successfully"
    redirect_to(:action => 'index')
  end

  protected
    def section_params
      params.require(:section).permit(:name, :position, :visible, :page_id, :content, :content_type)
    end
end
