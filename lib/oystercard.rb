
class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
  end
  
  def top_up(value)
    top_up_fail(value)
    @balance += value
  end

  private

  DEFAULT_LIMIT = 90
  
  def top_up_fail(value)
    fail 'Please input an integer' unless is_number?(value)
    fail 'Exceeded limit' if limit?(value)
  end

  def limit?(value)
    (@balance + value ) > DEFAULT_LIMIT
  end

  def is_number?(value)
    value.is_a? Integer
  end
end
