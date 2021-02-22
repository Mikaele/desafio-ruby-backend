class Archive < ApplicationRecord

    has_many :transactions, dependent: :destroy   
    mount_uploader :attachment, AttachmentUploader  

    validates :checkhsum,  uniqueness: {message: "Esse arquivo já foi enviado e processado"}

    validates :lines, numericality: { greater_than: 0, message: "Arquivo invalido ou vazio, o arquivo deve ser do tipo .txt" }
    
    before_validation  :set_checksum_and_lines
    after_save  :persist_data_transactions

    attr_accessor :transactions_out

    private

    def set_checksum_and_lines
       if self.attachment_cache !=nil
            # montando o caminho do arquivo em cache
            path = File.join Rails.root ,"public","uploads" , "tmp", self.attachment_cache
            # Criando um hash para evitar duplicidade de arquivo
            checksum = Digest::SHA256.file(path).hexdigest
            self.checkhsum = checksum

            @transactions_out = []

            File.foreach(path) { |line| 
                                    arch = ArchiveReader.new(line)
                                    @transactions_out << arch
                                }
            self.lines =@transactions_out.size
        else
            self.lines=0
        end

    end

    def persist_data_transactions
        @transaction= []
        @transactions_out.each do |t|
            @store = Store.where(name: t.store,
                owner: t.owner,
                cpf: t.cpf).first_or_create          
                                            
            @type_transaction = TypeTransaction.where(id: t.type).first

            @archive = Archive.where(id: self.id).first

                        @transaction << Transaction.new(value: t.value,
                            card: t.card,
                            event_date: t.when_date,
                            event_time: t.when_time,
                            store_id:  @store.id,
                            archive_id: @archive.id,
                            type_transaction_id: t.type)
                           
                   
        end

        Transaction.transaction do
            @transaction.each do |t|
                t.save!
            end
            
            
        end

    end



    
end
