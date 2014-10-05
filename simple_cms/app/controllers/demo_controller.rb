class DemoController < ApplicationController
 
  layout false
  
  def index
  	# render(:template => 'demo/hello')
  end

  def hello
  	# render(:template => 'demo/index')
  	@array = [1,2,3,4,5]
  	@id = params[:id];
  	@page = params[:page]
  	
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end

  def google
  	redirect_to("http://google.com")
  end


end
