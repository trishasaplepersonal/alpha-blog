require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest

  setup do
    @category = Category.create({name: 'Travel'})
    @category2 = Category.create({name: 'Science'})
  end

  test "should list the categories created" do
    get '/categories'
    assert_response :success
    assert_match 'Travel', response.body
    assert_match 'Science', response.body
     assert_select "a[href=?]", category_path(@category), text: @category.name
     assert_select "a[href=?]", category_path(@category2), text: @category2.name

  end

end
