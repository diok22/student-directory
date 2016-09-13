def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do	
	# add the student hash to the array
	students << {name: name, cohort: :november}
	# get another name from the user
	name = gets.chomp
	end
	# return the array of students
	students
end

def print_header
	puts "The students of Villains Academy"
	puts "-------------"
end

def print(students)
	# students = the students array
	# counter = index
	counter = 0
	while counter < students.length
		student = students[counter]
		puts "#{counter+1}. #{student[:name]} (#{student[:cohort]} cohort)"
		counter += 1
	end
end

def print_footer(students)
	puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)