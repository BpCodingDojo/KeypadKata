class KeypadKata

  def initialize(dictionary_path)
    @words = File.readlines(dictionary_path).map { |word| word.strip }
  end



  def predict(input)
    map_numbers(input.split(' ')).join
  end



  private

  def map_numbers(numbers)
    coding_table = {
      '2' => 'a',
      '3' => 'd',
      '4' => 'g',
      '5' => 'j',
      '6' => 'm',
      '7' => 'p',
      '8' => 't',
      '9' => 'w'}

    numbers.map { |number| coding_table[number] }
  end


end