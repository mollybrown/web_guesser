require 'sinatra'
require 'sinatra/reloader'

  set :number, rand(100)
  @@guesses_remaining = 6

  get '/' do
    guess = params['guess'].to_i
    guesses_remaining = guess_counter(guess)
    message, color = check_guess(guess)
    erb :index, :locals => {:number => settings.number,
                            :message => message,
                            :color => color,
                            :guesses_remaining => @@guesses_remaining}
  end

  def guess_counter(guess)
    @@guesses_remaining -= 1
  end

  def game_win
    @@guesses_remaining = 5
    settings.number = rand(100)
    message = "You won! A new number has been generated."
  end

  def game_lose
    @@guesses_remaining = 5
    settings.number = rand(100)
    message = "You lose! A new number has been generated."
  end

  def check_guess(guess)
    unless @@guesses_remaining == 0
      if guess.zero?
        message = "Please enter a valid guess..."
        color = "ffffff"
      elsif guess == settings.number
        message = game_win
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
    game_lose
  end
