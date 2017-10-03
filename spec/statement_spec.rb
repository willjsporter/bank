require 'bank'
# require 'statement'

describe Statement do
  let(:test_hash_ary) { [ { date: "02/10/2017", credit: 11, debit: nil, balance: 111} ]}
  # let(:test_lines) { subject.lines(test_hash_ary) }

  context '#Statement has compiler methods' do
    # subject(:statement) { described_class.new }

    it "can return a header" do
      expect(subject.header).to eq 'date || credit || debit || balance'
    end

    it "can return a withdrawal line" do
      subject.lines(test_hash_ary)
      expect(subject.line_list.first).to eq "02/10/2017 || 11 ||  || 111"
    end
  end

  context '#Statement can be printed' do

    xit 'prints the header and each line with the correct format' do
      expect(subject.print_header).to eq 'date || credit || debit || balance'
    end

  end
end
