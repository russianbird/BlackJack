class Dealer < User
  def initialize(name = 'Dealer')
    super(name)
  end

  def take_card(cards)
    super(cards)
    puts 'Dealer got a card.'
  end

  def turn(cards)
    if @score >= 17 || @cards.size == 3
      puts 'Dealer skips the turn.'
    else
      get_card(cards)
    end
  end

  def show_card_back
    @cards.size.times { puts '*' }
  end
end
