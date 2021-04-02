# Mortgage Calculator

# Get the loan amount
# Get the APR
# Get the loan duration

# Write methods for the following
#		Calculate monthly interest rate
#		Calculate loan duration in months
#		Calculate monthly payment

# Print out the monthly payment

# Use the following formula
# m = p * (j / (1 - (1 + j)**(-n)))

# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months


def year_to_monthly_interest(yearly_rate)
	yearly_rate / 12
end

def year_to_month_duration(year_duration)
	year_duration * 12
end

def monthly_payment(p, j, n)
	p * (j / (1 - (1 + j)**(-n)))
end

puts "Welcome to the Mortgage Calculator!"
puts "Enter your loan amount."

loan_amount = gets.chomp.to_i

puts "Enter the Annual Percentage Rate."

annual_percentage_rate = gets.chomp.to_f / 100

puts "Enter the loan duration (in years)."

loan_duration_years = gets.chomp.to_i

monthly_interest_rate = year_to_monthly_interest(annual_percentage_rate)

loan_duration_months = year_to_month_duration(loan_duration_years)

mo_payment = monthly_payment(loan_amount, monthly_interest_rate, loan_duration_months)

puts mo_payment