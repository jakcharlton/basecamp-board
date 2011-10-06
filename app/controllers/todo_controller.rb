class TodoController < ApplicationController
  include BasecampHelper

  def index
    begin
      user = session[:user]
      p user
  	  Basecamp.establish_connection!(user.project_url, user.username, user.password, true)
	  rescue ActiveResource::UnauthorizedAccess
	    redirect_to :controller => "users", :action => "index"
    end
  
    all_todos = BasecampHelper.todo_items_on_project 8154818
    @todo = all_todos.select{|todo| todo.status == :to_do }
    @in_progress = all_todos.select{|todo| todo.status == :in_progress }
    @done = all_todos.select{|todo| todo.status == :done }
  end

end
