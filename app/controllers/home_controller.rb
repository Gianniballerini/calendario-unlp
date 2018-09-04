class HomeController < ApplicationController
  def index
  	@careers = Career.all
	@years = Year.all
  end


  private

   

end
