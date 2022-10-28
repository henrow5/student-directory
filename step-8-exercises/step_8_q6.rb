# 6. Research how the method center() of the String class works.
# Use it in your code to make the output beautifully aligned.

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty?
    # add the student hash to the array
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

# question 6 solution
# centers output relative to the open terminal window width value from IO.console.winsize[1]
def center_output(output)
  require "io/console"
  output.center(IO.console.winsize[1])
end

def print_header
  puts center_output("The students of Villains Academy")
  puts center_output("-------------")
end

def print(students)
  students.each do |student|
    puts center_output("#{student[:name]} (#{student[:cohort]} cohort)")
  end
end

def print_footer(students)
  puts center_output("Overall, we have #{students.count} great students")
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
