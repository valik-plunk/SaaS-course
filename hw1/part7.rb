class CartesianProduct
    include Enumerable
    def initialize(l, r)
        @result = []
        l.each do |x|
            r.each do |y|
                @result.push([x, y])
            end
        end
    end
 
    def each
        @result.each { |i| yield i }
    end
end
