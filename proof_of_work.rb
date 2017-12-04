require "digest"
require "pp"

class ProofOfWork

  def initialize(block)
    @block = block
  end

  def run(difficulty="00")
    nonce = 0
    loop do
      hash = calc_hash_with_nonce(nonce)
      if hash.start_with?(difficulty)
        return [nonce,hash]
      else
        nonce += 1
      end
    end
  end

  private

    attr_reader :block

    def calc_hash_with_nonce(nonce=0)
      sha = Digest::SHA256.new
      sha.update(nonce.to_s + block.index.to_s + block.timestamp.to_s + block.data + block.previous_hash )
      sha.hexdigest
    end
end
