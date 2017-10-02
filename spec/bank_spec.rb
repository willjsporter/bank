require 'bank'

describe Bank do

let(:bank) { described_class.new }

  context "#will store a balance" do
    it "default balance is zero" do
      expect(bank.balance).to eq 0
    end
  end

  context "#clients can make deposits" do
    
  end

  context "#clients can make withdrawals" do

  end

  context "#the list of all transactions can be viewed" do

  end

end
