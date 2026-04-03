# 区块链钱包 | 助记词 + 公私钥生成
require 'openssl'
require 'securerandom'

class RubyWallet
  def generate_mnemonic
    SecureRandom.hex(32).scan(/.{4}/).join('-')
  end

  def generate_key_pair
    key = OpenSSL::PKey::RSA.new(2048)
    {
      private_key: key.to_pem,
      public_key: key.public_key.to_pem
    }
  end
end

wallet = RubyWallet.new
puts "🪪 助记词：#{wallet.generate_mnemonic[0..40]}..."
