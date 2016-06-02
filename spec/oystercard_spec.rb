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
  end

  describe '#top_up' do
    it "tops the card up" do
      expect(card.top_up(1)).to eq card.balance
    end
    it 'adds money to a card with money already on it' do
      card.top_up(1)
      expect(card.top_up(3)).to eq 4
    end
  end
end
