require_relative 'bank'
require 'byebug'
#Create clientsnk1
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

  puts "Jim debts 20000 euros to Emma, he has to pay them by transfer but Jim has an account in Bank1 with 20000 euros"
  puts
  puts "Emma is going to open a new account in bank2 with 0 euros in funds"
  puts
  bank2.accounts.push(emma_account)
  puts "Choose the bank where you want to do the transfer from, only two options (Bank1, or Bank2), write it"
  puts

  bank_prompt = "## Bank where make the transfer to ##"
  puts
  p bank_prompt
  bank_transfer = $stdin.gets.chomp

  paid = true
  money_trans = ''

  money_transfer = lambda {
    puts "Jim is going to make a new transfer from #{bank_transfer} to Emma"
    puts
    puts "Jim is going to pay Emma and shows her the transfer"
    puts
    money_prompt = '## How many euros do you want to transfer ##'
    p money_prompt
    money_trans = $stdin.gets.chomp
  }

  enough_money = lambda {
    if(emma_account.money.to_i == 20000 )
      paid = false
      puts "And it's Emma account funds #{emma_account.money} euros"
      puts
    else
      puts "Emma: -Its not enough, you debt to me #{20000 - emma_account.money.to_i}"
      puts
    end
  }


  while paid do
    if(bank_transfer == "Bank1")
      puts "Remember you only can't exceed 1000 euros transfer and you have a comission of 5 euros"
      money_transfer.call
      bank1.accounts.push(jim_account)
      agent.make_transfer(bank1, jim_account, emma_account, money_trans.to_i)

      enough_money.call
    elsif(bank_transfer == "Bank2")
      money_transfer.call
      bank2.accounts.push(jim_account)
      agent.make_transfer(bank2, jim_account, emma_account, money_trans.to_i)

      puts "Jim: -Now I can do the transfer Emma, see #{bank2.transfers}"
      puts
      enough_money.call
    else
      puts "BANK: -Please, choose a correct option (Bank1, or Bank2)"
      puts
      bank_transfer = $stdin.gets.chomp
    end
  end
