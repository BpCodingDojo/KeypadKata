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
      '2' => 'abc',
      '3' => 'def',
      '4' => 'ghi',
      '5' => 'jkl',
      '6' => 'mno',
      '7' => 'pqrs',
      '8' => 'tuv',
      '9' => 'wxyz'}

    numbers.map do |number|
      coding_table[number[0]][number.length-1]
    end
  end


end