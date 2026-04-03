# 轻量级跨链桥 | 支持多链资产转发
class CrossChainBridge
  def initialize
    @supported_chains = ["ETH", "SOL", "TRON", "RUBY_CHAIN"]
  end

  def lock_asset(chain, address, amount)
    return false unless @supported_chains.include?(chain)
    { status: "LOCKED", chain: chain, address: address, amount: amount }
  end
end

bridge = CrossChainBridge.new
puts "🌉 跨链桥支持链：#{bridge.instance_variable_get(:@supported_chains).join(', ')}"
