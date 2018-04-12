class Game
  def initialize
    @controller = Controller.new(greeting)
  end

  def start
    new_game
  end

  private

  def greeting
    @player = Player.new(ask_name)
  end

  def ask_name
    print 'Input your name: '
    gets.chomp.capitalize!
  end

  def new_game
    stop_game if @controller.bank_empty?
    @controller.new_deck
    @controller.user_hand
    round
  end

  def stop_game
    puts 'You have no more money! Sell your kidney and come back later.'
    exit
  end

  def round
    @controller.take_two_cards_place_bet
    display_info
    current_turn
    open_cards
  end

  def display_info
    puts "–––––––– Let's see... ––––––––"
    puts "Your score is #{@controller.player.score}"
    puts "The bet is #{@controller.bank.money}$"
    puts "Your bank is #{@controller.user.bank}$"
    puts "Dealer's bank is #{@controller.dealer.bank}$"
    puts "Your cards #{@controller.player.show_card_face}"
    puts "Dealer's cards #{@controller.dealer.show_cards_back}"
  end

  def current_turn
    case choice
    when '1'
      choose_card
    when '2'
      open_cards
    when '3'
      skip_turn(@controller.player)
      dealer_turn
      current_turn
    else
      current_turn
    end
  end

  def choice
    print "Print '1' to choose a card, '2' to open cards, '3' to skip"
  end

  def choose_card
    if @controller.card_limit?(@controller.player)
      cards_limit
    else
      @user.get_card(@controller.deck)
      display_info
      if @controller.score_limit?(@controller.player)
        open_cards
      else
        dealer_turn
        current_turn
      end
    end
  end

  def dealer_turn
    @controller.dealer.turn(@controller.deck)
  end

  def skip_turn
    puts "#{name} skipped the turn."
  end

  def cards_limit
    puts 'You have too many cards.'
    current_turn
  end

  def open_cards
    @controller.winner_money
    round_result
    play_again
  end

  def round_result
    puts 'Round result: '
    puts "You have #{@controller.player.show_card_face}. Your score is #{@controller.player.score}"
    puts "Dealer has #{@controller.dealer.show_card_face}. His score is #{@controller.dealer.score}"
    puts "The winner is #{round_winner}"
  end

  def round_winner
    @controller.winner ? @controller.winner.name : 'Draw'
  end

  def play_again
    print "Print '1' to play again, '2' for exit."
    case gets.chomp
    when '1'
      new_game
    when '2'
      exit
    else
      play_again
    end
  end
end
