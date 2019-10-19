require "example"

RSpec.describe Example do
  subject { Example.new }

  describe "something to use" do
    context "as example" do
      it "change to a real class" do
        expect(subject.change()).to eq("write a real class")
      end
    end
  end
end
