# # Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# On line 2, a proc is created without using Proc.new, but rather using Kernel#proc which is equivalent to Proc.new.
# Line 3 outputs the name of the class, an encoding of the object, the name of the file, and the line number on which the Proc was created.
# Line 4 outputs Proc, as expected.
# Line 5 does not raise an error; calling a Proc with fewer arguments than defined in the block on line 2 seems to assign nil to the omitted arguments.
# The argument passed to the call method provides the block parameter on line 2.

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# # my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# On line 15, Kernel#lambda is equivalent to Proc.new, except now the resulting Proc objects check the number of parameters passed when called.
# line 16 uses the syntax -> (thing) to creat a lambda with parameter thing.
# On line 17 and 18, outputing these lambda objects gives similar output to outputing Proc objects, except for the indication of (lambda) at the end.
# On line 19, calling #class on a lambda object returns Proc. It seems that lambdas are a specialized type of Proc object.
# On line 20, when we call the lambda with an argument ('dog'), things work as expected.
# But on line 21, when we don't pass in an argument, we get an ArgumentError. This is different from regular Proc objects, where excluded arguments are assigned nil.
# Line 22 raises an error because it seems that there is no Lambda class in Ruby. lambdas are just specialized types of Proc objects.


# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Group 3 yields to an implicit block. But since line 35 yields to the block without passing in an argument, the block parameter on line 38 is assigned nil, which is reflected in the output.
# Line 39 raises a NoJumpError as expected, since there is no block_given? guard clause on line 35.

# # Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}

# Unlike group 3, the method in group 4 passes the method parameter to yield as an argument. Therefore, line 49 gives the expected output.
# The block on line 50 includes a block parameter that is not passed to yield on line 46, and is therefore assigned nil. Extra block parameters, just like missing block parameters, are assigned nil.
# Line 53 raises NameError because animal is not defined as a block parameter.

# Summary:

# Lambdas are types of Proc objects, and have strict arity. Regular Proc objects, however, have lenient arity.
# Blocks have lenient arity.
