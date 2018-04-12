class Controller
  attr_reader :dealer, :bank, :user, :deck
  def initialize(_user)
    @player = player
    @dealer = Dealer.new
    @bank = Bank.new
  end

  def bank_empty?
    @user.bank <= 0 || @dealer.bank <= 0
  end

  def user_hand
    @player.cards = []
    @dealer.cards = []
  end

  def card_limit?(user)
    user.cards.size > 2
  end

  def score_limit?(user)
    user.score > 21
  end

  def winner_money
    if winner
      winner.take_money(@bank.money)
    else
      amount = @bank.money / 2
      @player.take_money(amount)
      @dealer.take_money(amount)
    end
    @bank.decrease(@bank.money)
  end

  def take_two_cards_place_bet
    @player.place_bet(@bank)
    @dealer.place_bet(@bank)
    2.times do
      @player.get_card(@deck)
      @dealer.get_card(@deck)
    end
  end

  def winner
    if score_limit?(@player)
      @dealer
    elsif score_limit?(@dealer)
      @player
    elsif @dealer.score != @player.score
      [@player, @dealer].max_by(&:score)
    end
  end

  def new_deck
    @deck = Deck.new
  end
end
