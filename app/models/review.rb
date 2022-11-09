class Review < ActiveRecord::Base
    belongs_to :customer
    belongs_to :restaurant

    def full_review
        if self.star_rating == 1
            st = "star"
        else
            st = "stars"
        end
        "Review for #{self.restaurant.name} by #{self.customer.first_name} #{self.customer.last_name}: #{self.star_rating} #{st}."
    end
end