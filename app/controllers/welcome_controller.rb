class WelcomeController < ApplicationController
  def index
    @movies = Movie.all.order(:year).reverse
  end
end
