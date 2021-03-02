class Show < ActiveRecord::Base
  
  def self.highest_rating
    self.all.reduce{|a,b| return a.rating if a.rating > b.rating }
  end

  def self.most_popular_show
    self.all.find_by(rating: self.highest_rating)
  end

  def self.lowest_rating
    array = self.all
    ratings = array.map{|show| show.rating}
    ratings.min
  end

  def self.least_popular_show
    self.all.find_by(rating: self.lowest_rating)
  end

  def self.ratings_sum
    self.all.map{|a| a.rating}.reduce(:+)
  end

  # def self.popular_shows
  #   popular_shows = Array.new
  #   self.all.each{|show| 
  #     if show.rating > 5
  #       popular_shows << show
  #     end
  #   }
  #   popular_shows
  # end

  ###REFRACTOR
  scope :popular_shows, -> {where('rating > ?', 5)}

  # def self.shows_by_alphabetical_order
  #   self.order("name ASC")
  # end

  ###RERFACTOR
  scope :shows_by_alphabetical_order, -> { order(name: :asc)}
  
end