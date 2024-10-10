require 'rails_helper'

RSpec.describe CryptoDatum, type: :model do
  let(:user_document) { 'user_document_value' }
  let(:credit_card_token) { 'credit_card_token_value' }
  let(:value) { 100.0 }
  let(:crypto_datum) { CryptoDatum.create(user_document: user_document, credit_card_token: credit_card_token, value: value) }

  describe 'validations' do
    it 'validates presence of user_document' do
      crypto_datum.user_document = nil
      expect(crypto_datum).not_to be_valid
      expect(crypto_datum.errors[:user_document]).to include("can't be blank")
    end

    it 'validates presence of credit_card_token' do
      crypto_datum.credit_card_token = nil
      expect(crypto_datum).not_to be_valid
      expect(crypto_datum.errors[:credit_card_token]).to include("can't be blank")
    end

    it 'validates presence of value' do
      crypto_datum.value = nil
      expect(crypto_datum).not_to be_valid
      expect(crypto_datum.errors[:value]).to include("can't be blank")
    end
  end

  describe 'callbacks' do
    context 'before_save' do
      it 'encrypts user_document' do
        crypto_datum.save
        expect(crypto_datum.user_document).not_to eq(user_document)
        expect(crypto_datum.user_document).not_to be_nil
      end

      it 'encrypts credit_card_token' do
        crypto_datum.save
        expect(crypto_datum.credit_card_token).not_to eq(credit_card_token)
        expect(crypto_datum.credit_card_token).not_to be_nil
      end
    end

    context 'after_find' do
      it 'decrypts user_document' do
        found_crypto_datum = CryptoDatum.find(crypto_datum.id)
        expect(found_crypto_datum.user_document).to eq(user_document)
      end

      it 'decrypts credit_card_token' do
        found_crypto_datum = CryptoDatum.find(crypto_datum.id)
        expect(found_crypto_datum.credit_card_token).to eq(credit_card_token)
      end
    end
  end
end
