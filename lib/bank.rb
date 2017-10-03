require_relative 'transaction.rb'
class Bank
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amt, trans = Transaction)
    @balance += amt
    # the_time = Time.now.strftime("%d/%m/%Y")
    @transactions << trans.new(amt, @balance)
  end

  def withdraw(amt, trans = Transaction)
    @balance -= amt
    @transactions << trans.new(-amt, @balance)
  end

  def print_statement
  #   print_header
  #   @transactions.each do |trans|
  #     print trans.
  #   end
  end

end


class Statement

  attr_reader :line_list

  def initialize
    @line_list = Array.new
  end

  def header
    'date || credit || debit || balance'
  end

  def lines(hash_ary)
    hash_ary.each do |h|
      @line_list.unshift(hash_to_string(h))
    end
  end

  def hash_to_string(hash)
    "#{hash[:date]} || #{hash[:credit]} || #{hash[:debit]} || #{hash[:balance]}"
  end

  # def input_checker(hash_ary)
  #   condition = (hash_ary.is_a?(Array) && hash_ary.all? { |h| h.is_a?(Hash) })
  #   raise "must be an array of hashes" unless condition
  # end
end
