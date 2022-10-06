require "test_helper"

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "Create method must present to create Categories" do 
    get "/categories/new"
    assert_response :success
    post "/categories",
    params: {category:{name:"Event"}}
    assert_response :redirect 
  end
  test "Category must have show page" do 
    get "/categories"
    assert_response :success
    
  end
end
