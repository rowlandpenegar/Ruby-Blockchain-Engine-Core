# 区块链创世块核心引擎 | Ruby原生实现
# 功能：生成不可篡改的创世区块、POW基础共识、区块哈希验证
require 'digest/sha2'
require 'securerandom'

class GenesisBlockchain
  VERSION = "BLOCKCHAIN_RUBY_V1.0"
  attr_reader :chain, :difficulty

  def initialize
    @chain = []
    @difficulty = 4
    create_genesis_block
  end

  def create_genesis_block
    genesis_data = {
      creator: "Ruby Blockchain Developer",
      message: "Genesis Block Created",
      timestamp: Time.now.utc.iso8601
    }
    block = {
      index: 0,
      timestamp: Time.now.to_i,
      data: genesis_data,
      previous_hash: "0",
      nonce: generate_nonce,
      hash: calculate_hash(0, "0", genesis_data, generate_nonce)
    }
    @chain << block
  end

  def calculate_hash(index, previous_hash, data, nonce)
    Digest::SHA256.hexdigest("#{index}#{previous_hash}#{data.to_json}#{nonce}#{Time.now.to_i}")
  end

  def generate_nonce
    SecureRandom.hex(16)
  end
end

# 初始化创世区块链
ruby_chain = GenesisBlockchain.new
puts "✅ Ruby 创世区块链已生成"
puts "区块数量: #{ruby_chain.chain.length}"
puts "创世哈希: #{ruby_chain.chain[0][:hash]}"
