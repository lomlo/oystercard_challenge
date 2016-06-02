require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }


  describe '#balance' do
    it "oystercard understands the balance method" do
      expect(card).to respond_to(:balance)
    end
    it 'checks the balance' do
      expect(card.balance).to eq 0
    end
    it 'changes after topping up' do
      card.top_up(1)
      expect(card.balance).to eq 1
    end
    it 'has a maximum balance of 90' do
      expect(card.top_up(90)).to eq card.balance
    end

  end

  describe '#top_up' do
    it "tops the card up" do
      expect(card.top_up(1)).to eq card.balance
    end
    it 'adds money to a card with money already on it' do
      card.top_up(1)
      expect(card.top_up(3)).to eq 4
    end
     it 'raises error when exceeding maximum limit' do
      expect{card.top_up(91)}.to raise_error "Cannot top up more than 90"
    end
  end

  describe '#deduct' do
    it 'deducts 5 from the balance' do
      p "#{card.balance}"
      card.deduct(5)
      p "#{card.deduct(5)}"
      p "#{card.balance}"
      expect(card.balance).to eq -5
      p 'flang'
    end
    it 'deducts 10 from the balance' do
      card.deduct(-10)
      expect(card.balance).to eq -10
    end
  end

  describe '#touch_in' do
    it 'The card is touched into a station' do
      expect(card).to respond_to(:touch_in)
    end
  end

  describe '#touch_out' do
    it 'the card has left a station' do
      expect(card).to respond_to(:touch_out)
    end
  end

  describe '#in_journey' do
    it 'the card is on a journey' do
      expect(card).to respond_to(:in_journey)
    end
  end

end
