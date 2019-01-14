require 'test/unit'
require_relative 'insertion_sort.rb'

class InsertionSortTest < Test::Unit::TestCase
  def setup
  end

  def test_get_index_should_return_nil_on_empty_array
    res = get_index([], 123)
    assert_true(res.nil?)
  end

  def test_get_index_should_return_zero_if_array_has_only_one_element
    res = get_index([1], 123)
    assert_equal(0, res)
  end

   def test_get_index_should_work_correctly_case_1
    res = get_index([1,3,6,9], 4)
    assert_equal(2, res)
   end

  def test_get_index_should_work_correctly_case_2
    res = get_index([1,3,6,9], 7)
    assert_equal(3, res)
  end
end
