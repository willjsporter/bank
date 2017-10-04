require 'account'
require 'transaction'
require 'statement'

describe Account do
  let(:account) { described_class.new }
  let(:trans1) { double :Transaction }
  let(:trans2) { double :Transaction }
  let(:st_double) { double :Statement }
  let(:st_double1) { double :Statement }

  context "#initializes with some attributes" do
    it "initial balance is zero" do
      expect(account.balance).to eq 0
    end

    it "initializes with a blank transaction array" do
      expect(account.transactions.class).to eq Array
      expect(account.transactions.length).to eq 0
    end
  end

  context "#clients can make deposits" do
    it "#balance increases after a deposit" do
      account.deposit(10)
      expect(account.balance).to eq 10
    end

    it "#transaction is stored in transaction array" do
      account.deposit(10)
      account.deposit(20)
      expect(account.transactions.length).to eq 2
    end
  end

  context "#clients can make withdrawals" do
    it "#balance decreases for withdrawals" do
      account.withdraw(10)
      expect(account.balance).to eq(-10)
    end

    it "#withdrawal transaction is stored in transaction array" do
      account.deposit(10)
      account.withdraw(20)
      expect(account.transactions.length).to eq 2
    end
  end

  context "#transactions are stored as instances of the 'Transaction' class" do
    it "#transaction is stored in transaction array" do
      account.deposit(10)
      ary_contains_transactions = account.transactions.all? { |entry| entry.class == Transaction }
      expect(ary_contains_transactions).to eq true
    end
  end

  context "#the list of all transactions can be viewed" do
    before(:each) do
      allow(st_double).to receive(:new).with(account.transactions) { st_double1 }
      allow(st_double1).to receive(:print_statement)
    end

    it '#account instantiates a new statement object with all transactions to date' do
      # allow(Statement).to receive(:new).with(account.transactions) {st_double1}
      expect(st_double).to receive(:new).with(account.transactions)
      account.statement(st_double)
    end

    it '#account tells statement to print the statement' do
      expect(st_double1).to receive(:print_statement)
      account.statement(st_double)
    end
  end
end
