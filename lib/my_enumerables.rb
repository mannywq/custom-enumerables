module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield(element)
    end

    self
  end

  def my_each_with_index(*_args)
    i = 0
    each do |el|
      yield el, i
      i += 1
    end

    self
  end

  def my_all?
    for el in self
      return false unless yield(el)
      end
    true
  end

  def my_any?
    each do |el|
      return true if yield(el)
    end
    false
  end

  def my_select
    results = []

    each do |el|
      results.push(el) if yield(el)
    end
    results
  end

  def my_none?
    each do |el|
      return false if yield(el)
    end
    true
  end

  def my_count
    return length unless block_given?

    count = 0
    each do |el|
      count += 1 if yield(el)
    end
    count
  end

  def my_map
    results = []

    each do |el|
      results << yield(el)
    end
    results
  end

  def my_inject(initial)
    result = initial

    if block_given?
      each_with_index do |el, i|
        next if i.zero? && initial.nil?

        result = yield(result, el)
      end
    end

    result
  end
end
