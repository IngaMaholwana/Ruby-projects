def count_presence(string, substring)
  string.downcase!
  substring.downcase!
  substring_len = substring.length
  string_len = string.length
  count = 0
  for i in 0...string_len
    if i + substring_len > string_len
      break
    end
    if string[i...substring_len+i] == substring
      count += 1
    end
  end
  count
end

def substrings(string, substring_array)
  result = substring_array.reduce(Hash.new) do |hash, substring|
    if count_presence(string, substring) > 0
      hash[substring] = count_presence(string, substring)
    end
    hash
  end
  result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)