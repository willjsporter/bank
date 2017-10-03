class Bank

attr_reader :balance, :transactions

def initialize
  @balance = 0
  @transactions = Array.new
end

def deposit(amt)
  @balance +=amt
  the_time = Time.now.strftime("%d/%m/%Y")
  @transactions << {time: Time.now, debit: amt, balance: @balance}
end

def withdraw(amt)
  @balance -=amt
  @transactions << {time: Time.now, credit: amt, balance: @balance}
end

end
