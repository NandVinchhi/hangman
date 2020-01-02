println("")
println("||    ||  |||||||  ||||   || |||||||||   ||||   ||||  |||||||  ||||   ||    ____")
println("||    || ||     || || ||  || ||          || || || || ||     || || ||  ||   |    |")
println("|||||||| ||||||||| ||  || || ||    ||||| ||  |||  || ||||||||| ||  || ||   O    |")
println("||    || ||     || ||   |||| ||     ||   ||       || ||     || ||   ||||  /|\\   |")
println("||    || ||     || ||    ||| |||||||||   ||       || ||     || ||    |||   |    |")
println("                                                                          / \\   |")
println("                                                                              __|__")

function replace(s, c, index)
	return s[1:index - 1] * c * s[index + 1:end]
end

function display(n)
	if n == 0
		println("  ____")
		println(" |    |")
		println("      |")
		println("      |")
		println("      |")
		println("      |")
		println("    __|__")
	elseif n == 1
		println("  ____")
		println(" |    |")
		println(" O    |")
		println("      |")
		println("      |")
		println("      |")
		println("    __|__")
	elseif n == 2
		println("  ____")
		println(" |    |")
		println(" O    |")
		println(" |    |")
		println(" |    |")
		println("      |")
		println("    __|__")
	elseif n == 3
		println("  ____")
		println(" |    |")
		println(" O    |")
		println("/|    |")
		println(" |    |")
		println("      |")
		println("    __|__")
	elseif n == 4
		println("  ____")
		println(" |    |")
		println(" O    |")
		println("/|\\   |")
		println(" |    |")
		println("      |")
		println("    __|__")
	elseif n == 5
		println("  ____")
		println(" |    |")
		println(" O    |")
		println("/|\\   |")
		println(" |    |")
		println("/     |")
		println("    __|__")
	elseif n == 6
		println("  ____")
		println(" |    |")
		println(" O    |")
		println("/|\\   |")
		println(" |    |")
		println("/ \\   |")
		println("    __|__")
	end
end 

function display_word(s)
	final = ""
	for i = 1:length(s)
		final = final * s[i] * " "
	end
	println("Word: " * final)
end

function isalpha(a)
    return isletter(collect(Char, a)[1])
end

function check(x, arr)
	for i in arr
		if i == x
			return false
		end
	end
	return true
end

function check2(x, arr)
	for i in arr
		if i == collect(Char, x)[1]
			return false
		end
	end
	return true
end

function print_misses(m)
	final = ""

	if length(m) > 0

	    for i = 1:length(m) - 1
		    final = final * m[i] * ", "
	    end

	    println("Misses: " * final * m[length(m)])

    else
        println("Misses: ")
    end
end

println("Enter the word for the other player to guess.")
word = uppercase(readline())
guess = ""
for i = 1:length(word)
	global guess *= "_"
end

for i = 1:50
    println("")
end 

num_guessed = 0
misses = []

println("Please Enter a single alphabet when prompted to make your guess.")
println("")

println("________________")
println("")
display(0)
while num_guessed <= 6
	
	println("")
	display_word(guess)
	print_misses(misses)
	println("")

	println("Enter a letter:")
	x = uppercase(readline())
	
	if isalpha(x) == true && length(x) == 1
		if check(x, misses) == false
			println("You have already guessed this letter. please enter another letter.")
		else
            if check2(x, word) == false
			    for b = 1:length(word)
				    if word[b] == collect(Char, x)[1]
				        global guess = replace(guess, x, b)
				    end
			    end
			    println("Correct Guess!")
		    else
		    	global num_guessed += 1
		    	global misses = vcat(misses, [x])
		    	println("Miss!")
		    end
		    

		end
		
	else 
		println("Invalid Input.")
	end

	println("________________")
	println("")

	if guess == word
		break
	end
	display(num_guessed)
	
	
end

println("")
println("Game Over.")
println("Word: " * word)

println("")
if num_guessed == 6
	println("Hangman.")
	println("You lose. Better luck next time!")
else
	println("Congratulations!")
	println("You Win.")
end








