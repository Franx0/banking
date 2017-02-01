module Bank
  class Transfer
    attr_reader :sender, :receiver, :commission
    attr_accessor :money

    def initialize(sender, receiver, money)
      @money = money
      @sender = sender
      @receiver = receiver
    end
  end
end
