def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def apr_to_decimal(apr)
  apr / 100
end

def apr_to_month(apr_decimal)
  apr_decimal / 12
end

def years_to_months(years)
  years * 12
end

def payment(la, j, n)
  la * (j / (1 - (1 + j)**(-n)))
end

prompt("Welcome to the Loan Payment Calculator!")

loop do # main loop
  loan_amount = ''
  loop do
    prompt("Enter the loan amount:")
    loan_amount = Kernel.gets().chomp()

    if valid_number?(loan_amount)
      break
    else
      prompt("Hmm... that doesn't look like a valid loan amount.")
    end
  end

  apr = ''
  loop do
    prompt("Enter the Annual Percentage Rate:")
    apr = Kernel.gets().chomp()

    if valid_number?(apr)
      break
    else
      prompt("Hmm... that doesn't look like a valid APR.")
    end
  end

  duration_in_years = ''
  loop do
    prompt("Enter the loan duration (in years):")
    duration_in_years = Kernel.gets().chomp()

    if valid_number?(duration_in_years)
      break
    else
      prompt("Hmm... that doesn't look like a valid duration.")
    end
  end

  apr_decimal = apr_to_decimal(apr.to_f)
  monthly_rate = apr_to_month(apr_decimal)
  duration_in_months = years_to_months(duration_in_years.to_i)

  monthly_payment = payment(loan_amount.to_i, monthly_rate, duration_in_months)

  prompt("Your monthly payment is $#{monthly_payment.round(2)}!")
  prompt("Would you like to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("That you for using the Loan Payment Calculator. Good bye!")
