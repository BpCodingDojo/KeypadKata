require 'spec_helper'

describe Dictionary do

  describe "#suggested_words_for" do
    context "when initialized with a single word" do
      let(:subject) { Dictionary.new(["apple"]) }

      it "should return the word if it's contained in the lexicon" do
        expect(subject.suggested_words_for "apple").to eq "apple"
      end

      it "should return an empty string if the word isn't contained in the lexicon" do
        expect(subject.suggested_words_for "pear").to eq ""
      end

      it "should return the word if searching for a prefix" do
        expect(subject.suggested_words_for "app").to eq "apple"
      end
    end

    context "when initialized with a single word" do
      let(:subject) { Dictionary.new(["apple", "appletree"]) }

      it "should return all the words if searching for a prefix" do
        expect(subject.suggested_words_for "app").to eq "apple appletree"
      end
    end
  end

end
