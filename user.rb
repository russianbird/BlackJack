class User
  attr_reader :name
  attr_accessor :bank, :cards

  def initialize(name)
    @name = name
    @cards = []
    @bank = 100
  end

  def get_card(deck)
    card = deck.cards.sample
    @cards << card
    deck.cards.delete(card)
  end

  def place_bet(bank)
    @bank -= 10
    bank.increase(10)
  end

  def show_card_face
    @cards.each { |card| print "#{card.card_face} | " }
  end

  def score
    @score = 0
    @cards.each do |card|
      @score += if @score + card.value.max > 21
                  card.value.min
                else
                  card.value.max
                end
    end
    @score
  end

  def take_money(money)
    @bank += money
  end
end
