require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

  test "get new category form and create" do
    get "/categories/new"
    assert_response :success
    assert_difference("Category.count") do
      post categories_path, params: {category: {name: "Sports"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end

  test "get new category form and create validation" do
    get "/categories/new"
    assert_response :success
    assert_no_difference("Category.count") do
      post categories_path, params: {category: {name: " "}}
    end
    assert_match "Sports", response.body
  end

end
