class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def favorite_restaurant
        max = self.reviews.maximum(:star_rating)
        self.restaurants.where("star_rating = ?", max)
    end

    def add_review(restaurant, rating)
        Review.create(star_rating: rating, customer_id: self.id, restaurant_id: restaurant.id)
    end

    def delete_review(restaurant)
        self.reviews.where("restaurant_id = ?", restaurant.id).destroy_all
    end
end