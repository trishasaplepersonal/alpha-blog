class Category < ApplicationRecord
    validates :name, presence: true, length: {minimum:5, maximum: 20}, uniqueness: {case_sensitive: false}
    validates :description,  length: { maximum: 100}
end