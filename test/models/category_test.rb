require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Sports")
  end

  test "Category must be valid" do
    assert @category.valid?
  end

  test "Category must be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "Category minimum character must be 3" do
    @category.name = "aa"
    assert_not @category.valid?
  end

  test "Category maximum character must be 25" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "Category name must be unique" do
    @category.save
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

end
