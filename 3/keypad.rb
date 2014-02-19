class KeypadKata

  def initialize(dictionary_path)
    @words = File.readlines(dictionary_path).map { |word| word.strip }
  end



  def predict(input)
    find_in_dictionary convert_input_to_string(input)
  end



  private

  def convert_input_to_string(input)
    NumericToTextConverter.new.convert input
  end



  def find_in_dictionary(prefix)
    @words.drop_while { |word| !word.start_with? prefix }.take_while {|word| word.start_with? prefix }.join ' '
  end

end

class NumericToTextConverter
  CODING_TABLE = {
    '2' => 'abc',
    '3' => 'def',
    '4' => 'ghi',
    '5' => 'jkl',
    '6' => 'mno',
    '7' => 'pqrs',
    '8' => 'tuv',
    '9' => 'wxyz'
  }



  def convert(numbers)
    numbers.split(' ').map do |number|
      validate_number number
      map_number_group_to_letter(number)
    end.join
  end



  private

  def map_number_group_to_letter(digit_group)
    first_digit = digit_group[0]
    letter_position = lookup_position(first_digit, digit_group)
    CODING_TABLE[first_digit][letter_position]
  end



  def lookup_position(digit, digit_group)
    (digit_group.length-1) % CODING_TABLE[digit].length
  end



  def validate_number(number)
    raise ArgumentError.new "Invalid input: #{number}" unless number == number[0] * number.length
  end
end