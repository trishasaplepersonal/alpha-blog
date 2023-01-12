require 'test_helper'

class CategoriesTest < ActiveSupport::TestCase
    setup do
    @category = Category.new(name: "Sports")
    end 

    test "category should be valid" do        
    assert @category.valid?
    end   

    test "category name should be present" do
        @category.update(name: '')
        assert_not @category.valid?       
        end

    test "category name should be unique" do
    @category.save
    @category2 = Category.create(name: "Sports")        
    assert_not @category2.valid?
    end

    test "category name length check" do       
        @category.update(name: 'abc')
        assert_not @category.valid?
        @category.update(name: 'abcasdfsdfddfadfadfasdfasdfadsdsfadfasdfasdfadsfadsfadsfasdfasdfadsfadfasd')
        assert_not @category.valid?
    end


end