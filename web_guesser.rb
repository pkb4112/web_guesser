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

num = rand(101)

get '/' do
	  guess = params["guess"]
		message = check_guess(guess,num)[0]
		bgcolor = check_guess(guess,num)[1]


		erb :index, :locals => {:num => num, :message => message, :bgcolor => bgcolor}
end