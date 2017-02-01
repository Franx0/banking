require 'spec_helper'
require './lib/bank/transfers/intra_transfer'

describe Bank::IntraTransfer do
  let(:jim_account) { jim_account = Bank::Account.new(22000, Bank::Client.new('Jim').name) }
  let(:emma_account) { emma_account = Bank::Account.new(36000, Bank::Client.new('Emma').name) }

  context 'valid IntraTransfer' do
    let(:transfer) { Bank::IntraTransfer.new(jim_account.owner, emma_account.owner, 5000) }

    it 'should have correct data' do
      expect(transfer.sender).to eql(jim_account.owner)
      expect(transfer.receiver).to eql(emma_account.owner)
      expect(transfer.money).to eql(5000)
    end
  end
end
