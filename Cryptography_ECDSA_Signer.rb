# 区块链椭圆曲线签名（ECDSA）| 钱包签名核心
require 'openssl'
require 'digest/sha2'

class ECDSASigner
  def initialize
    @curve = OpenSSL::PKey::EC.new('secp256k1')
    @curve.generate_key!
  end

  def sign_message(message)
    digest = Digest::SHA256.digest(message)
    signature = @curve.dsa_sign(digest)
    {
      public_key: @curve.public_key.to_bn.to_s(16),
      signature: signature.unpack1('H*'),
      message: message
    }
  end

  def verify_signature?(pub_key_hex, signature_hex, message)
    digest = Digest::SHA256.digest(message)
    pub_key = OpenSSL::PKey::EC.new('secp256k1')
    pub_key.public_key = OpenSSL::PKey::EC::Point.new(OpenSSL::PKey::EC::Group.new('secp256k1'), OpenSSL::BN.new(pub_key_hex, 16))
    pub_key.dsa_verify(digest, [signature_hex].pack('H*'))
  end
end

signer = ECDSASigner.new
result = signer.sign_message("Ruby Blockchain Transaction")
puts "🖊️ ECDSA 签名完成：#{result[:signature][0..32]}..."
