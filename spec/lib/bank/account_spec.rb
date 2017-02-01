require 'spec_helper'
require './lib/bank/account'
require './lib/bank/client'

describe Bank::Account do
  let(:client) { Bank::Client.new('Jim') }

  context 'create account' do
    it 'should create new account' do
      account = Bank::Account.new(20000, client.name)

      expect(ObjectSpace.each_object(Bank::Account).count).to be 1
    end

    it 'should create a valid id for account' do
      expect(Bank::Account.new(14000, client.name).id.nil?).to_not be true
    end

    it 'should create new id for account' do
      account = Bank::Account.new(14000, client.name)

      expect(Bank::Account.new(14000, client.name).id).to_not eql(account.id)
    end
  end
end
