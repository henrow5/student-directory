# 7. In the input_students method the cohort value is hard-coded.
# How can you ask for both the name and the cohort?
# What if one of the values is empty?
# Can you supply a default value?
# The input will be given to you as a string?
# How will you convert it to a symbol?
# What if the user makes a typo?

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp.capitalize

  while !name.empty?
    # get cohort
    puts "Please enter the cohort of the student"
    puts "Or hit return if unknown"
    cohort = get_cohort
    students << { name: name, cohort: cohort }
    puts "Now we have #{students.count} students"
    puts "Please enter the name of another student"
    puts "Or to finish, just hit return twice"
    name = gets.chomp.capitalize
  end
  students
end

def get_cohort
  cohorts = [
    :Unknown,
    :January,
    :February,
    :March,
    :April,
    :May,
    :June,
    :July,
    :August,
    :September,
    :October,
    :November,
    :December,
  ]

  cohort = gets.chomp.capitalize.to_sym
  if cohort.empty?
    cohort = cohorts[0]
  else
    until cohorts.include?(cohort)
      puts "Invalid entry, please enter a valid cohort or hit return if unknown"
      cohort = gets.chomp.capitalize.to_sym
      cohort = cohorts[0] if cohort.empty?
    end
  end
  cohort
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
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
