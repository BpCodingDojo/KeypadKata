require_relative 'keypad'


describe KeypadKata do

  describe "#predict" do

    context "when using a simple dictionary" do
      subject { KeypadKata.new 'simple.txt' }

      [
        {name: 'one single digit input with one match', input: '9', expected: 'w'},
        {name: 'two single digit input with one match', input: '2 3', expected: 'ad'},
      ].each do |testcase|
        it "should return #{testcase[:expected]} for '#{testcase[:input]}' (#{testcase[:name]})" do
          expect(subject.predict testcase[:input]).to eq testcase[:expected]
        end
      end

    end
  end

end