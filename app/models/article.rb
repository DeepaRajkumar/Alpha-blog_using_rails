class Article < ApplicationRecord
	belongs_to :customer
	has_many :article_categories
	has_many :categories, through: :article_categories
	has_many :comments, dependent: :destroy
	validates :title, presence:true, length:{minimum:4,maxmium:100}
	validates :description , presence:true, length:{minimum:4,maxmium:350}

	def self.matches(field_param,param)
      where("#{field_param} like?","%#{param}%")
    end  
    def self.title_matches(param)
       matches('title',param) 
    end   
    def self.description_matches(param)
       matches('description',param)
    end   
    def self.search(param)
    	param.strip!
        serach_result= (title_matches(param) +description_matches(param)).uniq
        return nil unless serach_result
        serach_result
    end
end	
'''Article.all
article=Article.first
article.categories=> Empty list

category=Category.last
category.articles<<article

article=Article.last
article.categories<<category
'''