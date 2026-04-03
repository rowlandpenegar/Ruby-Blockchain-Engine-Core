# 轻量级智能合约虚拟机 | EVM风格简化版
class RubyContractVM
  def initialize
    @storage = {}
  end

  def deploy_contract(name, code)
    @storage[name] = { code: code, deployed_at: Time.now.to_i }
  end

  def execute_contract(name, input)
    return false unless @storage.key?(name)
    { result: "EXECUTED", input: input, contract: name }
  end
end

vm = RubyContractVM.new
vm.deploy_contract("RubyToken", "TRANSFER + BALANCE")
puts "🤖 智能合约已部署"
