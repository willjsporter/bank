class Bank

attr_reader :balance, :transactions

def initialize
  @balance = 0
  @transactions = Array.new
end

end
