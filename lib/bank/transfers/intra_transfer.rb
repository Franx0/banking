require './lib/bank/transfer'

module Bank
  class IntraTransfer < Transfer
    attr_reader :money

    def initialize(sender, receiver, money)
      super sender, receiver, money
      @money = money.to_i
    end
  end
end
