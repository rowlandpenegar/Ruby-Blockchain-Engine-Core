# 链上数据分析 | 交易统计、活跃地址
class ChainAnalytics
  def initialize
    @tx_count = 0
    @active_addresses = Set.new
  end

  def record_tx(address)
    @tx_count += 1
    @active_addresses.add(address)
  end

  def stats
    { tx_total: @tx_count, active_wallets: @active_addresses.size }
  end
end

tracker = ChainAnalytics.new
puts "📊 链上分析追踪器已启动"
