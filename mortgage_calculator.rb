require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def message(string)
  Kernel.puts("=> #{string}")
end

def valid?(number)
  number.to_f > 0
end

loan = nil
apr = nil
loan_duration = nil
monthly_payment = nil

message(MESSAGES['welcome'])
name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['nonvalid_name'])
  else
    break
  end
end

loop do
  message("HELLO #{name}, THANK YOU FOR USING MY CALCULATOR!")

  loop do
    message(MESSAGES['loan_amount'])
    loan = Kernel.gets().chomp().to_i()
    if valid?(loan)
      break
    else
      message(MESSAGES['nonvalid_loan_amount'])
    end
  end

  message("YOUR LOAN AMOUNT IS $ #{loan}")

  loop do
    message(MESSAGES['apr'])
    apr = Kernel.gets().chomp()
    if valid?(apr)
      break
    else
      message(MESSAGES['nonvalid_apr'])
    end
  end

  message("YOUR ANNUAL INTEREST RATE IS % #{apr}")

  loop do
    message(MESSAGES['loan_duration_years'])
    loan_duration = Kernel.gets().chomp()
    if valid?(loan_duration)
      break
    else
      message("NOT A VALID AMOUNT")
    end
  end

  message("YOUR LOAN DURATION IS #{loan_duration} YEARS")

  monthly_interest = (apr.to_f() / 12) / 100
  loan_months = loan_duration.to_i() * 12

  message("CALCULATING YOUR MONTHLY PAYMENT")

  monthly_payment = loan * (monthly_interest /
  (1 - (1 + monthly_interest)**(-loan_months)))

  message("YOUR MONTHLY PAYMENT WILL BE $ #{monthly_payment.truncate(2)}")

  message(MESSAGES['redo_calc'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase() == 'y'
end
