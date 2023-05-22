require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    # @letters = ('a'...'z').to_a.sample(10)
    alphabet = ('a'...'z').to_a
    @letters = []
    10.times do
      @letters << (alphabet.sample)
    end
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    dictionary = URI.open(url).read
    result = JSON.parse(dictionary)
    if result["found"]
      @results = "Congrats! #{@word} is a valid English word"
    end
  end
end
