class IntegerChunks

  attr_accessor :chunks
  attr_reader :integer

  require_relative 'data'

  def initialize(integer)
    @chunks = []
    @integer = integer
  end

  def size_exception?
    
    if chunks.size > BIGS.size
      true
    else
      false
    end

  end

  def to_letters

    @chunks.map { |c| c.to_letters }.zip(BIGS)
           .find_all { |c| c[0] != UNITS[0] }
           .map { |c| c.join ' ' }.reverse.join(' ').strip

  end

  def compose

    while integer != 0
      @integer, remaining = integer.divmod(1000)
      chunks << remaining 
    end

    if size_exception?
      raise ArgumentError, "Integer is way too big (#{chunks.reverse.join})." 
    else
      self
    end

  end

end
