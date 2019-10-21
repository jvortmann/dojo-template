defmodule ExampleTest do
  use ExUnit.Case

  describe "Fizzbuzz.do_it/1" do
    test "return a list with one fizz" do
      assert Example.do_it([1, 2, 3]) == [1, 2, "Fizz"]
    end

    test "return a list with one buzz" do
      assert Example.do_it([1, 2, 3, 4, 5]) == [1, 2, "Fizz", 4, "Buzz"]
    end

    test "return a list with one FizzBuzz" do
      assert Example.do_it([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 25, 30, 35]) == [
               1,
               2,
               "Fizz",
               4,
               "Buzz",
               "Fizz",
               7,
               8,
               "Fizz",
               "Buzz",
               11,
               "Fizz",
               13,
               14,
               "FizzBuzz",
               "Buzz",
               "FizzBuzz",
               "Buzz"
             ]
    end
  end
end
