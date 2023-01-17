class User < ApplicationRecord
    before_save { self.username = username.downcase }
    has_many :articles_categories
    has_many :articles,through: :article_categories, dependent: :destroy    
    validates :username, uniqueness: {case_sensitive: false}, presence: true, length: {minimum:5, maximum: 20}
    validates :email, uniqueness: {case_sensitive: false}, presence: true, length: {maximum: 100}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
    message: "Enter a valid email address" }
    has_secure_password
end