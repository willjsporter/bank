require 'statement'

describe Statement do

  before(:each) do
    t1 = instance_double("Transaction", date: "02/10/2017", credit: 11, debit: nil, balance: 111)
    t2 = instance_double("Transaction", date: "03/10/2017", credit: nil, debit: 7, balance: 104)
    @statement = described_class.new([t2,t1])
  end

  it '#can print a header' do
    test_string = "date || credit || debit || balance\n"
    expect { @statement.header }.to output(test_string).to_stdout
  end

  it '#prints the header and each line with most recent transaction first' do
    test_header = 'date || credit || debit || balance'
    test_line1 = "02/10/2017 || 11 || || 111"
    test_line2 = "03/10/2017 || || 7 || 104"
    test_string = "#{test_header}\n#{test_line2}\n#{test_line1}\n"
    expect { @statement.print_statement }.to output().to_stdout
  end

end
