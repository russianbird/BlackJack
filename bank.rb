class Bank
  attr_reader :money

  def initialize
    @money = 0
  end

  def encrease(amount)
    @money += amount
  end

  def decrease(amount)
    @money -= amount
  end
end
