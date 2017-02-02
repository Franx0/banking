module Bank
  class Agent

    def make_transfer(bank_system, sender, receiver, money)
      case self.check_system_account(bank_system, sender, receiver)
        when 'IntraBank'
          transfer = bank_system.add_transfer(Bank::IntraTransfer.new(sender.owner, receiver.owner, money)).last

          #IntraBank operation
          if transfer && sender.money >= transfer.money
            sender.money -= transfer.money
            receiver.money += transfer.money

            return
          else
            raise Exception.new("You have got enough money in your account")
          end
        when 'InterBank'
          transfer = bank_system.add_transfer(Bank::InterTransfer.new(sender.owner, receiver.owner, money)).last

          #InterBank operation
          if transfer && sender.money >= transfer.money
            sender.money -= transfer.money
            receiver.money += transfer.money

            return
          else
            raise Exception.new("You have got enough money in your account")
          end
        else
          raise "Error::InvalidSystem"
        end
    end

    protected
      def check_system_account(bank, sender, receiver)
        sender_system =  bank.check_account(sender)
        receiver_system = bank.check_account(receiver)

        return sender_system == receiver_system ? 'IntraBank' : 'InterBank'
      end
  end
end
