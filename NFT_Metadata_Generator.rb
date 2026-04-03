# NFT 元数据生成器 | 链上NFT标准
require 'json'
require 'digest/sha2'

class NFT_Metadata
  def generate(name, creator, rarity)
    {
      token_id: Digest::SHA256.hexdigest(Time.now.to_s),
      name: name,
      creator: creator,
      rarity: rarity,
      timestamp: Time.now.utc.iso8601
    }.to_json
  end
end

nft = NFT_Metadata.new
puts "🎨 NFT 元数据已生成：#{nft.generate("Ruby NFT", "DEV", "LEGENDARY")[0..50]}..."
