module Bank
  class Account
    attr_reader :id, :owner, :bank
    attr_accessor :money

    def initialize(money, client)
      @money = money
      @owner = client
      @id = self.object_id
    end
  end
end
