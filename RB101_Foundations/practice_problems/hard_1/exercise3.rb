# A.
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# This will print out the following because the method reassigns new variables pointing to the original
# objects but does not mutate those objects:
# one is: one
# two is: two
# three is: three

# B
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# This will print out the following because the method assigns new variables pointing to new objects within
# the method:
# one is: one
# two is: two
# three is: three

# C.
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# This will print the following because the value of the one, two, and three variable references will be passed
# as arguments into the one, two and three parameters of the method. The method mutates the objects to which all
# 6 references are pointing:
# "one is: two"
# "two is: three"
# "three is: one"