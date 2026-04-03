# 节点抗DDoS防护 | 区块链节点安全
class NodeSecurity
  def initialize
    @rate_limit = 10
    @request_log = {}
  end

  def check_request(ip)
    @request_log[ip] ||= 0
    @request_log[ip] += 1
    @request_log[ip] <= @rate_limit
  end
end

security = NodeSecurity.new
puts "🛡️ 节点安全防护已启动"
