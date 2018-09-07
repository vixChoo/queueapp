class Watchlist < ActiveRecord::Base
    belongs_to :user
    belongs_to :follower, :class_name => 'User'
    has_many :tweets
    
end