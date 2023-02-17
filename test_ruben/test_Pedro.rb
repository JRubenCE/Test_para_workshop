require "date"

# DATA
id = 0
events = [
  { "id" => (id = id.next),
    "start_date" => "2023-02-13T00:00:00-05:00",
    "title" => "Ruby Basics 1",
    "end_date" => "",
    "notes" => "Ruby Basics 1 notes",
    "guests" => ["Paulo", "Andre"],
    "calendar" => "web-dev" },
    { "id" => (id = id.next),
    "start_date" => "2023-02-24T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" }]


    # Convierte la cadena "start_date" en un objeto DateTime
    events.each do |event|
        puts "#{event["id"]} - #{event["start_date"]}"
        
    # start_date_time = DateTime.parse(events[0]["start_date"]) 
   
    # time_events  = start_date_time.strftime('%a %b %d')
    # puts time_events
    end 
    # Muestra el nombre del día de la semana y la fecha en formato ISO 8601
    

# todos.each do |todo|
# format_todo = "#{todo[:id]}. #{todo[:content]}"
# puts format_todo if todo[:completed] == completed
# end
    


