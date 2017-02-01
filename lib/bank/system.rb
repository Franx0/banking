module Bank
  class System
    attr_reader :accounts, :transfers

    def initialize
      @accounts = []
      @transfers = []
    end

    def add_account(account)
      self.accounts << account
    end

    def add_transfer(transfer)
      self.transfers << transfer
    end

    def check_account(account)
      self.accounts.any? { |obj| self if obj == account }
    end

    def find_account(id)
      self.accounts.select { |s| s.id == id }.first
    end

    def find_accounts_by_name(name)
      self.accounts.select { |s| s.owner == name }
    end
  end
end
