class CryptoDatum < ApplicationRecord
    validates :user_document, :credit_card_token, :value, presence: true

    before_save :encrypt_user_document, :encrypt_credit_card_token
    after_find :decrypt_user_document, :decrypt_credit_card_token

    private

    def encrypt_user_document
        sensitive = self.user_document
        self.user_document = EncryptionService.instance.cipher(sensitive)
    end
    
    def encrypt_credit_card_token
        sensitive = self.credit_card_token
        self.credit_card_token = EncryptionService.instance.cipher(sensitive)
    end

    def decrypt_user_document
        crypt = self.user_document
        self.user_document = EncryptionService.instance.decipher(crypt)
    end

    def decrypt_credit_card_token
        crypt = self.credit_card_token
        self.credit_card_token = EncryptionService.instance.decipher(crypt)
    end
end
