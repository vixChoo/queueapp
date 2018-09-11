class Watchlist < ApplicationRecord
    belongs_to :user

    validates :name, uniqueness: true
end
