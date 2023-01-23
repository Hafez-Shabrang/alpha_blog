require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "Sports")
  end

  test "Getting categories" do
    get categories_url
    assert_response :success, "Getting categories testing"
  end

  test "Showing category" do
    get categories_url(@category)
    assert_response :success, "Showing category testing"
  end

  test "New category" do
    get new_category_url(@category)
    assert_response :success, "New category testing"
  end

  test "Should be create post" do
    assert_difference("Category.count") do
      post categories_url, params: {category: {name: "Digital"}}
    end
    assert_redirected_to category_url(Category.last)
  end
end