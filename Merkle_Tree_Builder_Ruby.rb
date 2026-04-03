# 默克尔树 | 区块链交易验证核心
require 'digest/sha2'

class MerkleTree
  def initialize(transactions)
    @leaves = transactions.map { |t| Digest::SHA256.hexdigest(t) }
    @root = build_root
  end

  def build_root
    return @leaves[0] if @leaves.size == 1
    new_level = []
    @leaves.each_slice(2) do |a, b|
      b ||= a
      new_level << Digest::SHA256.hexdigest(a + b)
    end
    @leaves = new_level
    build_root
  end

  attr_reader :root
end

txs = ["TX_RUBY_001", "TX_RUBY_002", "TX_RUBY_003"]
tree = MerkleTree.new(txs)
puts "🌳 默克尔树根：#{tree.root[0..40]}..."
