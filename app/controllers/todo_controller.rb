class TodoController < ApplicationController
  include BasecampHelper

  def index
  	Basecamp.establish_connection!('thefarm1.basecamphq.com', '', '', true)
	all_todos = BasecampHelper.todo_items_on_project 8154818
	@todo = all_todos.select{|i| i.status == :to_do }
	@in_progress = all_todos.select{|i| i.status == :in_progress }
	@done = all_todos.select{|i| i.status == :done }
  end

end