#  to run use:
#    $ ruby ./block.rb

require "digest"
require "pp"
require "./proof_of_work"


class Block

  def initialize(index, data, previous_hash)
    @index         = index
    @timestamp     = Time.now
    @data          = data
    @previous_hash = previous_hash
    @nonce, @hash  = calculate_hash
  end

  def self.first(data="Genesis")
    Block.new(0, data, "0")
  end

  def self.next(previous, data="Transaction Data...")
    Block.new(previous.index+1, data, previous.hash)
  end

  private

    attr_reader :index, :timestamp, :data, :previous_hash, :hash, :nonce

    def calculate_hash
      ProofOfWork.new(self).run
    end
end
