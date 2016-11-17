require 'sinatra'
require 'sinatra/reloader'

  set :number, rand(100)

  get '/' do
    guess = params['guess'].to_i
    message, color = check_guess(guess)
    erb :index, :locals => {:number => settings.number,
                            :message => message,
                            :color => color}
  end

  def check_guess(guess)
    if guess.zero?
      message = "Please enter a valid guess..."
      color = "ffffff"
    elsif guess == settings.number
      message = "You got it right!"
      color = "#008000"
    elsif guess > (settings.number + 5)
      message = "Way too high!"
      color = "#FF0000"
    elsif guess > settings.number
      message = "Too high!"
      color = "#FE8484"
    elsif guess < (settings.number - 5)
      message = "Way too low!"
      color = "#FF0000"
    elsif guess < settings.number
      message = "Too low!"
      color = "#FE8484"
    end
    return message, color
  end
