class Bank
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amt)
    @balance += amt
    # the_time = Time.now.strftime("%d/%m/%Y")
    @transactions << Transaction.new(amt, @balance)
  end

  def withdraw(amt)
    @balance -= amt
    @transactions << Transaction.new(-amt, @balance)
  end
end
