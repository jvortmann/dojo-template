require "placeholder"

RSpec.describe Placeholder do
  subject { Placeholder.new }

  describe "something to place" do
    context "holder" do
      it "change to a real class" do
        expect(subject.change()).to eq("write a real class")
      end
    end
  end
end
