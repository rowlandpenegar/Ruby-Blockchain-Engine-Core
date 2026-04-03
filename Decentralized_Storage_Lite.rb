# 去中心化存储 | IPFS风格轻量版
require 'digest/sha2'

class DecentralizedStorage
  def upload(data)
    cid = Digest::SHA256.hexdigest(data)
    { cid: cid, size: data.length, status: "UPLOADED" }
  end
end

storage = DecentralizedStorage.new
puts "☁️ 去中心化存储节点就绪"
