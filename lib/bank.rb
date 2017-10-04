require_relative 'transaction.rb'
class Bank
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amt, trans = Transaction)
    transaction(amt, trans)
  end

  def withdraw(amt, trans = Transaction)
    transaction(-amt, trans)
  end

  def transaction(amt, trans)
    @balance += amt
    @transactions.unshift(trans.new(amt, @balance))
  end

  def statement(stmt = Statement)
    show_bal = stmt.new(@transactions)
    show_bal.print_statement
  end
end
