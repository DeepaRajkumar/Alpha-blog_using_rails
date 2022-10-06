class Article < ApplicationRecord
	belongs_to :customer
	has_many :article_categories
	has_many :categories, through: :article_categories
	has_many :comments, dependent: :destroy
	validates :title, presence:true, length:{minimum:4,maxmium:100}
	validates :description , presence:true, length:{minimum:4,maxmium:350}
end	
'''Article.all
article=Article.first
article.categories=> Empty list

category=Category.last
category.articles<<article

article=Article.last
article.categories<<category
'''