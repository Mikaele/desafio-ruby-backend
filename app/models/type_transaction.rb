class TypeTransaction < ApplicationRecord
    has_many :transactions

    validates_presence_of :description, :kind, :sign


end
