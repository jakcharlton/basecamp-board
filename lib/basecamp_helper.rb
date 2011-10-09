module BasecampHelper
  def self.todo_items_on_project(project_id)
    todo_items = []
    todo_lists = Basecamp::TodoList.find(:all, :params => { :project_id => project_id })
    todo_lists.each do |todo_list|
    	item = Basecamp::TodoItem.find(:all, :params => { :todo_list_id => todo_list.id }).flatten
        todo_items += item.map do |item| 
	        item.list_name = todo_list.name
	        item.display_title = item.content.gsub(/#inprogress/, "")
	    	item.status = get_status item
	    	item
	    end
    end
    todo_items
   end
  
  protected
  
  def self.get_status(todo_item)
  	return :done if todo_item.completed? 
  	return :in_progress if todo_item.content =~ /#inprogress/ 
  	:to_do
  end
end
