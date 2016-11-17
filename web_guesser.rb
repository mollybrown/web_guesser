require 'sinatra'
require 'sinatra/reloader'

  set :number, rand(100)

  get '/' do
    guess = params['guess'].to_i
    message = check_guess(guess)
    erb :index, :locals => {:number => settings.number, :message => message}
  end

  def check_guess(guess)
    if guess == settings.number
      "You got it right!"
    elsif guess > settings.number
      high(guess)
    elsif guess < settings.number
      low(guess)
    end
  end

  def high(guess)
    if guess > (settings.number + 5)
      "Way too high!"
    else
      "Too high!"
    end
  end

  def low(guess)
    if guess < (settings.number - 5)
      "Way too low!"
    else
      "Too low!"
    end
  end
