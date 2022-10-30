class User < ApplicationRecord
    has_many :articles
    validates :username, uniqueness: {case_sensitive: false}, presence: true, length: {minimum:5, maximum: 20}
    validates :email, uniqueness: {case_sensitive: false}, presence: true, length: {maximum: 100}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
    message: "Enter a valid email address" }
end