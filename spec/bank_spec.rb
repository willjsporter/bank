require 'bank'
require 'transaction'

describe Bank do
  let(:bank) { described_class.new }
  let(:trans1) { double :Transaction }
  let(:trans2) { double :Transaction }


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
      bank.deposit(10)
      bank.deposit(20)
      expect(bank.transactions.length).to eq 2
    end
  end

  context "#clients can make withdrawals" do
    it "#balance decreases for withdrawals" do
      bank.withdraw(10)
      expect(bank.balance).to eq(-10)
    end

    it "#withdrawal transaction is stored in transaction array" do
      bank.deposit(10)
      bank.withdraw(20)
      expect(bank.transactions.length).to eq 2
    end
  end

  context "#transactions are stored as instances of the 'Transaction' class" do
    it "#transaction is stored in transaction array" do
      bank.deposit(10)
      ary_contains_transactions = bank.transactions.all? { |entry| entry.class == Transaction }
      expect(ary_contains_transactions).to eq true
    end
  end

  context "#the list of all transactions can be viewed" do
    xit '#prints a header' do
      expect(bank).to receive(:print_header)
      bank.print_statement
    end

    xit '#prints the individual lines of the statement with a header' do
      t1_hash = {date: '02/10/2017', credit: nil, debit: 10, balance: 10}
      t2_hash = {date: '03/10/2017', credit: 5, debit: nil, balance: 5}
      allow(trans1).to receive(:new).with(10,0).and_return(t1_hash)
      allow(trans2).to receive(:new).with(-5,0).and_return(t2_hash)
      bank.deposit(10,trans1)
      bank.withdraw(-5,trans2)
      test_header = 'date || credit || debit || balance'
      test_line1 = '02/10/2017 || || 10.00 || 10.00'
      test_line2 = '03/10/2017 || 5.00 || || 5.00'
      test_statement = "test_header\ntest_line1\ntest_line2"
      expect(bank.print_statement).to eq(test_statement)

    end
  end
end
