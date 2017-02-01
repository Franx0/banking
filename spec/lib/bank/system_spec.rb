require 'spec_helper'
require './lib/bank/system'

describe Bank::System do
  describe 'accounts' do
    context 'return accounts' do
      it 'should return bank accounts list' do
        expect(subject.accounts.empty?).to be true
      end
    end

    context 'add new account' do
      it 'should add new account' do
        account = Bank::Account.new(20000, 'Jim')

        expect(subject.add_account(account)).to eql([account])
      end
    end

    context 'find account by client' do
      it 'should return client accounts' do
        subject.accounts.push(
          Bank::Account.new(20000, 'Jim'),
          Bank::Account.new(14000, 'Emma'),
          Bank::Account.new(10000, 'Jim')
        )

        expect(subject.find_accounts_by_name('Emma').count).to eql(1)
      end
    end

    context 'find account by id' do
      it 'should return client account by id' do
        emma_account = Bank::Account.new(14000, 'Emma')
        subject.accounts.push(
          Bank::Account.new(20000, 'Jim'),
          Bank::Account.new(10000, 'Jim'),
          emma_account
        )

        expect(subject.find_account(emma_account.id)).to eql(emma_account)
      end
    end
  end

  describe 'transfers' do
    context 'return transfers' do
      it 'should return bank transfers list' do
        expect(subject.transfers.empty?).to be true
      end
    end

    context 'add new transfer' do
      it 'should add new transfer' do
        transfer = Bank::Transfer.new('Jim', 'Emma', 20000)

        expect(subject.add_transfer(transfer)).to eql([transfer])
      end
    end
  end
end
