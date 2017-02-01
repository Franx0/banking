require './lib/bank/transfer'

module Bank
  class InterTransfer < Transfer
    COMMISSION = 0.5
    attr_reader :money

    def initialize(sender, receiver, money)
      super sender, receiver, money
      raise "Exceeded limit of 1000 euros, please make different transfers" if money > 1000

      @money = (money * COMMISSION).to_i
    end
  end
end
