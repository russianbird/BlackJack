class Card
  attr_reader :rank, :suit, :value

  def initialize(rank, suit, value)
    @rank = rank
    @suit = suit
    @value = value
  end

  def card_face
    rank + suit
  end
end
