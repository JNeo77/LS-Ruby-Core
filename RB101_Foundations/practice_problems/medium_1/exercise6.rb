answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# The output will be 34 because the 'mess_with_it' method does not change the 'answer' variable.