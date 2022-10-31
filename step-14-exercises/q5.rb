# 5. The filename we use to save and load data (menu items 3 and 4) is hardcoded.
# Make the script more flexible by asking for the filename if the user chooses these menu items.

@students = []
@default_file = "students.csv" # added a variable for the default save and load file

# method for loading from a file
def load_file
  puts "Please enter the name of the file to load or hit return to go back"
  file = STDIN.gets.chomp
  return if file.empty?
  while !File.file?(file)
    puts "File not found. Please enter a valid filename or hit return to go back"
    file = STDIN.gets.chomp
    return if file.empty?
  end
  load_students(file)
end

# method for saving to a file
def save_file
  puts "Please enter a filename to save or hit return to go back"
  file = STDIN.gets.chomp
  return if file.empty?
  save_students(file)
end

def add_students(name, cohort = :november)
  @students << { name: name, cohort: cohort.to_sym }
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

# updated print_menu and process methods to reflect the added functionalities
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "5. Save the list to #{@default_file}"
  puts "6. Load the list from #{@default_file}"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1" then input_students
  when "2" then show_students
  when "3" then save_file
  when "4" then load_file
  when "5" then save_students
  when "6" then load_students
  when "9"
    puts "Exiting..."
    exit
  else puts "I don't know what you meant, try again"
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty?
    add_students(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def save_students(filename = @default_file)
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Saved #{@students.count} to #{filename}"
end

def load_students(filename = @default_file)
  file = File.open(filename, "r")
  # @students array is cleared before load or otherwise students loaded from a file will be added to the students currently in the array.
  @students = []
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_students(name, cohort)
  end
  file.close
  puts "Loaded #{@students.count} from #{filename}"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exist?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
