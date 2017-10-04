class Transaction
  attr_reader :date, :debit, :credit, :balance

  @debit, @credit = nil

  def initialize(debit_credit, new_balance)
    raise "Not a valid transaction" unless debit_credit.is_a?(Numeric)
    @date = datify
    @balance = new_balance
    deb_cred(debit_credit)
  end

  def deb_cred(amt)
    amt < 0 ? @debit = -amt : @credit = amt
  end

  def datify
    Time.now.strftime("%d/%m/%Y")
  end

  private :deb_cred, :datify
end
