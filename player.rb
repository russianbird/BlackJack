class Player < User
  def get_card(cards)
    card = super(cards)
    puts "#{name} got #{card.card_face}"
  end
end
