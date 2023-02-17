require 'date'
id=0
events = [
  { "id" => (id = id.next),
    "start_date" => "2023-02-13T00:00:00-05:00",
    "title" => "Ruby Basics 1",
    "end_date" => "",
    "notes" => "Ruby Basics 1 notes",
    "guests" => ["Paulo", "Andre"],
    "calendar" => "web-dev" }]

# Convierte la cadena "start_date" en un objeto DateTime


# Muestra el nombre del día de la semana y la fecha en formato ISO 8601
def print_menu_cal
  puts "\n"
  puts "-" * 78
  puts "list | create | show | update | delete | next | prev | exit"
  puts "\n"
  print "action: "
  # gets.chomp.strip
end
puts print_menu_cal

require 'time'

datetime = Time.parse("2023-02-16T13:30:00-05:00") # Crea un objeto Time a partir de la cadena

hora = datetime.strftime("%H:%M:%S") # Recolecta la hora como una cadena formateada

puts hora # Imprime la hora recolectada

=begin
def print_cal
  puts "-" * 22
  puts "----------------------Welcome to CalenCLI-----------------------"

def ask_for_action_prompt
  puts "-" * 78
  puts "list | create | show | update | delete | next | prev | exit"
  puts "\n"

  print "action: "
  gets.chomp.strip #=> "add    " => "add"
end

puts start_date_time.strftime('%a %b %d')

def ask_for_action_prompt
  puts "-" * 60
  puts "add | list | completed | toggle | delete | exit"
  puts "\n"

  print "action: "
  gets.chomp.strip #=> "add    " => "add"
end

def list_todos(todos, completed: false)
  puts "#{'-' * 24}Welcome to toDOS#{'-' * 24}\n\n"

  todos.each do |todo|
    format_todo = "#{todo[:id]}. #{todo[:content]}"
    puts format_todo if todo[:completed] == completed
  end
end

def toggle_todos(ids, todos)
  ids.each do |id|
    found_todo = todos.find { |todo| todo[:id] == id }
    found_todo[:completed] = !found_todo[:completed] if found_todo
  end
end

def add_todo(todos, id, new_content)
  new_todo = { id: id, content: new_content, completed: false }
  todos.push(new_todo)
end

def delete_todos(ids, todos)
  todos.delete_if do |todo|
    ids.include?(todo[:id])
  end
end

def grab_ids
  print "todo ID(s): "
  gets.chomp.split(",").map(&:to_i)
end

def new_content
  print "content: "
  content = gets.chomp

  while content.empty?
    puts "Content cannot be empty"
    print "content: "
    content = gets.chomp
  end

  content
end
=end