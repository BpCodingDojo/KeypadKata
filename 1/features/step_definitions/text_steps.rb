require_relative '../../lib/keypad'
require_relative '../../lib/dictionary'

Given /^the input "([^"]*)"$/ do |input_text|
  @input_text = input_text
end


When /^I execute a search$/ do
  word_prefix = Keypad.to_text(@input_text)
  lexicon = File.read('../dictionary.txt').split("\n")
  dictionary = Dictionary.new lexicon
  @output_text = dictionary.suggested_words_for word_prefix
end


Then /^the output should be "(.*?)"$/ do |expected_output|
  expect(@output_text).to eq expected_output
end
