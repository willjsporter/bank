class Statement
  def initialize(trans_list)
    @trans_list = trans_list
  end

  def trans_to_string(trans)
    trans.date + p_value_or_nil(trans)
  end

  def p_value_or_nil(trans)
    deb = trans.debit
    deb.nil? ? " || #{trans.credit} || || #{trans.balance}" : " || || #{deb} || #{trans.balance}"
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @trans_list.each do |h|
      puts trans_to_string(h)
    end
  end

  private :trans_to_string, :p_value_or_nil
end
