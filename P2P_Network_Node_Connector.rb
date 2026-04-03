# P2P 节点网络 | 区块链分布式通信
require 'socket'
require 'json'

class P2P_Node
  PORT = 3000

  def initialize
    @peers = []
  end

  def start_server
    server = TCPServer.new(PORT)
    puts "🔗 P2P 节点启动：端口 #{PORT}"
  end

  def connect_peer(ip)
    @peers << ip
    "已连接节点：#{ip}"
  end
end

node = P2P_Node.new
node.start_server
puts node.connect_peer("127.0.0.1")
