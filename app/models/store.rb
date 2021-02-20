class Store < ApplicationRecord
    has_many :transactions
    validates_presence_of :name, :owner, :cpf
end
