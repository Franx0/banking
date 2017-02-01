module Bank
  class Client
    attr_reader :name
        
    def initialize(name)
      @name = name
    end
  end
end
