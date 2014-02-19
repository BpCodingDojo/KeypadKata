require_relative 'keypad'


describe KeypadKata do

  describe "#predict" do

    context "when using a simple dictionary" do
      subject { KeypadKata.new 'simple.txt' }

      it "should return w for '9'" do
        expect(subject.predict '9').to eq 'w'
      end


      it "should return ad for '2 3'" do
        expect(subject.predict '2 3').to eq 'ad'
      end

    end
  end

end