require 'sinatra'
require 'sinatra/reloader'



def check_guess(guess,num)
	guess = guess.to_i

		case 
				when guess > num + 5 
						message = "Way too high!"
						bgcolor = "red"
				when guess < num - 5 
						message = "Way too low!"
						bgcolor = "blue"
				when guess > num 
						message = "Too high!"
						bgcolor = "orange"
				when guess < num 
						message = "Too low!"
						bgcolor = "teal"
				when guess == num 
						message = "You got it right!"
						bgcolor = "green"
		end
		return message, bgcolor
end

def generate_num
 num = rand(101)
 return num
end

def new_guess 
	@@guesses = 5
	num = generate_num
	return num
end

num = new_guess


get '/' do
	  guess = params["guess"]
		message = check_guess(guess,num)[0]
		bgcolor = check_guess(guess,num)[1]
		  @@guesses -= 1
		if params["cheat"] == "true"
	  	cheat = "Secret number is #{num}"
	  end
		
	  if guess.to_i == num
	  message = "You Win!" 
	  	num = new_guess
	  elsif @@guesses == 0 
	  	message = "You Lose"
	  	num = new_guess
	  end
    
		
		erb :index, :locals => {:num => num, :message => message, :bgcolor => bgcolor,:guesses => @@guesses, :cheat => cheat}
end