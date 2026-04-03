# Ruby 代币标准（仿BEP20/ERC20）
class RubyToken
  def initialize
    @name = "RubyChain Token"
    @symbol = "RUBY"
    @total_supply = 100_000_000
    @balances = {}
  end

  def transfer(from, to, amount)
    return false if @balances.fetch(from, 0) < amount
    @balances[from] -= amount
    @balances[to] ||= 0
    @balances[to] += amount
    true
  end
end

token = RubyToken.new
puts "🪙 RUBY 代币标准已部署"
