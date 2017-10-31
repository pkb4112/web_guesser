require 'sinatra'
require 'sinatra/reloader'

num = rand(101)
get '/' do
   "The Secret Number is #{num}"
end