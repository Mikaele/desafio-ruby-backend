require 'rails_helper'

RSpec.describe TypeTransaction, type: :model do
  subject {
    described_class.new(description: "Um novo tipo de pagamento",
                        kind: "Entrada",
                        sign: "+")
  }

  it "is valid with valid attributes" do
    expect(subject).to  be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a kind" do
    subject.kind = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a sign" do
    subject.sign = nil
    expect(subject).to_not be_valid
  end

  it "is valid sign" do
    expect(subject).to satisfy {  ["+","-"].include?( subject.sign)}
  end

  it "is invalid sign" do
    subject.sign = "*"
    expect(subject).to_not satisfy {  ["+","-"].include?( subject.sign)}
  end
end