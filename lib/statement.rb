class Statement

  def initialize(trans_list)
    @trans_list = trans_list
  end

  def header
    puts 'date || credit || debit || balance'
  end

  def hash_to_string(trans)
    "#{trans.date} || #{trans.credit} || #{trans.debit} || #{trans.balance}"
  end

  def print_statement
    header
    @trans_list.each do |h|
      puts hash_to_string(h)
    end
  end

end
