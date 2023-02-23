def prompt(message)
  Kernel.puts("=> #{message}")
end 

def valid?(number)
  number.to_i() != 0
end 

def operation_to_message(op)
  case op
    when '1'
      'Adding'
    when '2'
      'Subtracting'
    when '3'
      'Multiplying'
    when '4'
      'Dividing'
  end	
end 

prompt("Welcome to the Calculator!")

loop do 
	
number1 = nil
number2 = nil

loop do 
    prompt("Please enter the first number")
  number1 = Kernel.gets.to_i()
  if valid?(number1)
    break 
  else
    prompt("Something is wrong")
  end
end 

loop do 
prompt("Please enter the second number")
number2 = Kernel.gets.to_i()
  if valid?(number2)
    break 
  else
    prompt("Something is wrong")
  end
end 

operator_prompt =  <<-MSG
  What Operation Would You Like to Perform?
  1) add
  2) subtract
  3) multiply
  4) divide
MSG

prompt(operator_prompt
)
operator = Kernel.gets().chomp()

loop do 
  if %w(1 2 3 4).include?(operator)
    break
  else
    prompt("Must choose 1 2 3 or 4")
  end
end

prompt("#{operation_to_message(operator)} the two numbers....")

result = case operator
          when '1'
            number1 + number2
          when '2'
            number1 - number2
          when '3'
            number1 * number2
          when '4'
            number1.to_f() / number2>to_f
end

prompt("The result is #{result}")

prompt("would you like to do that again")
answer = Kernel.gets().chomp()
break unless answer.downcase == 'y'
end 

prompt("GOODBYE!")
