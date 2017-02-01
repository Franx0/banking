require 'spec_helper'
require './lib/bank/transfers/inter_transfer'

describe Bank::InterTransfer do
  let(:jim_account) { jim_account = Bank::Account.new(22000, Bank::Client.new('Jim').name) }
  let(:emma_account) { emma_account = Bank::Account.new(36000, Bank::Client.new('Emma').name) }

  context 'valid InterTransfer' do
    let(:transfer) { Bank::InterTransfer.new(jim_account.owner, emma_account.owner, 1000) }

    it 'should have correct data' do
      expect(transfer.sender).to eql(jim_account.owner)
      expect(transfer.receiver).to eql(emma_account.owner)
      expect(transfer.money).to eql((1000 * Bank::InterTransfer::COMMISSION).to_i)
    end
  end

  context 'invalid InterTransfer' do
    it 'should not have exist' do
      expect{ Bank::InterTransfer.new(jim_account.owner, emma_account.owner, 1001) }.to raise_error(RuntimeError, "Exceeded limit of 1000 euros, please make different transfers")
    end
  end
end
