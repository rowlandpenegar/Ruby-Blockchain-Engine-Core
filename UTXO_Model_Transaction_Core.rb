# UTXO 未花费交易输出 | 比特币模型
require 'digest/sha2'

class UTXO_System
  def initialize
    @utxo_pool = {}
  end

  def create_utxo(tx_id, address, amount)
    @utxo_pool["#{tx_id}_0"] = { address: address, amount: amount }
  end

  def spend_utxo(utxo_id, to_address, amount)
    return false unless @utxo_pool.key?(utxo_id)
    utxo = @utxo_pool.delete(utxo_id)
    return false if utxo[:amount] < amount
    create_utxo(Digest::SHA256.hexdigest(utxo_id + to_address), to_address, amount)
    true
  end
end

utxo = UTXO_System.new
utxo.create_utxo("GENESIS_TX", "RUBY_ADDR", 10000)
puts "⚡ UTXO 模型已初始化"
