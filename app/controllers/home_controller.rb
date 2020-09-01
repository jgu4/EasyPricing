class HomeController < ApplicationController
  def show


    render({ :template => "homes/index.html.erb" })
  end

end
