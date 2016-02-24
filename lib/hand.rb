require_relative 'deck'

class Hand

  NUMBER_CARDS = [2, 3, 4, 5, 6, 7, 8, 9]
  FACE_CARDS = ['J', 'Q', 'K']

  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    points = 0

    @cards.each do |card|
      if NUMBER_CARDS.include?(card[0].to_i)
        points += card[0].to_i
      elsif FACE_CARDS.include?(card[0]) || card[0, 2] == "10"
        points += 10
      else
        if (points + 11) > 21
          points += 1
          next
        end
        points += 11
      end
    end

    points
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
puts hand.calculate_hand # Get this working properly
