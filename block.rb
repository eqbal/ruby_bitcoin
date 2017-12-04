#  build your own blockchain from scratch in 20 lines of ruby!
#
#  to run use:
#    $ ruby ./block.rb


require "digest"    # for hash checksum digest function SHA256
require "pp"        # for pp => pretty printer


class Block

  attr_reader :index
  attr_reader :timestamp
  attr_reader :data
  attr_reader :previous_hash
  attr_reader :hash

  def initialize(index, data, previous_hash)
    @index         = index
    @timestamp     = Time.now
    @data          = data
    @previous_hash = previous_hash
    @hash          = calc_hash
  end

  def calc_hash
    sha = Digest::SHA256.new
    sha.update( @index.to_s + @timestamp.to_s + @data + @previous_hash )
    sha.hexdigest
  end


  def self.first(data="Genesis")
    Block.new(0, data, "0")
  end

  def self.next(previous, data="Transaction Data...")
    Block.new(previous.index+1, data, previous.hash)
  end

end

