class Deck
  SUITS = %w[♡ ♧ ♢ ♤].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  VALUES = [
    [2], [3], [4], [5], [6], [7], [8], [9], [10], [10], [10], [10], [11, 1]
  ].freeze

  attr_reader :deck

  def initialize
    @deck = create_deck
  end

  private

  def create_deck
    @deck = []
    SUITS.each do |suit|
      RANKS.each_with_index do |rank, index|
        @deck << Card.new(suit, rank, VALUES[index])
      end
    end
    @deck.shuffle
  end
end
