@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  $name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !$name.empty? do
    # add the student hash to the array
    add_to_students_hash
      if @students.count == 1
        puts "Now we have 1 student"
      else
        puts "Now we have #{@students.count} students"
      end
    # get another name from the user
    $name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit" # 9 because we'll be adding more items
  puts
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    puts "Accepted input:"
    puts "Input the students"
    puts
    input_students
  when "2"
    puts "Accepted input:"
    puts "Show the students"
    puts
    show_students
  when "3"
    puts "Accepted input"
    puts "Save the list to file"
    puts
    asking_for_filename
    save_student
  when "4"
    puts "Accepted input"
    puts "Load the list from file"
    puts
    asking_for_filename
    load_students(@filename)
  when "9"
    puts "Accepted input"
    puts "Exit"
    puts
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def save_student
  # open the file for writing
  file = File.open(@filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename)
  filename = @filename
  file = File.open(@filename = filename, "r")
  file.readlines.each do |line|
    $name, cohort = line.chomp.split(",")
    add_to_students_hash
  end
  file.close
end

def try_load_students
  if ARGV.empty?
    @filename = "students.csv"
  else
    @filename = ARGV[0]
  end

  if File.exists?(@filename) # if it exists
    load_students(@filename)
    puts "Loaded #{@students.count} from #{@filename}"
    puts
  else #if it doesn't exist
  puts "Sorry, #{@filename} doesn't exist."
  exit # quit the program
  end
end

def asking_for_filename
  puts "Type the name of the file or hit enter to use students.csv"
  ask_file = STDIN.gets.chomp
  if ask_file.empty? == true
    @filename = "students.csv"
  else
    @filename = ask_file
  end
end

#### exercise 14.1
# creating a new method and introducing name as a global variable

def add_to_students_hash
  @students << {name: $name, cohort: :november}
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
  puts "Overall, we have 1 great student"
  else 
  puts "Overall, we have #{@students.count} great students"
  end
end

try_load_students
interactive_menu