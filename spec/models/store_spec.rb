require 'rails_helper'

RSpec.describe Store, type: :model do
  subject {
    described_class.new(name: "Loja Teste",
                        owner: "Tester da Silva",
                        cpf: "09539288614")
  }

  it "is valid with valid attributes" do
    expect(subject).to  be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a owner" do
    subject.owner = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a cpf" do
    subject.cpf = nil
    expect(subject).to_not be_valid
  end
end
