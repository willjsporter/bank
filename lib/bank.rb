require_relative 'transaction.rb'
class Bank
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amt, trans = Transaction)
    transaction(amt,trans)
  end


  def withdraw(amt, trans = Transaction)
    transaction(-amt,trans)
  end

  def transaction(amt,trans)
    @balance += amt
    @transactions.unshift(trans.new(amt, @balance))
  end

  def print_statement
  #   print_header
  #   @transactions.each do |trans|
  #     print trans.
  #   end
  end

end
