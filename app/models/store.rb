class Store < ApplicationRecord
    has_many :transactions
    validates_presence_of :name, :owner, :cpf

    attr_accessor :saldo


    after_find do |s|
        c=0
        d=0
        s.transactions.each do |t|
            if t.type_transaction.sign.eql? '+' 
                c = c+ t.value
            elsif t.type_transaction.sign.eql? '-' 
                d = d+ t.value
            end
        end

        @saldo = c-d
        
    end

end
