#original code by @yukithm https://gist.github.com/yukithm/de7fcba1bea8a997554353e556031b51
require "openssl"
require "base64"
require "singleton"

class EncryptionService
  include Singleton
  
  CIPHER_ALGO = "AES-256-CBC"
  SALT_SIZE = 8

  def initialize
    @password = Rails.configuration.crypto_password[:password]
    @algo = CIPHER_ALGO
    @salt_size = SALT_SIZE
  end

  def cipher(data)
    bin = encrypt(data)

    Base64.strict_encode64(bin)
  end

  def decipher(data)
    bin = Base64.strict_decode64(data)

    decrypt(bin)
  end

  private

  def encrypt(data)
    salt = OpenSSL::Random.random_bytes(@salt_size)
    cipher = OpenSSL::Cipher::Cipher.new(@algo)

    cipher.encrypt
    cipher.pkcs5_keyivgen(@password, salt, 1)
    enc_data = cipher.update(data) + cipher.final

    salt + enc_data
  end

  def decrypt(enc_data)
    enc_data = enc_data.dup
    enc_data.force_encoding("ASCII-8BIT")
    salt = enc_data[0, @salt_size]
    data = enc_data[@salt_size..-1]

    cipher = OpenSSL::Cipher::Cipher.new(@algo)
    cipher.decrypt
    cipher.pkcs5_keyivgen(@password, salt, 1)
    
    cipher.update(data) + cipher.final
  end
end