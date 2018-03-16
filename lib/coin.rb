require 'coin/version'
require 'openssl'
require 'base64'

module Coin
  CYPHER = 'aes-256-gcm'.freeze
  AUTH_DATA = ''.freeze

  def self.new_cipher
    OpenSSL::Cipher.new(CYPHER)
  end

  def self.encrypt(plaintext:)
    cipher = new_cipher.encrypt

    key = cipher.random_key
    iv  = cipher.random_iv

    cipher.key = key
    cipher.iv  = iv
    cipher.auth_data = AUTH_DATA

    ciphertext = cipher.update(plaintext) + cipher.final

    { data: ciphertext, key: key, nonce: iv, tag: cipher.auth_tag }
  end

  def self.decrypt(data:, key:, nonce:, tag:)
    decipher = new_cipher.decrypt

    decipher.key       = key
    decipher.iv        = nonce
    decipher.auth_data = AUTH_DATA
    decipher.auth_tag  = tag

    { plaintext: decipher.update(data) + decipher.final }
  end
end
