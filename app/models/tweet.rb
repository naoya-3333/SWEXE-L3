class Tweet < ApplicationRecord
    validates :message, presence: true
    validates :tdate, presence: true
    validates :message, length: { maximum: 140 }
    
end
