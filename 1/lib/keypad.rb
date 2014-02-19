module Keypad

  SIMPLE_KEYPAD = {
    '2' => 'a',
    '3' => 'd',
    '4' => 'g',
    '5' => 'j',
    '6' => 'm',
    '7' => 'p',
    '8' => 't',
    '9' => 'w',
    '22' => 'b',
    '33' => 'e',
    '44' => 'h',
    '55' => 'k',
    '66' => 'n',
    '77' => 'q',
    '88' => 'u',
    '99' => 'x',
    '222' => 'c',
    '333' => 'f',
    '444' => 'i',
    '555' => 'l',
    '666' => 'o',
    '777' => 'r',
    '888' => 'v',
    '999' => 'y',
    '7777' => 's',
    '9999' => 'z',
  }

  T9_KEYPAD = {
    '2' => ['a', 'b', 'c']
  }


  def self.to_text(number_string)
    number_string.split(" ").map { |encoded_character| decode_character encoded_character }.join
  end



  def self.t9(number_string)
    T9_KEYPAD[number_string]
  end



  private

  def self.decode_character(encoded_character_string)
    SIMPLE_KEYPAD[encoded_character_string]
  end

end
