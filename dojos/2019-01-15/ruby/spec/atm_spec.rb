require "atm"

RSpec.describe ATM do
  subject { ATM.new }

  describe "client wants to withdraw" do
    context "when value is 30" do
      it "gets a 20 bill and a 10 bill" do
        expect(subject.withdraw(30)).to match_array([[1, 20], [1, 10]])
      end
    end

    context "when value is 80" do
      it "gets a 50 bill, a 20 bill and a 10 bill" do
        expect(subject.withdraw(80)).to match_array([[1,50], [1,20], [1,10]])
      end
    end

    context "when value is 400" do
      it "gets 4 100 bill" do
        expect(subject.withdraw(400)).to match_array([[4,100]])
      end
    end

    context "when value is 15" do
      it "throws error" do
        expect{subject.withdraw(15)}.to raise_error
      end
    end
  end
end
