#### 3 ways to write a block - do, {}, and (&:xxx)
def triple(val)
  val * 3
end

def triple_values_do
  values = [1, 2, 3]
  # transform values with a do block
  assert_equal values, [3, 6, 9]
end

def triple_values_braces
  values = [1, 2, 3]
  # transform values with a { } block
  assert_equal values, [3, 6, 9]
end

def triple_values_method
  values = [1, 2, 3]
  # transform values with a method reference
  assert_equal values, [3, 6, 9]
end


#### .with_index
def values_with_index
  names = ["Alice", "Bob", "Cecil"]

  # write a block that adds the index to the beginning of each name

  assert_equal names, ["0. Alice", "1. Bob", "2. Cecil"]
end

#### .by_index? Is that what Steve mentioned?


#### &, |, +, -
def intersection
  evens = [2, 4, 6, 8, 10, 12]
  every_third = [3, 6, 9, 12]

  # write code that gets the intersection of even numbers and every_third number

  assert_equal intersection, [6, 12]
end

def union
  current_users = ["Alice", "Bob", "Candice", "Emily"]
  new_users = ["Bob", "Doug", "Emily"]

  # write code that combines the two array without duplicates

  assert_equal union, ["Alice", "Bob", "Candice", "Doug", "Emily"]
end

def add
  current_users = ["Alice", "Bob", "Candice", "Emily"]
  new_users = ["Bob", "Doug", "Emily"]

  # write code that combines the arrays with duplicates

  assert_equal appended, ["Alice", "Bob", "Candice", "Emily", "Bob", "Doug", "Emily"]
end

def subtract
  all_user_ids = [1, 2, 3, 4, 5]
  inactive_user_ids = [1, 4, 5, 6]

  # write code that gets the active user ids

  assert_equal active_user_ids, [2, 3]

  # write code that gets users that shouldn't be in the system :)

  assert_equal bad_user_ids, [6]
end
