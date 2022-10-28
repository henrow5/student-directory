# 8. Once you complete the previous exercise, change the way the users are displayed:
# print them grouped by cohorts.
# To do this, you'll need to get a list of all existing cohorts
# (the map() method may be useful but it's not the only option),
# iterate over it and only print the students from that cohort.

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return"
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
    puts "Or to finish, just hit return"
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
  cohort = cohorts[0] if cohort.empty?
  until cohorts.include?(cohort)
    puts "Invalid entry, please enter a valid cohort or hit return if unknown"
    cohort = gets.chomp.capitalize.to_sym
    cohort = cohorts[0] if cohort.empty?
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

def print_by_cohort(students)
  puts "Please enter the cohort to display or hit return to display all students"
  cohort = gets.chomp.capitalize.to_sym
  if !cohort.empty?
    cohort_group = students.select { |student| student[:cohort] == cohort }
    print_header
    print(cohort_group)
    print_footer(cohort_group, true)
  else
    print_header
    print(students)
    print_footer(students)
  end
end

def print_footer(students, print_cohort = false)
  if print_cohort
    puts "We have #{students.count} great students in this cohort"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
print_by_cohort(students)
