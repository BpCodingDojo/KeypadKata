require 'spec_helper'

describe Keypad do

  describe ".to_text" do
    context "when the input contains only a single character encoded in numbers" do
      {
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
      .each do |(number_string, expected_word)|
        it "should convert '#{number_string}' to '#{expected_word}'" do
          expect(subject.to_text number_string).to eq expected_word
        end
      end
    end


    context "when the input contains multiple characters" do
      it "should convert '2 2' to 'aa'" do
        expect(Keypad.to_text '2 2').to eq 'aa'
      end

      it "should convert '7777 666 555 3' to 'sold'" do
        expect(Keypad.to_text '7777 666 555 3').to eq 'sold'
      end
    end
  end


  describe ".t9" do
    it "should convert '2' to ['a', 'b', 'c']" do
      expect(Keypad.t9 '2').to eq ['a', 'b', 'c']
    end
  end
end
