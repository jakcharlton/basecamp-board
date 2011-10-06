class UsersController < ApplicationController
  def index
  end
  
  def signin
    user = User.new
    user.username = params[:username]
    user.password = params[:password]
    user.project_url = params[:project_url] + ".basecamphq.com"
    
    session[:user] = user

    redirect_to :controller => "todo"
  end

end
