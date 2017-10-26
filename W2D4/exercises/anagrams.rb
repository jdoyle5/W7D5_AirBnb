def first_anagram?(word, dictionary)
  poss_anag = word.chars.permutation
  anag_words = poss_anag.map(&:join)
  anag_words.each do |anag|
    return true if dictionary.include?(anag)
  end
  false
end

def second_anagram?(word, dictionary)
  split_word = word.split('')
  split_dictionary = dictionary.split('')

  dictionary.chars.each_with_index do |letter, idx|
    delete_idx = split_word.index(letter)
    split_word.delete_at(delete_idx)
    split_dictionary.delete_at(0)
  end

  return true if split_dictionary.empty? && split_word.empty?
  false
end

def third_anagram?(word, dictionary)
  word.chars.sort == dictionary.chars.sort
end

def fourth_anagram?(word, dictionary)
  word_hash = Hash.new(0)
  dictionary_hash = Hash.new(0)

  word.chars.each do |chr|
    word_hash[chr] += 1
  end

  dictionary.chars.each do |chr|
    dictionary_hash[chr] += 1
  end

  word_hash.all? { |k, v| dictionary_hash[k] == v }
end

def fifth_anagram?(word, dictionary)
  word_hash = Hash.new(0)
  word.chars.each do |chr|
    word_hash[chr] += 1
  end

  word_hash.keys.all? { |letter| word_hash[letter] == dictionary.count(letter) }
end

p fifth_anagram?('elvis', 'lives')
