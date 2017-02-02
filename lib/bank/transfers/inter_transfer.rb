require './lib/bank/transfer'

module Bank
  class InterTransfer < Transfer
    COMMISSION = 5
    attr_reader :money

    def initialize(sender, receiver, money)
      super sender, receiver, money
      raise "Exceeded limit of 1000 euros, please make different transfers" if money > 1000

      @money = money.to_i - 5
    end
  end
end
