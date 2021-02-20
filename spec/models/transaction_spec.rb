require 'rails_helper'

RSpec.describe Transaction, type: :model do
     described_class.new(type_transaction: 1,
                        store: 1,
                        value: 20.0,
                        card: "0953928****8614",
                        envet_date: Time.now)
  }

  it "is valid with valid attributes" do
    expect(subject).to  be_valid
  end
end
