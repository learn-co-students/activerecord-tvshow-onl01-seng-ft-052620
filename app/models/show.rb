class Show < ActiveRecord::Base

  def highest_rating
    Show.order(rating: :desc).first
  end

  def most_popular_show

  end

  def lowest_rating

  end

  def least_popular_show

  end

  def ratings_sum

  end

  def popular_shows

  end

  def shows_by_alphabetical_order

  end

end
