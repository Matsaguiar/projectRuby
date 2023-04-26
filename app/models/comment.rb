class Comment < ApplicationRecord

    validates :name, presence: true
    validates :observation, presence: true
  
    belongs_to :post
  
  end
  