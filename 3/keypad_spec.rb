require_relative 'keypad'


describe KeypadKata do

  describe "#predict" do

    context "when using a simple dictionary" do
      subject { KeypadKata.new 'simple.txt' }

      [
        {name: 'one single digit input with one match', input: '9', expected: 'w'},
        {name: 'two single digit input with one match', input: '2 3', expected: 'ad'},
        {name: 'two single digit input with one match', input: '8 666', expected: 'to'},
      ].each do |testcase|
        it "should return #{testcase[:expected]} for '#{testcase[:input]}' (#{testcase[:name]})" do
          expect(subject.predict testcase[:input]).to eq testcase[:expected]
        end
      end

      it "should raise an error on non homogeneous number group" do
        expect { subject.predict '700' }.to raise_error ArgumentError
      end


      it "should treat longer groups modulo group length" do
        expect(subject.predict '22222 8').to eq 'bt'
      end

    end
  end

end

describe NumericToTextConverter do

  describe "#convert" do

      [
        {name: 'one single digit input with one match', input: '9', expected: 'w'},
        {name: 'two single digit input with one match', input: '2 3', expected: 'ad'},
        {name: 'two single digit input with one match', input: '8 666', expected: 'to'},
      ].each do |testcase|
        it "should return #{testcase[:expected]} for '#{testcase[:input]}' (#{testcase[:name]})" do
          expect(subject.convert testcase[:input]).to eq testcase[:expected]
        end
      end

      it "should raise an error on non homogeneous number group" do
        expect { subject.convert '700' }.to raise_error ArgumentError
      end


      it "should treat longer groups modulo group length" do
        expect(subject.convert '22222 8').to eq 'bt'
      end

  end

end