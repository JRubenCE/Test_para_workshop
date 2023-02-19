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
    "start_date" => "2023-02-13T09:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2023-02-13T10:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-14T00:00:00-05:00",
    "title" => "Ruby Basics 2",
    "end_date" => "",
    "notes" => "Ruby Basics 2 notes",
    "guests" => ["Paulo", "Andre"],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-14T12:00:00-05:00",
    "title" => "Soft Skills - Mindsets",
    "end_date" => "2023-02-14T13:30:00-05:00",
    "notes" => "Some extra notes",
    "guests" => ["Mili"],
    "calendar" => "soft-skills" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-15T00:00:00-05:00",
    "title" => "Ruby Methods",
    "end_date" => "",
    "notes" => "Ruby Methods notes",
    "guests" => ["Paulo", "Andre"],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-15T09:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2023-02-15T10:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-16T09:00:00-05:00",
    "title" => "Summary Workshop",
    "end_date" => "2023-02-16T13:30:00-05:00",
    "notes" => "A lot of notes",
    "guests" => ["Paulo", "Andre", "Diego"],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-16T00:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-17T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-17T09:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2023-02-17T10:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-18T10:00:00-05:00",
    "title" => "Breakfast with my family",
    "end_date" => "2023-02-18T11:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-18T15:00:00-05:00",
    "title" => "Study",
    "end_date" => "2023-02-18T20:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-23T00:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-24T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
]


# events_by_date = events.group_by { |event| DateTime.parse(event["start_date"]).strftime('%a %b %d') }

# events_by_date.each do |date, events|
#   puts "#{date} #{events.map { |event| event["title"] }.join(', ')}"
# end

def list_events(events)
  puts "#{'-' * 29}Welcome to CalenCLI#{'-' * 29}\n\n"

  today = Date.today
day_of_the_week = today.wday #6
last_sunday = today - day_of_the_week

days_of_the_weeks = [] 

(1..7).each do |i|
  days_of_the_weeks.push(last_sunday + i)
end 


events_by_week = [[],[],[],[],[],[],[]]


days_of_the_weeks.each_with_index do |day,index| 

  events.each do |event|
     if day == Date.parse(event["start_date"])
      events_by_week[index].push(event)
     end 

  end
end


events_by_week_aux = []
events_by_week.each_with_index do |events_by_day, index|
  events_by_day = events_by_day.sort_by do |event|
                    DateTime.parse(event["start_date"])
                  end 
  events_by_week_aux.push(events_by_day)
end 


events_by_week = events_by_week_aux
events_by_week.each_with_index do |day,index|
  print days_of_the_weeks[index].strftime("%a %b %e")
  if events_by_week[index].empty?
    print " "*15 
    print "No events"
  else
      day.each_with_index do |day, index1|
      start_hour = DateTime.parse(day["start_date"]) 
      start_hour_string = start_hour.strftime("%H:%M")
      condition_fullday = day["end_date"] == ""

      if index1 == 0 && condition_fullday
        print " "*15
        puts "#{day["title"]} (#{day["id"]})"
      elsif index1 > 0 && !condition_fullday
       print " "*11

       end_hour = DateTime.parse(day["end_date"]) 
       end_hour_string =end_hour.strftime("%H:%M")
       print "#{start_hour_string} - #{end_hour_string} "
       puts "#{day["title"]} (#{day["id"]})"
      elsif index1 == 0 && !condition_fullday
       print " "*1
       end_hour = DateTime.parse(day["end_date"]) 
       end_hour_string =end_hour.strftime("%H:%M")
       print "#{start_hour_string} - #{end_hour_string} "
       puts "#{day["title"]} (#{day["id"]})"
      else 
       print " "*25
       puts "#{day["title"]} (#{day["id"]})"
      end
     end
  end



end
end

    # "#{event["id"]} - #{event["start_date"]}" 
  def print_menu_cal
    puts "\n"
    puts "-" * 78
    puts "list | create | show | update | delete | next | prev | exit"
    
    print "action: "
    gets.chomp.strip
  end

  def delete_events(ids, events)
    events.delete_if do |event|
      ids.include?(event["id"])
    end
  end
  def grab_ids
    print "Event ID: "
    gets.chomp.split(",").map(&:to_i)
  end
  def show_events(ids,events)
    
    found_event = events.find { |event| event["id"] == ids[0] }
    if found_event
      puts "Title: #{found_event["title"]}"
      puts "calendar: #{found_event["calendar"]}"
      unless found_event["end_date"].empty?
      puts "star_end: #{ DateTime.parse(found_event["start_date"]).strftime("%k:%M")}  #{ DateTime.parse(found_event["end_date"]).strftime("%k:%M")}" 
      else
      puts "star_end: "
      end        
      puts "notes:  #{found_event["notes"]}"
      puts "guests:  #{found_event["guests"]}"
    else
      puts "Invalid ID"
    end     
  end

  list_events(events)
  action = nil 
  while action != "exit"
    action = print_menu_cal
    case action
    when "list"                            
    #metodo: list_events(events)
    list_events(events)    

    when "create"
    # metodo: create_events(events, id=id.next,variable1,...variablex) (que seria casi lo mismo que el update)
    puts "ingrese date:"
    puts "ingrese title:"
    puts "ingrese calendar: (se puede dejar en blanco)"
    print "ingrese star_end: (se puede dejar en blanco"
    puts " para que coja todo el día)"
    puts "ingrese notes: (se puede dejar en blanco)"
    puts "ingrese guests: (se puede dejar en blanco)"
    # add_events(events,id)
    print " vuelve a mostrar el menu 'lista|create|etc"

    when "show"
    ids = grab_ids
    show_events(ids,events)
        
    when "update"
    # agarro el metodo grab_ids para obtener el id                            
    # ids = grab_ids
    #metodo: update_events(ids, events)
    ## y escribo todos los datos
    puts "ingreso el id existente"
    print "y aca recibe todos los datos"
    puts " a agregar"
    print " vuelve a mostrar el menu 'lista|create|etc"

    when "delete"
    # agarro el metodo grab_ids para obtener el id
    # ids = grab_ids
    #metodo: delete_events(ids, events)
    ids = grab_ids
    delete_events(ids, events)

    when "next"
    # no estoy seguro :v ids = grab_ids
    # deberia ser un metodo que muestre los siguientes 7 dias
    # next_events(events)
    print "se debería mostrar los siguientes 7 dias"
    puts " vuelve a mostrar el menu 'list|create|etc"

    when "prev"
    # no estoy seguro :v ids = grab_ids
    # deberia ser un metodo que muestre los siguientes 7 dias
    #prev_events(events)
    print "se debería mostrar los anteriores 7 días"
    puts " vuelve a mostrar el menu 'list|create|etc"
    when "exit"
    
    else
    puts "Invalid action"
    end
  end