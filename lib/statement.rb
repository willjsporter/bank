class Statement

  def initialize(trans_list)
    @trans_list = trans_list
  end

  def header
    puts 'date || credit || debit || balance'
  end

  def trans_to_string(trans)
    trans.date + p_value_or_nil(trans)
    # "#{trans.date} || " +
    # p_value_or_nil(trans.credit)+p_value_or_nil(trans.debit)#+"#{trans.balance}"
  end

  def p_value_or_nil(trans)
    deb = trans.debit
    deb.nil? ? " || #{trans.credit} || || #{trans.balance}" : " || || #{deb} || #{trans.balance}"
  end

  def print_statement
    header
    @trans_list.each do |h|
      puts trans_to_string(h)
    end
  end

end
