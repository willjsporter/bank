require 'bank'

describe Bank do

let(:bank) { described_class.new }

  context "#initializes with some attributes" do

    it "initial balance is zero" do
      expect(bank.balance).to eq 0
    end

    it "initializes with a blank transaction array" do
      expect(bank.transactions.class).to eq Array
      expect(bank.transactions.length).to eq 0
    end

  end

  context "#clients can make deposits" do
    it "#balance increases after a deposit" do
      bank.deposit(10)
      expect(bank.balance).to eq 10
    end

    it "#transaction is stored in transaction array" do
      expect(bank.transactions.length).to eq 2
    end

  end

  context "#clients can make withdrawals" do

    it "#balance decreases for withdrawals" do
      bank.withdraw(10)
      expect(bank.balance).to eq -10
    end

  end

  context "#the list of all transactions can be viewed" do

  end

end
