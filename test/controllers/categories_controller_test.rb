require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do    
    @user = User.create(email: 'testadmin@gmail.com', username: 'testadmin', password: 'password', admin: true)
  end

  test "should get index" do
    @category = Category.create(name: "Fiction")
    get categories_url
    assert_response :success
  end

  test "should get new" do    
    login_user(@user)
    get new_category_url
    assert_response :success
  end

  test "should create category" do    
    login_user(@user)    
    assert_difference("Category.count", 1) do
      post categories_url, params: { category: {name: 'Sports'  } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should show category" do
    @category = Category.create(name: "Fiction")
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do        
    login_user(@user)
    @category = Category.create(name: "Fiction")
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do        
    login_user(@user)
    @category = Category.create(name: "Fiction")
    patch category_url(@category), params: { category: { name: 'Sport2' } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do        
    login_user(@user)
    @category = Category.create(name: "Fiction")
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end  
end
