def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# The reference value for my_string was copied and passed to a_string_param.
# However, a_string_param was reassigned inside the method and, therefore, did not mutate the caller.

# The reference value for my_array was copied and passed to an_array_param.
# The method that is called on an_array_param mutates the caller so my_array becomes ["pumpkins", "rutabaga"]