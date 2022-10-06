require "test_helper"
class CategoryTest < ActiveSupport::TestCase 
	test "Category model must present" do 
		@category=Category.create(name:"sports")
		assert @category.valid?
    end
    test "Name must contain some values" do 
         @category=Category.create(name:'')
         assert_not @category.valid?
    end  
    test "Name must contain unique values" do 
    	 @category=Category.create(name:'sports')
    	 @category1=Category.create(name:'nuts')
    	 #@category1=Category.new
    	 #@category1.name="world"
         assert_not @category1.valid?
    	
    end   		
end