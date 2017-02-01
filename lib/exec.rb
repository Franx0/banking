require_relative 'bank'

#Create clients
  jim_client = Bank::Client.new('Jim')
  emma_client = Bank::Client.new('Emma')
#Create banks
  bank1 = Bank::System.new
  bank2 = Bank::System.new
#Create accounts
  jim_account = Bank::Account.new(20000, jim_client.name)
  emma_account = Bank::Account.new(0, emma_client.name)
#Create agent
  agent = Bank::Agent.new

  p "Emma is going to open a new account in bank2 with 0 euros in funds"
  bank2.accounts.push(emma_account)
  p "Choose the bank where you want to do the transfer from, only two options (Bank1, or Bank2), write it"

  bank_prompt = '## Bank where make the transfer to ##'
  p bank_prompt
  bank_transfer = $stdin.gets.chomp

  p "Jim is going to open a new account in #{bank_transfer} and make a transfer to Emma"
  p "Emma is very angry with Jim because he's not paid her yet, Jim is going to pay Emma and shows her the transfer"

  paid = true

  while paid do
    money_prompt = '## How many euros do you wnat to transfer ##'
    p money_prompt
    money_trans = $stdin.gets.chomp

    if(bank_transfer == "Bank1")
      bank1.accounts.push(jim_account)
      p "Oops and error occurred, please restart the program"
      agent.make_transfer(bank1, jim_account, emma_account, money_trans.to_i)
    elsif(bank_transfer == "Bank2")
      bank2.accounts.push(jim_account)
      agent.make_transfer(bank2, jim_account, emma_account, money_trans.to_i)

      p "-Now I can do the transfer Emma, see #{bank2.transfers}"
      if(emma_account.money.to_i == 20000 )
        p "And it's Emma account funds #{emma_account.money} euros"
        paid = false
      else
        p "Its not enough, you debt to me #{20000 - emma_account.money.to_i}"
      end
    else
      p "Please, choose a correct option (Bank1, or Bank2)"
      bank_transfer = $stdin.gets.chomp
    end
  end
