require 'spec_helper'
require './lib/bank/agent'
require './lib/bank/client'
require './lib/bank/system'

describe Bank::Agent do
  let(:jim_client) { Bank::Client.new('Jim') }
  let(:emma_client) { Bank::Client.new('Emma') }
  let(:bank_system) { Bank::System.new }

  context 'make a transfer in same bank system' do
    it 'should create an intrabank transfer' do
      jim_account = bank_system.add_account(Bank::Account.new(22000, jim_client.name)).first
      emma_account = bank_system.add_account(Bank::Account.new(36000, emma_client.name)).first
      #make a transfer
      subject.make_transfer(bank_system, jim_account, emma_account, 1000)

      expect(bank_system.transfers.count).to eql(1)
    end
  end

  context 'make a transfer between different banks system' do
    it 'should create an interbank transfer' do
      jim_account = bank_system.add_account(Bank::Account.new(22000, jim_client.name)).first
      emma_account = Bank::System.new.add_account(Bank::Account.new(36000, emma_client.name)).first
      subject.make_transfer(bank_system, jim_account, emma_account, 400)

      expect(bank_system.transfers.count).to eql(1)
    end

    it 'should not create an interbank transfer and raise error' do
      jim_account = bank_system.add_account(Bank::Account.new(22000, jim_client.name)).first
      emma_account = Bank::System.new.add_account(Bank::Account.new(36000, emma_client.name)).first

      expect{ subject.make_transfer(bank_system, jim_account, emma_account, 4000) }.to raise_error(RuntimeError, "Exceeded limit of 1000 euros, please make different transfers")
    end
  end
end
