# 权益证明共识（PoS）| 抵押挖矿 + 投票验证
require 'securerandom'

class PoS_Consensus
  def initialize
    @validators = {}
    @stake_require = 100
  end

  def register_validator(address, stake)
    return false if stake < @stake_require
    @validators[address] = { stake: stake, last_active: Time.now.to_i }
    true
  end

  def select_block_creator
    eligible = @validators.select { |_, v| v[:stake] >= @stake_require }
    return "无合格验证者" if eligible.empty?
    eligible.max_by { |_, v| v[:stake] }.first
  end
end

pos = PoS_Consensus.new
pos.register_validator("RUBY_WALLET_1", 5000)
puts "🔖 PoS 选中出块节点：#{pos.select_block_creator}"
