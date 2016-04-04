module Letters

  require_relative 'data'

  def to_letters

    case
    when self < 0
      negatives
    when self < 20
      units
    when self < 100
      tens
    when self < 1000
      hundreds
    else
      bigs
    end

  end

  private

  def negatives
    "#{NEGATIVE} #{(-self).to_letters}"
  end

  def units
    UNITS[self]
  end

  def tens
    division, remaining = self.divmod(10)
    TENS[division] + (remaining == 0 ? "" : "-#{remaining.to_letters}")
  end

  def hundreds
    division, remaining = self.divmod(100)
    "#{UNITS[division]} hundred" + (remaining == 0 ? "" : " #{AND} #{remaining.to_letters}")
  end

  def bigs
    IntegerChunks.new(self).compose.to_letters
  end

end

class Integer
  include Letters
end