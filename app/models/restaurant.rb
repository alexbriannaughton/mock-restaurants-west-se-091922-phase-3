class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

    def self.fanciest
        max = self.all.maximum(:price)
        self.all.where("price = ?", max).first
    end

    def all_reviews
        self.reviews.map {|r| "Review for #{self.name} by #{r.customer.first_name} #{r.customer.last_name}: #{r.star_rating} star(s)."}
    end
end