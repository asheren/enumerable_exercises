gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class AdditionalTests < Minitest::Test
  #### 3 ways to write a block - do, {}, and (&:xxx)
  class NumberTripler
    def initialize(val) #initialize the class with a number
      @val = val #which is then stored inside the class
    end

    def triple
      @val * 3 #when you call the triple method, it takes the value stored, multiplies it by 3 and stores that
    end

    def log(&block)
      #puts around block of code, logs out result of the block
      puts "let's start this block"
      puts block.call
      puts "this block is so last year"
    end
  end

  def test_triple_values_do
    values = [NumberTripler.new(1), NumberTripler.new(2), NumberTripler.new(3)]
    values = values.map do |value|
      #value is the object NumberTripler.new(1) and so then we need to call triple on that value. Value is an object and no longer just a number
      value.triple
    end
    assert_equal [3, 6, 9], values
  end

  def test_triple_values_braces
    values = [NumberTripler.new(1), NumberTripler.new(2), NumberTripler.new(3)]
    values = values.map { |value| value.triple }
    assert_equal [3, 6, 9], values
  end

  def test_triple_values_method
    values = [NumberTripler.new(1), NumberTripler.new(2), NumberTripler.new(3)]
    values = values.map(&:triple)
    assert_equal [3, 6, 9], values
  end

  def test_logging
    value = NumberTripler.new(1)
    value.log do
      1
    end
  end


  #### .with_index
  def test_values_with_index
    names = ["Alice", "Bob", "Cecil"]
    names = names.map.with_index do |name, index|
      "#{index}. #{name}"
    end

    assert_equal ["0. Alice", "1. Bob", "2. Cecil"], names
  end

  #### .index_by? Is that what Steve mentioned?
  def test_values_index_by
    #this should be an example of
    users = [
      {
        id: 1,
        name: "Alice Smith",
        active: true
      },
      {
        id: 2,
        name: "Bob",
        active: true
      },
      {
        id: 3,
        name: "Camilla Johnson",
        active: false
      },
      {
        id: 4,
        name: "Doug Brown",
        active: true
      },
      {
        id: 5,
        name: "Emil",
        active: false
      }
    ]
    users.index_by do |user|
      user[:id]
    end

    assert_equal({1 => {
        id: 1,
        name: "Alice Smith",
        active: true
      }, 2 => {
        id: 2,
        name: "Bob",
        active: true
      }, 3 => {
        id: 3,
        name: "Camilla Johnson",
        active: false
      }, 4 => {
        id: 4,
        name: "Doug Brown",
        active: true
      },5 => {
        id: 5,
        name: "Emil",
        active: false
      }
    }, users)
  end


  #### &, |, +, -
  def test_intersection
    evens = [2, 4, 6, 8, 10, 12]
    every_third = [3, 6, 9, 12]

    intersection = evens & every_third

    assert_equal [6, 12], intersection
  end

  def test_union
    current_users = ["Alice", "Bob", "Candice", "Emily"]
    new_users = ["Bob", "Doug", "Emily"]

    union = (current_users | new_users).sort
    #need to sort the union so that the array is in the same order and the duplicate is removed correctly

    assert_equal ["Alice", "Bob", "Candice", "Doug", "Emily"], union
  end

  def test_add
    current_users = ["Alice", "Bob", "Candice", "Emily"]
    new_users = ["Bob", "Doug", "Emily"]

    appended = current_users + new_users

    assert_equal ["Alice", "Bob", "Candice", "Emily", "Bob", "Doug", "Emily"], appended
  end

  def test_subtract
    all_user_ids = [1, 2, 3, 4, 5]
    inactive_user_ids = [1, 4, 5, 6]

    active_user_ids = all_user_ids - inactive_user_ids

    assert_equal [2, 3], active_user_ids

    bad_user_ids = inactive_user_ids - all_user_ids

    assert_equal [6], bad_user_ids
  end
end
