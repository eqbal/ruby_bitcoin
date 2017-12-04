#  build your own blockchain from scratch in 20 lines of ruby!
#
#  to run use:
#    $ ruby ./block.rb


require "digest"
require "pp"
require "./proof_of_work"


class Block

  attr_reader :index
  attr_reader :timestamp
  attr_reader :data
  attr_reader :previous_hash
  attr_reader :hash
  attr_reader :nonce

  def initialize(index, data, previous_hash)
    @index         = index
    @timestamp     = Time.now
    @data          = data
    @previous_hash = previous_hash
    @nonce, @hash  = ProofOfWork.new(self).run
  end

  def self.first(data="Genesis")
    Block.new(0, data, "0")
  end

  def self.next(previous, data="Transaction Data...")
    Block.new(previous.index+1, data, previous.hash)
  end

end

b0 = Block.first( "Genesis" )
b1 = Block.next( b0, "Transaction Data..." )
b2 = Block.next( b1, "Transaction Data......" )
b3 = Block.next( b2, "More Transaction Data..." )

blockchain = [b0, b1, b2, b3]

pp blockchain
