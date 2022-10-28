# 5. Our code only works with the student name and cohort.
# Add more information: hobbies, country of birth, height, etc.

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp

  # question 5 solution
  while !name.empty?
    # get country
    puts "Please enter the country of the student"
    country = gets.chomp
    # get height
    puts "Please enter the height of the student in meters"
    height = gets.chomp
    # get hobbies
    puts "Please enter the hobbies of the student"
    hobbies = gets.chomp
    students << { name: name, country: country, height: height, hobbies: hobbies, cohort: :november }
    puts "Now we have #{students.count} students"
    puts "Please enter the name of another student"
    puts "Or to finish, just hit return twice"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "Name: #{student[:name]}, Country: #{student[:country]}, Height: #{student[:height]}, Hobbies: #{student[:hobbies]} (#{student[:cohort]} cohort)"  # question 5 solution
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
