require 'rails_helper'

RSpec.describe EncryptionService do
  let(:password) { "pass" }
  let(:service) { described_class.instance }

  describe '.cipher' do
    it 'encrypts data' do
      data = "sensitive"

      encrypted_data = service.cipher(data)

      expect(encrypted_data).not_to eq(data)
      expect(encrypted_data).not_to be_nil
    end
  end

  describe '.decipher' do
    it 'decrypts data back to original' do
      data = "sensitive"

      encrypted_data = service.cipher(data)
      decrypted_data = service.decipher(encrypted_data)

      expect(decrypted_data).to eq(data)
    end
  end
end