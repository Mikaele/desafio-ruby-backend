class Transaction < ApplicationRecord
    belongs_to :store
    belongs_to :type_transaction
    belongs_to :archive


    validates_presence_of :description, :kind, :sign


end
