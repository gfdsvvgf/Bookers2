class HomesController < ApplicationController
  def top
  end


  def about
  end
  
  def create
   flash[:notice] = "successfully" 
  end
  
  def update
    flash[:notice] = "successfully"
  end
  
  
  
end
