class Archive < ApplicationRecord

    has_many :transactions   
    mount_uploader :attachment, AttachmentUploader  

    validates :checkhsum,  uniqueness: {message: "Esse arquivo já foi enviado e processado"}


    before_validation  :set_checksum_and_lines
    after_save  :persist_data_transactions

    attr_accessor :transactions_out

    private

    def set_checksum_and_lines
        # montando o caminho do arquivo em cache
        path = File.join Rails.root ,"public","uploads" , "tmp", self.attachment_cache
        # Criando um hash para evitar duplicidade de arquivo
        checksum = Digest::MD5.file(path).base64digest
        self.checkhsum = checksum

        @transactions_out = []

        File.foreach(path) { |line| 
                                arch = ArchiveReader.new(line)
                                @transactions_out << arch
                            }
        self.lines =@transactions_out.size

    end

    def persist_data_transactions
        @transactions_out.each do |t|
            @store = Store.where(name: t.store,
                owner: t.owner,
                cpf: t.cpf).first_or_create          
                                            
            @type_transaction = TypeTransaction.where(id: t.type).first

            @archive = Archive.where(id: self.id).first

            if @store
                if @type_transaction
                    if @archive
                        @transaction = Transaction.new(value: t.value,
                            card: t.card,
                            event_date: t.when,
                            store:  @store,
                            archive: @archive,
                            type_transaction: @type_transaction)
                        @transaction.save
                    end
                end
            end
        end
    end



    
end
