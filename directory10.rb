@students = [] # emty array accesible to all methods

def interactive_menu
	loop do
	print_menu
	process(gets.chomp)
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "9. Exit" #
end

def show_students
	print_header
	print_students_list(@students)
	print_footer(@students)
end

def process(selection)
	case selection
	when "1"
		input_students
	when "2"
		show_students
	when "9"
		exit
	else
		puts "I don't know what you mean, try again"
	end
end

def input_students
	puts "Please enter the the information about the students and hit return"
	# create an empty array
	#@students = []
	# creating a while loop that will add the information to the students array
	# otherwise break the loop and remove the last student

	loop do
		# create a defaul student hash with the default values
		# in case there is no input.
		student_hash = {name: "Unknown detail", cohort: "Unknown detail", Year_of_birth: "Unknown detail"}
		student_hash.each do |key, value|
			puts "Enter #{key}"
			input = gets[0..-2].capitalize.to_sym # capitalizing the input from the user and converting symbol
			if input != "".to_sym
				student_hash[key] = input
			else
				student_hash[key]
			end
		end


		@students << student_hash # adding the student information hash to the students array
		puts
		if @students.count == 1
			puts "Now he have 1 student"
		else
			puts "Now we have #{@students.count} students"
		end
		puts "------------"
		# review the last student added
		last_student = @students.last
		puts "Review last addition details:"
		puts "Name: #{last_student[:name]} \nCohort: #{last_student[:cohort]} \nBorn in: #{last_student[:Year_of_birth]}"
		puts ""
		puts "You have the following options:"
		puts "Type 'no' to delete the last student and re-enter details"
		puts "Hit 'return' to add another student"
		puts "Type 'exit' to finish adding students and show list of options"
		puts ""
		input2 = gets[0..-2]
		if input2 == "no"
			@students.pop # removing the last student hash
		elsif input2 == "exit"
			break			
		end

	end

	# returning the students array
	@students

end

def print_header
	puts "The students of Villains Academy".center(50)
	puts "-------------".center(50)
end

def print_students_list(students)
	# students = the students array
	# counter = index
	counter = 0
	while counter < @students.length
		student = @students[counter]
		puts "#{counter+1}. #{student[:name]} (#{student[:cohort]} cohort), born in #{student[:Year_of_birth]}".center(50)
		counter += 1
	end
end

def print_footer(students)
	if @students.count == 1
	puts "Overall, we have 1 great student".center(50)
	else
	puts "Overall, we have #{@students.count} great students".center(50)	
	end
end

interactive_menu