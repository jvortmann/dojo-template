require "hello_world"

RSpec.describe HelloWorld do
  describe "saying it out loud" do
    context "when requested" do
      subject { HelloWorld.new }

      it "says what it needs" do
        expect(subject.say_it).to eq("hello world")
      end
    end
  end
end
