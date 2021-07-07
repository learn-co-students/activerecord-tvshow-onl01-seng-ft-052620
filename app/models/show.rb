require 'pry'

class Show < ActiveRecord::Base

  def self.highest_rating
    Show.maximum("rating")
  end

  def self.most_popular_show
    highest = highest_rating
    most = Show.where(rating: highest)[0]
    most
  end

  def self.lowest_rating
    Show.minimum("rating")
  end

  def self.least_popular_show
    lowest = lowest_rating
    least = Show.where(rating: lowest)[0]
    least
  end

  def self.ratings_sum
    Show.sum("rating")
  end

  def self.popular_shows
    shows = Show.where("rating > 5")
    shows
  end

  def self.shows_by_alphabetical_order
    shows = Show.order(:name)
    shows
    Show.where("rating > 5")
  end

  def self.shows_by_alphabetical_order
    Show.order("name")
  end

end
