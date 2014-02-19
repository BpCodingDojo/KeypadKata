class Dictionary

  def initialize(lexicon)
    @lexicon = lexicon
  end



  def suggested_words_for(word_prefix)
    hits = @lexicon.select{ |word| word.start_with? word_prefix }
    return hits.join " " unless hits.empty?
    ""
  end

end
