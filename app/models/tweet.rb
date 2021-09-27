class Tweet < ApplicationRecord
    validates :message, presence: true
    validates :tdate, presence: true
    validates :file, presence: true
    validates :message, length: { maximum: 140 }
    
end