# require 'bank'
require 'transaction'

describe Transaction do
  context '#Transaction is initized correctly' do
    subject(:transaction) { described_class.new(-10, 110) }

    it "initializes with date" do
      expect(transaction.date).to match(%r{\d\d\/\d\d\/2\d\d\d})
    end

    it "initializes with credit and debit amount (one of which is nil)" do
      expect(transaction.debit).to be_nil
      expect(transaction.credit).to eq 10
    end

    it "initializes with new balance" do
      expect(transaction.balance).to eq 110
    end
  end

  context '#Transaction is initized without arguments' do
    it '#Transaction cannot initialize without transaction amount and balance' do
      expect { Transaction.new }.to raise_error ArgumentError
    end
  end
end
