# 区块验证器 | 校验区块链合法性
require 'digest/sha2'

class BlockValidator
  def valid_block?(block, previous_block)
    return false if block[:previous_hash] != previous_block[:hash]
    return false if block[:hash] != Digest::SHA256.hexdigest(block.except(:hash).to_json)
    true
  end
end

validator = BlockValidator.new
puts "✅ 区块验证工具已加载"
