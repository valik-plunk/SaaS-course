def combine_anagrams(words)
    grouped = {}
    words.each do |word|    
        key = word.downcase.split(//).sort!
        grouped[key] = (grouped[key] == nil) ? [word] : (grouped[key] << word)
    end
    res = []
    grouped.each_value do |val|
        res << val
    end
    return res
end

