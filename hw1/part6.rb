class Numeric
  @@currencies = {:dollar => 1, :yen => 0.013, :euro => 1.292, :rupee => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '').to_sym
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(destination_currency)
    destination_currency = destination_currency.to_s.gsub(/s$/, '').to_sym
    if @@currencies.has_key?(destination_currency)
      self / @@currencies[destination_currency]
    else
      super 
    end
  end
end

class String
  def palindrome?
    letters = self.downcase.scan(/\w/)
    letters == letters.reverse
  end
end

module Enumerable
  def palindrome?
    return false unless self.respond_to?(:each)
    #str = self.join
    #letters = str.downcase.scan(/\w/)
    #letters == letters.reverse
    x = self.each.collect do |i| i end.to_s.gsub(/\W?/,'').downcase
    return x.eql? x.reverse
  end
end

